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

<c:url value="/admin/thongke" var="action" />
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<main class="table">

    <h1>Thống kê doanh thu</h1>

    <h2>Thống kê theo tháng </h2>
<!--    <form  action="${action}">
        <div>
            <label for="month">Chọn tháng:</label>
            <select name="thang" id="month">
                <option value="1">Tháng 1</option>
                <option value="2">Tháng 2</option>
                <option value="3">Tháng 3</option>
                <option value="4">Tháng 4</option>
                <option value="5">Tháng 5</option>
                <option value="6">Tháng 6</option>
                <option value="7">Tháng 7</option>
                <option value="8">Tháng 8</option>
                <option value="9">Tháng 9</option>
                <option value="10">Tháng 10</option>
                <option value="11">Tháng 11</option>
                <option value="12">Tháng 12</option>
            </select>
            <button type="submit" >Xem</button>
        </div>
    </form>-->
    <canvas id="monthlyRevenueChart"></canvas>
    <table>
        <thead>
            <tr>
                <th></th>
                <th>Số lượng người dùng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${list}" var="t" varStatus="loop">
                <tr>
                    <td>Tháng ${loop.index+1}</td>
                    <td>${t}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <h2>Thống kê theo quý</h2>
<!--    <div action="${action}">
        <label for="quarter">Chọn quý:</label>
        <select id="quarter">
            <option value="1">Quý 1</option>
            <option value="2">Quý 2</option>
            <option value="3">Quý 3</option>
            <option value="4">Quý 4</option>
        </select>
        <button onclick="showQuarterlyRevenue()">Xem</button>
    </div>-->
    <table>
        <thead>
            <tr>
                <th></th>
                <th>Số lượng người dùng</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${listq}" var="t" varStatus="loop">
                <tr>
                    <td>Quý ${loop.index+1}</td>
                    <td>${t}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
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
        const quarterData = ${listq}
//        Phước------------------------------------------------------------------
        // Dữ liệu doanh thu theo tháng, quý và năm
        const monthlyRevenueData = {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            datasets: [{
                    label: 'Doanh thu',
                    data: monthData,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
        };

        const quarterlyRevenueData = {
            labels: ['Quý 1', 'Quý 2', 'Quý 3', 'Quý 4'],
            datasets: [{
                    label: 'Doanh thu',
                    data: quarterData,
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
//            type: 'polarArea',
//            type: 'pie',
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

            // Cập nhật dữ liệu và hiển thị biểu đồ doanh thu theo tháng
            monthlyRevenueChart.update();
        }

//        function showMonthlyRevenue() {
//            const selectedMonth = document.getElementById('month').value;
//
//            // Xử lý dữ liệu và hiển thị chỉ số doanh thu của tháng tương ứng
//            let monthlyRevenueDataSubset = [];
//
//            // Lấy chỉ số (index) của tháng được chọn trong mảng labels
//            const monthIndex = ${mothang};
//
//            // Lấy doanh thu của tháng được chọn từ mảng data trong datasets
//            const selectedMonthRevenue = monthlyRevenueData.datasets[0].data[monthIndex];
//            const selectedMonthRevenue = monthlyRevenueData.labels[0].data[monthIndex];
//
//            // Thêm doanh thu của tháng được chọn vào mảng monthlyRevenueDataSubset
//            monthlyRevenueDataSubset.push(selectedMonthRevenue);
//
//            // Cập nhật dữ liệu và hiển thị biểu đồ doanh thu theo tháng
//            monthlyRevenueChart.data.datasets[0].data = monthlyRevenueDataSubset;
//            monthlyRevenueChart.data.labels = [monthlyRevenueData.labels[monthIndex]];
//            monthlyRevenueChart.update();
//        }

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

