<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/css/char.css">

        <h1 class="my-4">Movie Management Dashboard</h1>
        <div class="row">
            <div class="col-md-6">
                <div class="card text-center">
                    <div class="card-body card-users">
                        <h5 class="card-title">Total Users</h5>
                        <h3 class="card-text" id="total-users">${tkUser }</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card text-center">
                    <div class="card-body card-movies">
                        <h5 class="card-title">Total Movies</h5>
                        <h3 class="card-text" id="total-movies">${tkPhim }</h3>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card" style="max-height: 400px">
                    <div class="card-body" >
                        <canvas id="myChart"></canvas>
                        <span class="m-1">Biểu đồ: hehe</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card" style="max-height: 400px">
                    <div class="card-body">
                    	
                        <canvas id="myChart2"></canvas>
                        <span class="m-1">Biểu đồ: hehe</span>
                    </div>
                </div>
            </div>
        </div>

	
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Chart.js Script -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('myChart').getContext('2d');
            const ctx2 = document.getElementById('myChart2').getContext('2d');
            const totalUsers = document.getElementById('total-users').innerText;
            const totalMovies = document.getElementById('total-movies').innerText;

            new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Users', 'Movies'],
                    datasets: [{
                        label: '# of Items',
                        data: [totalUsers, totalMovies],
                        backgroundColor: ['#36A2EB', '#FF6384'],
                        hoverBackgroundColor: ['#36A2EB', '#FF6384'],
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                }
            });
            
            new Chart(ctx2, {
                type: 'doughnut',
                data: {
                    labels: ['Users', 'Movies'],
                    datasets: [{
                        label: '# of Items',
                        data: [totalUsers, totalMovies],
                        backgroundColor: ['#36A2EB', '#FF6384'],
                        hoverBackgroundColor: ['#36A2EB', '#FF6384'],
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                }
            });
        });
    </script>
