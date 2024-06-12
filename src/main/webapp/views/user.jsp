<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Trang Chủ</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"></script>

    </head>
    <style>
      .form-container {
        display: none;
      }

      .video-clip {
        width: 300px;
      }

      .video-clip img {
        border-radius: 10px;
      }

      .multiline-ellipsis {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
        text-overflow: ellipsis;
        max-height: 3em;
        line-height: 1.5em;
      }

      .search-container {
        display: flex;
        align-items: center;
        border-bottom: 1px solid #ccc;
        padding: 5px 0;
      }

      .search-container input[type="text"] {
        border: none;
        outline: none;
        background-color: transparent;
        color: #ccc;
        width: 100%;
        margin-left: 5px;
      }

      .search-container input[type="text"]::placeholder {
        color: #ccc;
      }

      .search-icon {
        fill: black;
      }

      .menu-user {
        position: fixed;
        top: 0;
        left: 0;
        width: 250px;
        height: 100%;
        background-color: #fff;
        z-index: 1000;
      }

      .menu-header {
        position: fixed;
        top: 0;
        left: 12px;
        width: 100%;
        z-index: 1000;
        background-color: #fff;
      }
    </style>

    <body>
      <!-- HEADER -->
      <aside class="col-md-3 bg text-black menu-user" style="border-right: 1px solid; border-bottom: 1px solid;">
        <div class="row mt-4 ms-2">
          <div class="col-md-2">
            <img id="img" draggable="false" class="style-scope yt-img-shadow rounded-circle" height="50" width="50"
              alt="" src="${useredit.img}">
          </div>
          <div class="col-md-10 fw-bold">
            <a href="#" class="text-decoration-none text-black" style="margin-left: 10px;">
              <span>${useredit.username}</span></a>
          </div>
        </div>
        <div class="row mt-3 ms-2">
          <div class="col-md-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
              class="bi bi-file-earmark-person" viewBox="0 0 16 16">
              <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
              <path
                d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5z" />
            </svg>
          </div>
          <div class="col-md-10 fw-bold">
            <a href="#" class="text-black text-decoration-none" data-form="form1" style="margin-left: 5px;"><span>Thay
                đổi thông tin</span></a>
          </div>
        </div>
        <div class="row mt-3 ms-2">
          <div class="col-md-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
              class="bi bi-clock-history" viewBox="0 0 16 16">
              <path
                d="M8.515 1.019A7 7 0 0 0 8 1V0a8 8 0 0 1 .589.022zm2.004.45a7 7 0 0 0-.985-.299l.219-.976q.576.129 1.126.342zm1.37.71a7 7 0 0 0-.439-.27l.493-.87a8 8 0 0 1 .979.654l-.615.789a7 7 0 0 0-.418-.302zm1.834 1.79a7 7 0 0 0-.653-.796l.724-.69q.406.429.747.91zm.744 1.352a7 7 0 0 0-.214-.468l.893-.45a8 8 0 0 1 .45 1.088l-.95.313a7 7 0 0 0-.179-.483m.53 2.507a7 7 0 0 0-.1-1.025l.985-.17q.1.58.116 1.17zm-.131 1.538q.05-.254.081-.51l.993.123a8 8 0 0 1-.23 1.155l-.964-.267q.069-.247.12-.501m-.952 2.379q.276-.436.486-.908l.914.405q-.24.54-.555 1.038zm-.964 1.205q.183-.183.35-.378l.758.653a8 8 0 0 1-.401.432z" />
              <path d="M8 1a7 7 0 1 0 4.95 11.95l.707.707A8.001 8.001 0 1 1 8 0z" />
              <path
                d="M7.5 3a.5.5 0 0 1 .5.5v5.21l3.248 1.856a.5.5 0 0 1-.496.868l-3.5-2A.5.5 0 0 1 7 9V3.5a.5.5 0 0 1 .5-.5" />
            </svg>
            </svg>
          </div>
          <div class="col-md-10 fw-bold">
            <a href="#" class="text-black text-decoration-none" data-form="form2" style="margin-left: 5px;"><span>Video
                đã xem</span></a>
          </div>
        </div>
        <div class="row mt-3 ms-2">
          <div class="col-md-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
              class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
              <path
                d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z" />
            </svg>
          </div>
          <div class="col-md-10 fw-bold">
            <a href="#" class="text-black text-decoration-none" data-form="form3" style="margin-left: 5px;"><span>Video
                đã thích</span></a>
          </div>
        </div>
        <div class="row mt-3 ms-2">
          <div class="col-md-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-key-fill"
              viewBox="0 0 16 16">
              <path
                d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2M2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2" />
            </svg>
          </div>
          <div class="col-md-10 fw-bold">
            <a href="#" class="text-black text-decoration-none" data-form="Doimatkhau"
              style="margin-left: 5px;"><span>Đổi
                mật khẩu</span></a>
          </div>
        </div>
        <div class="row mt-3 ms-2">
          <div class="col-md-2">
            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
              class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
              <path fill-rule="evenodd"
                d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z" />
              <path fill-rule="evenodd"
                d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708z" />
            </svg>
          </div>
          <div class="col-md-10 fw-bold">
            <a href="/animu/logout" class="text-black text-decoration-none" style="margin-left: 5px;"><span>Đăng
                xuất</span></a>

          </div>
        </div>
      </aside>

      <section>


        <article class="text-black" style="margin-left: 280px;">
          <!-- FORM -->
          <div id="form1" class="form-container">
            <h3 class="m-3">Thay đổi thông tin</h3>
            <form class="m-3" method="post" action="/animu/user/changeinformation" enctype="multipart/form-data">
              <div class="form-group mt-3">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="${useredit.username}">
              </div>
              <div class="form-group mt-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${useredit.email}">
              </div>
              <div class="form-group mt-3">

                <label for="phone-number">Chọn ảnh</label>
                <input type="file" class="form-control" id="file" name="file">
              </div>
              <button type="submit" class="btn btn-primary mt-3 w-100" onclick="Update()">Lưu</button>
            </form>
          </div>
          <div id="form2" class="form-container m-3">
            <h3>Video đã xem</h3>
            <div class="row">
              <div class="col-md-10 row">
                <c:forEach var="video" items="${page}">
                  <div class="col-md-12">
                    <a class="d-flex text-decoration-none text-black"
                      href="/animu/listmovie/information/${video.phim.slug}">
                      <div class="col-md-6 video-clip me-3">
                        <img src="${video.phim.poster_url}" class="img-fluid mb-3" width="100%"><br>
                      </div>
                      <div class="col-md-6 row">
                        <div class="col-md-10">
                          <span class="fw-bold fs-5">${video.phim.tieude}</span><br>

                          <span class="multiline-ellipsis"
                            style="font-size: 15px; color: rgb(115, 107, 107); margin-top: 10px;">
                            ${video.phim.chitietphim.mota}
                          </span>
                        </div>
                      </div>
                    </a>
                  </div>
                </c:forEach>
              </div>

            </div>

          </div>
          <div id="form3" class="form-container m-3">
            <h3>Video đã thích</h3>
            <div class="row">
              <form div class="col-md-10 row">
                <c:forEach var="video" items="${videosdathich}">
                  <div class="col-md-12 d-flex">
                    <a class="d-flex text-decoration-none text-black"
                      href="/animu/listmovie/information/${video.phim.slug}">
                      <div class="col-md-6 video-clip me-3">
                        <img src="${video.phim.poster_url}" class="img-fluid mb-3" width="100%"> <br>
                      </div>
                      <div class="col-md-6 row">
                        <div class="col-md-10">
                          <span class="fw-bold fs-5">${video.phim.tieude}</span>

                          <br>
                          <span class="multiline-ellipsis"
                            style="font-size: 15px; color: rgb(115, 107, 107); margin-top: 10px;">
                            ${video.phim.chitietphim.mota}
                          </span>
                        </div>
                      </div>
                    </a>
                  </div>
                </c:forEach>
              </form>

            </div>

          </div>
          <div class="form-container" id="Doimatkhau">
            <form action="/animu/user/changepassword" method="post">
              <div class="form-group mt-3">
                <label for="current-password">Mật khẩu hiện tại</label>
                <input type="password" class="form-control" name="password" id="current-password"
                  placeholder="Nhập mật khẩu hiện tại">
              </div>
              <div class="form-group mt-3">
                <label for="new-password">Mật khẩu mới</label>
                <input type="password" class="form-control" name="new-password" id="new-password"
                  placeholder="Nhập mật khẩu mới">
              </div>
              <div class="form-group mt-3">
                <label for="confirm-password">Xác nhận mật khẩu mới</label>
                <input type="password" class="form-control" name="confirm-password" id="confirm-password"
                  placeholder="Xác nhận mật khẩu mới">
              </div>
              <button type="submit" class="btn btn-primary mt-3" onclick="doimatkhau()">Lưu</button>
            </form>
          </div>

        </article>

      </section>

      <script src="https://kit.fontawesome.com/a076d05399.js"></script>
      <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
      <script>
        document.addEventListener("DOMContentLoaded", function () {
          const links = document.querySelectorAll('aside a[data-form]');
          const forms = document.querySelectorAll('.form-container');
          links.forEach(link => {
            link.addEventListener('click', function (event) {
              event.preventDefault();
              const formId = link.getAttribute('data-form');
              forms.forEach(form => {
                if (form.id === formId) {
                  form.style.display = 'block';
                } else {
                  form.style.display = 'none';
                }
              });
            });
          });
        });

        function doimatkhau() {
          alert("Đổi mật khẩu thành công");
        }

      </script>

    </body>

    </html>