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

    <h1>Thống kê số lượng bệnh nhân</h1>

    <form action="${action}" method="post">

        <label for="year">Chọn năm</label>
        <select id="year" name="yearofnd">
            <c:forEach var="year" begin="2020" end="2030">
                <option value="${year}">${year}</option>
            </c:forEach>
        </select>

        <button type="submit" >Thống kê</button>
    </form>
    <h2>Thống kê bệnh nhân theo tháng của năm ${um}</h2>
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
    <h2>Thống kê bệnh nhân theo quý của năm ${um}</h2>
    <canvas id="quarterlyRevenueChart"></canvas>
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


    <script>
        // Lấy dữ liệu từ model
        const monthData = ${list}
        const quarterData = ${listq}
//        Phước------------------------------------------------------------------
        // Dữ liệu doanh thu theo tháng, quý và năm
        const monthlyRevenueData = {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'],
            datasets: [{
                    label: 'Số người dùng',
                    data: monthData,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
        };

        const quarterlyRevenueData = {
            labels: ['Quý 1', 'Quý 2', 'Quý 3', 'Quý 4'],
            datasets: [{
                    label: 'Số người dùng',
                    data: quarterData,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
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

