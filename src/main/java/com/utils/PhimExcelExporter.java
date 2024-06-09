package com.utils;



import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.main.model.Phim;

import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;


public class PhimExcelExporter {
	private XSSFWorkbook workbook;
	private Sheet sheet;
	private List<Phim> listPhim;

	public PhimExcelExporter(List<Phim> listPhim) {
		this.listPhim = listPhim;
		workbook = new XSSFWorkbook();
	}

	private void writeHeaderLine() {
		sheet = workbook.createSheet("Phim");

		Row row = sheet.createRow(0);

		CellStyle style = workbook.createCellStyle();
		XSSFFont font = workbook.createFont();

		font.setBold(true);
		font.setFontHeight(16);
		style.setFont(font);

		createCell(row, 0, "ID Phim", style);
		createCell(row, 1, "Tiêu đề", style);
		createCell(row, 2, "Slug", style);
		createCell(row, 3, "Ngày tạo", style);
		createCell(row, 4, "Thumb URL", style);
		createCell(row, 5, "Poster URL", style);
		createCell(row, 6, "Active", style);
		
	}
	
	private void createCell(Row row, int columnCount, Object value, CellStyle style) {
		sheet.autoSizeColumn(columnCount);
		Cell cell = row.createCell(columnCount);
		if(value instanceof Integer) {
			cell.setCellValue((Integer) value);
		}else if(value instanceof Boolean){
			cell.setCellValue((Boolean) value);
		}else {
			cell.setCellValue((String) value);
		}
		cell.setCellStyle(style);
	}
	
	private void writeDataLines() {
	    int rowCount = 1;
	    
	    CellStyle style = workbook.createCellStyle();
	    XSSFFont font = workbook.createFont();
	    font.setFontHeight(14);
	    style.setFont(font);
	    
	    for (Phim phim : listPhim) {
	        Row row = sheet.createRow(rowCount++);
	        int columnCount = 0;
	        createCell(row, columnCount++, phim.getIdphim(), style);
	        createCell(row, columnCount++, phim.getTieude(), style);
	        createCell(row, columnCount++, phim.getSlug(), style);

	        // Kiểm tra giá trị ngaytao trước khi gọi toString()
	        
	        String ngaytaoStr = (phim.getNgaytao() != null) ? Utils.dateToString(phim.getNgaytao(), "dd/MM/yyyy") : "N/A";
	        createCell(row, columnCount++, ngaytaoStr, style);
	        createCell(row, columnCount++, phim.getThumb_url(), style);
	        createCell(row, columnCount++, phim.getPoster_url(), style);
	        createCell(row, columnCount++, phim.isActive(), style);
	    }
	}
	public void export(HttpServletResponse response) throws IOException{
		writeHeaderLine();
		writeDataLines();
		ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
	}
}
