package com.main.controller.api;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.main.controller.mn.phim.ManagementController;
import com.main.model.Phim;
import com.main.repository.PhimRepository;
import com.utils.PhimExcelExporter;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class APIExcel {

	@Autowired
	ServletContext app;
	@Autowired
	PhimRepository phimRepository;
	private static final Logger logger = LogManager.getLogger(ManagementController.class);

	@GetMapping("animu/api/export/Excel")
	public void exportExcel(HttpServletResponse response) {
		logger.info("Bắt đầu xuất phim ra file Excel.");
		try {
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
			String headerKey = "Content-Disposition";
			String headerValue = "attachment; filename=phim_" + new Date().getTime() + ".xlsx";
			response.setHeader(headerKey, headerValue);

			List<Phim> listPhim = phimRepository.findAll();
			PhimExcelExporter excelExporter = new PhimExcelExporter(listPhim);

			excelExporter.export(response);
			logger.info("Xuất phim ra file Excel thành công.");
		} catch (Exception e) {
			logger.error("Lỗi khi xuất phim ra file Excel: {}", e.getMessage(), e);
		}
	}

	// import file

	@PostMapping("/animu/api/import/Excel")
	public void importPhim(@RequestParam("file") MultipartFile file, Model model) {
		logger.info("Bắt đầu import phim từ file: {}", file.getOriginalFilename());
		Set<Integer> duplicatedIds = new HashSet<>(); // Tạo tập hợp để lưu trữ các id bị trùng lặp

		if (!file.isEmpty()) {
			try {
				// Ghi thông tin file
				System.out.println("Đã nhận file: " + file.getOriginalFilename());
				System.out.println("Kích thước file: " + file.getSize());
				String uploadDir = System.getProperty("user.dir") + "/phimdatafile/";

				// Tạo thư mục nếu nó không tồn tại
				File directory = new File(uploadDir);
				if (!directory.exists()) {
					directory.mkdirs();
				}

				// Tạo và lưu file vào thư mục lưu trữ
				File convFile = new File(uploadDir + file.getOriginalFilename());
				file.transferTo(convFile);
				System.out.println("File đã được lưu tại: " + convFile.getAbsolutePath());
				logger.info("File đã được lưu tại: {}", convFile.getAbsolutePath());

				List<Phim> phimList = parseExcelFile(convFile);

				for (Phim phim : phimList) {
					System.out.println("Phim: " + phim.getTieude());
					if (phimRepository.findById(phim.getIdphim()).isEmpty()) {
						phimRepository.save(phim);
						logger.info("Đã thêm phim: {}", phim.getTieude());
					} else {
						duplicatedIds.add(phim.getIdphim()); // Thêm id bị trùng vào danh sách
						System.out.println("Phim với id " + phim.getIdphim() + " đã tồn tại. Bỏ qua.");
						logger.warn("Phim với ID {} đã tồn tại. Bỏ qua.", phim.getIdphim());
					}
				}
				if (duplicatedIds.isEmpty()) {
					model.addAttribute("message", "Phim đã được nhập thành công!");
					logger.info("Import phim thành công.");
				} else {
					model.addAttribute("message",
							"Phim đã được nhập thành công, nhưng các id sau đã tồn tại: " + duplicatedIds);
					logger.warn("Import phim thành công với các ID trùng lặp: {}", duplicatedIds);
				}
			} catch (Exception e) {
				e.printStackTrace(); // In ra stack trace để kiểm tra lỗi
				logger.error("Lỗi khi import phim: {}", e.getMessage(), e);
				model.addAttribute("message", "Đã xảy ra lỗi khi nhập phim: " + e.getMessage());
			}
		} else {
			logger.warn("Không có file để import.");
			model.addAttribute("message", "File rỗng!");
		}
	}

	// xử lý dữ liệu excel
	private List<Phim> parseExcelFile(File file) throws IOException {
		logger.info("Bắt đầu phân tích file Excel: {}", file.getName());
		List<Phim> phimList = new ArrayList<>();
		FileInputStream fis = new FileInputStream(file);

		try (XSSFWorkbook workbook = new XSSFWorkbook(fis)) {
			XSSFSheet sheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = sheet.iterator();

			// Bỏ qua hàng tiêu đề
			rowIterator.next();
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();
				Phim phim = new Phim();
				boolean validRow = true; // Đánh dấu hàng hợp lệ

				try {
					// Kiểm tra và gán giá trị idphim
					if (row.getCell(0) != null && row.getCell(0).getCellType() == CellType.NUMERIC) {
						int idphim = (int) row.getCell(0).getNumericCellValue();
						if (idphim <= 0) {
							validRow = false; // idphim không hợp lệ
							logger.warn("Lỗi: idphim không hợp lệ ở hàng {}, idphim: {}", row.getRowNum(), idphim);
						} else {
							phim.setIdphim(idphim);
						}
					} else {
						validRow = false; // Không có giá trị idphim hoặc idphim không phải là số
						logger.warn("Lỗi: idphim không hợp lệ ở hàng {}", row.getRowNum());
					}

					// Kiểm tra và gán giá trị tiêu đề
					if (row.getCell(1) != null && row.getCell(1).getCellType() == CellType.STRING) {
						phim.setTieude(row.getCell(1).getStringCellValue());
					} else {
						validRow = false; // Không có tiêu đề
						logger.warn("Lỗi: tiêu đề không hợp lệ ở hàng {}", row.getRowNum());
					}

					// Kiểm tra và gán giá trị slug
					if (row.getCell(2) != null && row.getCell(2).getCellType() == CellType.STRING) {
						phim.setSlug(row.getCell(2).getStringCellValue());
					}
					// Kiểm tra và gán giá trị thumb_url
					if (row.getCell(4) != null && row.getCell(4).getCellType() == CellType.STRING) {
						phim.setThumb_url(row.getCell(4).getStringCellValue());
					}
					// Kiểm tra và gán giá trị poster_url
					if (row.getCell(5) != null && row.getCell(5).getCellType() == CellType.STRING) {
						phim.setPoster_url(row.getCell(5).getStringCellValue());
					}
					// Kiểm tra và gán giá trị ngày tạo
					if (row.getCell(3) != null) {
						try {
							// LocalDate currentDate = LocalDate.now();
							phim.setNgaytao(new Date());
						} catch (Exception e) {
							logger.error("Lỗi khi xử lý ngày ở hàng {}: {}", row.getRowNum(), e.getMessage());
							phim.setNgaytao(new Date()); // Đặt ngày hiện tại nếu không thể đọc ngày
						}
					}

					// Kiểm tra và gán giá trị active
					if (row.getCell(6) != null && row.getCell(6).getCellType() == CellType.STRING) {
						String activeStr = row.getCell(6).getStringCellValue();
						boolean isActive = "true".equalsIgnoreCase(activeStr) || "yes".equalsIgnoreCase(activeStr)
								|| "online".equalsIgnoreCase(activeStr);
						phim.setActive(isActive);
					}

					// Chỉ thêm phim vào danh sách nếu hàng hợp lệ
					if (validRow) {
						logger.info("Đã phân tích phim: {}", phim);
						phimList.add(phim);
					} else {
						logger.warn("Bỏ qua hàng {} do lỗi dữ liệu.", row.getRowNum());
					}

				} catch (Exception e) {
					logger.error("Lỗi khi phân tích hàng ở chỉ số {}: {}", row.getRowNum(), e.getMessage());
				}
			}
		} catch (IOException e) {
			logger.error("Lỗi khi mở workbook hoặc sheet: {}", e.getMessage());
		} finally {
			fis.close();
		}

		logger.info("Kết thúc phân tích file Excel.");
		return phimList;
	}
}
