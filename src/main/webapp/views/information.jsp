<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Video Page</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="styles.css" />
    <script src="/js/js.js"></script>
    <style>
      .badge-purple {
        background-color: #6f42c1;
        color: #fff;
      }

      .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }

      img {
        border-radius: 8px;
      }

      .btn-outline-secondary {
        margin-right: 5px;
        margin-bottom: 5px;
      }
      .card-custom {
        position: relative;
        color: white;
        border: none;
      }
      .card-custom img {
        width: 100%;
        height: auto;
      }
      .card-custom .text-container {
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100px;
        background: linear-gradient(to top, rgba(0, 0, 0, 1), rgba(0, 0, 0, 0));
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .card-custom .card-title {
        position: absolute;
        bottom: 30px;
        left: 10px;
        font-size: 24px;
        font-weight: bold;
        padding: 5px;
      }
      .card-custom .card-info {
        position: absolute;
        bottom: 10px;
        left: 10px;
        font-size: 16px;
        padding: 5px;
      }
      .card-custom .view-count {
        position: absolute;
        bottom: 10px;
        right: 10px;
        font-size: 16px;
        padding: 5px;
      }
      .badge-info {
        position: absolute;
        left: 0;
        margin-left: 25px;
      }
      .type span {
        color: black;
        background-color: rgb(207, 203, 203);
        border-radius: 10px;
        padding: 5px 10px;
        margin: 5px;
        display: inline-block;
        font-size: 14px;
        font-weight: 500;
      }
    </style>
  </head>
  <body>
    <section>
      <div class="container mt-4">
        <div class="row">
          <div class="col-md-8">
            <div class="embed-responsive embed-responsive-16by9">
              <video class="embed-responsive-item" controls>
                <source
                  src="https://sing.phimmoi.net/cc80fc95c171c47ad6b2745c74ebcdf2/hls.m3u8"
                  type="video/mp4"
                />
                Your browser does not support the video tag.
              </video>
            </div>
            <h4 class="mt-3">TSUKI GA MICHIBIKU ISEKAI DOUCHUU TẬP 34</h4>
            <p>2,780,844 lượt xem</p>
            <div>
              <button class="btn btn-danger mr-2">
                Thích <span class="badge badge-light">4199</span>
              </button>
              <button class="btn btn-success">
                Theo dõi <span class="badge badge-light">4303</span>
              </button>
            </div>
          </div>
          <div class="col-md-4">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item">
                <a
                  class="nav-link active"
                  id="episodes-tab"
                  data-toggle="tab"
                  href="#episodes"
                  role="tab"
                  aria-controls="episodes"
                  aria-selected="true"
                  >DANH SÁCH TẬP</a
                >
              </li>
              <li class="nav-item">
                <a
                  class="nav-link"
                  id="comments-tab"
                  data-toggle="tab"
                  href="#comments"
                  role="tab"
                  aria-controls="comments"
                  aria-selected="false"
                  >BÌNH LUẬN</a
                >
              </li>
            </ul>
            <div class="tab-content" id="myTabContent">
              <div
                class="tab-pane fade show active"
                id="episodes"
                role="tabpanel"
                aria-labelledby="episodes-tab"
              >
                <div class="list-group mt-3">
                  <div
                    class="d-flex justify-content-between align-items-center mb-2 row"
                  >
                  <div class="col-md-6">
                    <select class="form-control form-control-sm w-auto">
                        <option>Season 2</option>
                      </select>
                  </div>
                    
                   <div class="col-md-6 d-flex">
                    <span class="form-label" style="margin-right: 10px !important; margin-left: 20px !important;">Tập</span>
                    <input
                      type="input"
                      class="form-control form-control-sm w-50"
                    />
                   </div>
                    
                  </div>
                  <a
                    href="#"
                    class="list-group-item-action row d-flex m-0 mb-3"
                  >
                    <div class="col-md-6">
                      <img
                        src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
                        class="img-fluid"
                        alt="..."
                      />
                    </div>
                    <div class="col-md-6">
                      <h6 class="mb-1 fs-5">
                        Tập 13 - Ế? Trăng trên thành hoang
                      </h6>
                      <small class="text-muted">62,048 lượt xem</small>
                    </div>
                  </a>

                  <a
                  href="#"
                  class="list-group-item-action row d-flex m-0 mb-3"
                >
                  <div class="col-md-6">
                    <img
                      src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
                      class="img-fluid"
                      alt="..."
                    />
                  </div>
                  <div class="col-md-6">
                    <h6 class="mb-1 fs-5">
                      Tập 13 - Ế? Trăng trên thành hoang
                    </h6>
                    <small class="text-muted">62,048 lượt xem</small>
                  </div>
                </a>
                <a
                href="#"
                class="list-group-item-action row d-flex m-0 mb-3"
              >
                <div class="col-md-6">
                  <img
                    src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
                    class="img-fluid"
                    alt="..."
                  />
                </div>
                <div class="col-md-6">
                  <h6 class="mb-1 fs-5">
                    Tập 13 - Ế? Trăng trên thành hoang
                  </h6>
                  <small class="text-muted">62,048 lượt xem</small>
                </div>
              </a>
              <a
              href="#"
              class="list-group-item-action row d-flex m-0 mb-3"
            >
              <div class="col-md-6">
                <img
                  src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
                  class="img-fluid"
                  alt="..."
                />
              </div>
              <div class="col-md-6">
                <h6 class="mb-1 fs-5">
                  Tập 13 - Ế? Trăng trên thành hoang
                </h6>
                <small class="text-muted">62,048 lượt xem</small>
              </div>
            </a>
            <a
            href="#"
            class="list-group-item-action row d-flex m-0 mb-3"
          >
            <div class="col-md-6">
              <img
                src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
                class="img-fluid"
                alt="..."
              />
            </div>
            <div class="col-md-6">
              <h6 class="mb-1 fs-5">
                Tập 13 - Ế? Trăng trên thành hoang
              </h6>
              <small class="text-muted">62,048 lượt xem</small>
            </div>
          </a>
          <a
          href="#"
          class="list-group-item-action row d-flex m-0 mb-3"
        >
          <div class="col-md-6">
            <img
              src="https://s199.imacdn.com/vg/2024/01/08/218ef6df39849c3f_44cedafc5b3fd361_26859170472646363.jpg"
              class="img-fluid"
              alt="..."
            />
          </div>
          <div class="col-md-6">
            <h6 class="mb-1 fs-5">
              Tập 13 - Ế? Trăng trên thành hoang
            </h6>
            <small class="text-muted">62,048 lượt xem</small>
          </div>
        </a>
                </div>
              </div>
              <div
                class="tab-pane fade"
                id="comments"
                role="tabpanel"
                aria-labelledby="comments-tab"
              >
                <div class="mt-3">
                  <!-- Bình luận mẫu -->
                  <div class="media mb-3">
                    <img
                      src="user1.jpg"
                      class="mr-3 rounded-circle"
                      alt="User 1"
                      width="50"
                    />
                    <div class="media-body">
                      <h5 class="mt-0">Người dùng 1</h5>
                      Bình luận mẫu 1
                    </div>
                  </div>
                  <div class="media mb-3">
                    <img
                      src="user2.jpg"
                      class="mr-3 rounded-circle"
                      alt="User 2"
                      width="50"
                    />
                    <div class="media-body">
                      <h5 class="mt-0">Người dùng 2</h5>
                      Bình luận mẫu 2
                    </div>
                  </div>
                  <!-- Thêm bình luận tại đây -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section>
      <div class="container mt-4">
        <div class="row">
          <div class="col-md-3">
            <img
              src="https://s199.imacdn.com/vg/2024/03/25/a8235be4fd7333c6_5fc9b5512909fd0e_14036517113797838118684.jpg"
              class="img-fluid"
              alt="Poster"
            />
            <div class="badge badge-info mt-2">37 tập</div>
          </div>
          <div class="col-md-9">
            <h1>Nguyệt Đạo Dị Giới</h1>
            <div class="mb-2">
              <span class="badge badge-danger">Hành Động</span>
              <span class="badge badge-warning">Viễn Tưởng</span>
              <span class="badge badge-success">Hài Hước</span>
              <span class="badge badge-primary">Chuyển Sinh</span>
              <span class="badge badge-secondary">Phiêu Lưu</span>
            </div>
            <div class="mb-3">
              <span class="badge badge-purple">VuiGhe Sub</span>
            </div>
            <p>
              Makoto Misumi chỉ là một học sinh trung học bình thường sống một
              cuộc sống bình thường, nhưng đột nhiên bị triệu hồi đến thế giới
              khác để trở thành một "anh hùng". Tuy nhiên, nữ thần của thế giới
              đó đã lăng mạ anh ta vì sự khác biệt và tước bỏ danh hiệu "anh
              hùng" của anh ta, trước khi tổng cổ anh ta đến vùng hoang dã ở rìa
              thế giới. Khi đi lang thang trong vùng hoang dã, Makoto chạm trán
              với rồng, nhện, Orc, người lùn và đủ loại bộ tộc không phải con
              người. Bởi vì Makoto đến từ một thế giới khác, anh ta có thể giải
              phóng sức mạnh ma thuật và kỹ năng chiến đấu ngoài sức tưởng
              tượng. Nhưng anh ấy sẽ xử lý...
            </p>
            <div class="row">
              <div class="col-md-4">
                <img src="thumbnail1.jpg" class="img-fluid" alt="Thumbnail 1" />
              </div>
              <div class="col-md-4">
                <img src="thumbnail2.jpg" class="img-fluid" alt="Thumbnail 2" />
              </div>
              <div class="col-md-4">
                <img src="thumbnail3.jpg" class="img-fluid" alt="Thumbnail 3" />
              </div>
            </div>
          </div>
          <div class="mt-3 type">
            <span>Nguyệt Đạo Dị Giới</span>
            <span>Tsuki ga Michibiku Isekai Douchuu</span>
            <span>Tsuki ga Michibiku Isekai Douchuu Vietsub</span>
            <span>Tsuki ga Michibiku Isekai Douchuu HD</span>
            <span>tập 34</span>
            <span>Tsuki ga Michibiku Isekai Douchuu tập mới nhất</span>
            <span>Nguyệt đạo dị giới</span>
            <span>Season 1</span>
            <span>Season 2</span>
          </div>
        </div>
      </div>
    </section>

    <section class="container mt-4">
      <h3 class="text-danger">HÔM NAY XEM GÌ</h3>
      <div class="row mt-4">
        <!-- Anime cards -->
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <a href="#" class="text-decoration-none text-white">
              <img
                src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
                alt="Card image"
              />
              <div class="text-container">
                <div class="card-title" style="font-size: 17px">
                  Dead Dead Demons Dededede...
                </div>
                <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
                <div class="view-count" style="font-size: 13px">
                  3,997 lượt xem
                </div>
              </div>
            </a>
          </div>
        </div>

        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-3 mb-4">
          <div class="card card-custom">
            <img
              src="https://s199.imacdn.com/vg/2024/05/26/e3f1d897b816c318_dd7783b348c0b28e_76030171673736133.jpg"
              alt="Card image"
            />
            <div class="text-container">
              <div class="card-title" style="font-size: 17px">
                Dead Dead Demons Dededede...
              </div>
              <div class="card-info" style="font-size: 13px">1 / 18 tập</div>
              <div class="view-count" style="font-size: 13px">
                3,997 lượt xem
              </div>
            </div>
          </div>
        </div>
        <!-- Thêm các thẻ khác nếu cần -->
      </div>
    </section>
    <!-- Bootstrap JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  </body>
</html>
