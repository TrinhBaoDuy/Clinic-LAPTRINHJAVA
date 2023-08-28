<%-- 
    Document   : thongke
    Created on : Aug 28, 2023, 2:20:37 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<main class="table">

    <h1>Thống kê doanh thu</h1>

    <h2>Thống kê theo tháng</h2>
    <div>
        <label for="month">Chọn tháng:</label>
        <select id="month">
            <option value="1">Tháng 1</option>
            <option value="2">Tháng 2</option>
            <option value="3">Tháng 3</option>
            <!-- Thêm các option cho các tháng còn lại -->
        </select>
        <button onclick="showMonthlyRevenue()">Xem</button>
    </div>
    <canvas id="monthlyRevenueChart"></canvas>

    <h2>test theo thang</h2>
    <div>
        <c:forEach items="${list}" var="t">
            <h3>${t}</h3>
        </c:forEach>
    </div>
    <canvas id="chart"></canvas>
    <h2>Thống kê theo quý</h2>
    <div>
        <label for="quarter">Chọn quý:</label>
        <select id="quarter">
            <option value="1">Quý 1</option>
            <option value="2">Quý 2</option>
            <option value="3">Quý 3</option>
            <option value="4">Quý 4</option>
        </select>
        <button onclick="showQuarterlyRevenue()">Xem</button>
    </div>
    <canvas id="quarterlyRevenueChart"></canvas>

    <h2>Thống kê theo năm</h2>
    <div>
        <label for="year">Chọn năm:</label>
        <select id="year">
            <option value="2021">2021</option>
            <option value="2022">2022</option>
            <option value="2023">2023</option>
            <!-- Thêm các option cho các năm còn lại -->
        </select>
        <button onclick="showYearlyRevenue()">Xem</button>
    </div>
    <canvas id="yearlyRevenueChart"></canvas>

    <!----------------------------------------------------> 

    <script>
         // Lấy dữ liệu từ model
    const monthData = ${list}
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    // Tạo biểu đồ bằng Chart.js
    const ctx = document.getElementById('chart').getContext('2d');
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: months,
        datasets: [{
          label: 'Số lượng bệnh nhân đến khám',
          data: monthData,
          borderColor: 'blue',
          fill: false
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
        
        
        
        
//        Phước------------------------------------------------------------------
        // Dữ liệu doanh thu theo tháng, quý và năm
        const monthlyRevenueData = {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4'],
            datasets: [{
                    label: 'Doanh thu',
                    data: [100, 150, 120, 180, 200, 170],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
        };

        const quarterlyRevenueData = {
            labels: ['Quý 1', 'Quý 2', 'Quý 3', 'Quý 4'],
            datasets: [{
                    label: 'Doanh thu',
                    data: [/* Dữ liệu doanh thu quý 1, quý 2, quý 3, quý 4 */],
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
        };

        const yearlyRevenueData = {
            labels: ['2021', '2022', '2023', /* Thêm các năm còn lại */],
            datasets: [{
                    label: 'Doanh thu',
                    data: [/* Dữ liệu doanh thu năm 2021, năm 2022, năm 2023, ... */],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
        };

        // Biểu đồ doanh thu theo tháng
        const monthlyRevenueChart = new Chart(document.getElementById('monthlyRevenueChart'), {
            type: 'bar',
            data: monthlyRevenueData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ doanh thu theo quý
        const quarterlyRevenueChart = new Chart(document.getElementById('quarterlyRevenueChart'), {
            type: 'bar',
            data: quarterlyRevenueData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Biểu đồ doanh thu theo năm
        const yearlyRevenueChart = new Chart(document.getElementById('yearlyRevenueChart'), {
            type: 'bar',
            data: yearlyRevenueData,
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Xử lý sự kiện khi người dùng chọn tháng và nhấn nút "Xem"
        function showMonthlyRevenue() {
            const selectedMonth = document.getElementById('month').value;
            // Xử lý dữ liệu và hiển thị chỉ số doanh thu của tháng tương ứng
            let monthlyRevenueDataSubset = [];
            // Lấy dữ liệu doanh thu của tháng tương ứng từ dữ liệu gốc
            // Ví dụ: monthlyRevenueDataSubset = monthlyRevenueData.datasets[0].data.slice(0, 3);

            // Cập nhật dữ liệu và hiển thị biểu đồ doanh thu theo tháng
            monthlyRevenueChart.update();
        }

        // Xử lý sự kiện khi người dùng chọn quý và nhấn nút "Xem"
        function showQuarterlyRevenue() {
            const selectedQuarter = document.getElementById('quarter').value;
            // Xử lý dữ liệu và hiển thị chỉ số doanh thu của quý tương ứng
            let quarterlyRevenueDataSubset = [];
            // Lấy dữ liệu doanh thu của quý tương ứng từ dữ liệu gốc
            // Ví dụ: quarterlyRevenueDataSubset = quarterlyRevenueData.datasets[0].data.slice(0, 3);

            // Cập nhật dữ liệu và hiển thị biểu đồ doanh thu theo quý
            quarterlyRevenueChart.update();
        }

        // Xử lý sự kiện khi người dùng chọn năm và nhấn nút "Xem"
        function showYearlyRevenue() {
            const selectedYear = document.getElementById('year').value;
            // Xử lý dữ liệu và hiển thị chỉ số doanh thu của năm tương ứng
            let yearlyRevenueDataSubset = [];
            // Lấy dữ liệu doanh thu của năm tương ứng từ dữ liệu gốc
            // Ví dụ: yearlyRevenueDataSubset = yearlyRevenueData.datasets[0].data.slice(0, 3);

            // Cập nhật dữ liệu và hiển thị biểu đồ doanh thu theo năm
            yearlyRevenueChart.update();
        }

        //    ---------------------------------------------------------------------------------------------

    </script>


</main>

<style>
    h1, h2 {
        text-align: center;
    }

    canvas {
        display: block;
        margin: 0 auto;
        max-width: 600px;
        max-height: 400px;
    }
</style>