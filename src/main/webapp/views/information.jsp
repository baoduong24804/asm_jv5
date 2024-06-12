<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Video Page</title>
      <!-- Bootstrap CSS -->
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
      <link rel="stylesheet" href="styles.css" />
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

      <script src="https://kit.fontawesome.com/11f5ba3935.js" crossorigin="anonymous"></script>
      <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
      <script type="text/javascript" src="/js/index.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
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
                <div class="video-container">
                  <iframe id="watchvideo" src="" frameborder="0" allowfullscreen></iframe>
                </div>
              </div>
              <span id="watching" class="text-success" style="font-size: 20px;">Vui lòng chọn tập phim muốn xem</span>
              <h4 class="mt-3">${phim.tieude}</h4>

              <div>
                <button class="btn btn-danger mr-2" id="btn-like">
                  <div id="like-status">${like ? 'Đã thích' : 'Thích'}</div>
                </button>

              </div>
            </div>
            <div class="col-md-4">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="episodes-tab" data-toggle="tab" href="#episodes" role="tab"
                    aria-controls="episodes" aria-selected="true">DANH SÁCH TẬP</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="comments-tab" data-toggle="tab" href="#comments" role="tab"
                    aria-controls="comments" aria-selected="false">BÌNH LUẬN</a>
                </li>
              </ul>
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="episodes" role="tabpanel" aria-labelledby="episodes-tab">
                  <div class="list-group mt-3">
                    <div class="d-flex justify-content-between align-items-center mb-2 row">
                      <div class="col-md-6">
                        <select class="form-control form-control-sm w-auto">
                          <option>Season 1</option>
                        </select>
                      </div>

                      <div class="col-md-6 d-flex">
                        <span class="form-label"
                          style="margin-right: 10px !important; margin-left: 20px !important;">Tổng</span>
                        <input type="text" class="form-control form-control-sm w-50" value="${listTapPhim.size()}" />
                      </div>

                      <c:forEach items="${listTapPhim}" var="tap">

                        <div class="mt-1 btn-tap col-md-12">

                          <a data-toggle="${tap.link}" class="list-group-item-action row d-flex m-0 list-tap">
                            <div class="col-md-6">
                              <img src="${tap.link2}" class="img-fluid" alt="..." style="max-height: 120px;" />
                            </div>
                            <div class="col-md-6">
                              <h6 id="tentap" class="mb-1 fs-5">
                                ${tap.tentap}
                              </h6>

                            </div>
                          </a>
                        </div>




                      </c:forEach>



                    </div>
                  </div>
                </div>

                <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments-tab">

                  <div class="mt-3">
                    <!-- Bình luận mẫu -->
                    <c:forEach items="${helpcTietNguoiDung}" var="ctnguoidung">
                      <div class="media mb-3">

                        <div class="media-body">
                          <c:if test="${ctnguoidung.cmt != ''}">
                            <img src="${ctnguoidung.img}" class="mr-3 rounded-circle" width="30px" height="30px" />
                            <h5 class="mb-1">${ctnguoidung.username}</h5>
                            <p>${ctnguoidung.cmt}</p>
                          </c:if>

                        </div>
                      </div>

                    </c:forEach>


                    <form>
                      <textarea style="width: 100%;" name="cmt" id="cmt"></textarea>
                      <br>
                      <button type="button" id="btn-cmt">Bình luận</button>
                    </form>

                    <!-- Thêm bình luận tại đây -->


                  </div>



                </div>

              </div>
            </div>
          </div>
        </div>
      </section>
      <c:if test="${not empty phim}">
        <section>
          <div class="container mt-4">
            <div class="row">
              <div class="col-md-3">
                <img src="${phim.poster_url}" class="img-fluid" alt="Poster" />

              </div>
              <div class="col-md-9">
                <h1>${phim.tieude}</h1>
                <!--
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
                -->

                <p>
                  ${phim.chitietphim.mota}
                </p>
                <div class="row">

                </div>
              </div>
              <div class="mt-3 type">

              </div>
            </div>
          </div>
        </section>
      </c:if>



      <script>
        function getAPI(url, callback) {
          $.ajax({
            url: url,
            type: "GET",
            success: function (result) {
              callback(result);
            }
          });
        }
        $(document).ready(function () {

          $('#btn-like').off('click').click(function () {

            $.get('/animu/listmovie/information/like', function (response) {
              //console.log('Server response:', response);
              var status = document.getElementById('like-status');
              var text = status.innerHTML;
              if (text == 'Thích') {
                status.innerText = 'Đã thích';
                // console.log(1);
              } else {
                status.innerText = 'Thích';
                // console.log(0);
              }
              //console.log(status);
            });
          });

          $('#btn-cmt').off('click').click(function () {
            var cmt = $('#cmt').val();
            $.get('/animu/listmovie/information/cmt', { cmt: cmt }, function (response) {
              console.log('Server response:', response);
            });
          });

          $('.list-tap').off('click').click(function () {
            var text = $(this).find('#tentap').text();

            $('#watchvideo').attr('src', '');
            var link = $(this).attr('data-toggle');
            $('#watchvideo').attr('src', link);
            $('#watching').text(text);

          });
        });
      </script>

    </body>

    </html>