<%-- 
    Document   : thanhtoan
    Created on : Aug 15, 2023, 1:27:23 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="main">
    <div class="container">
        <h1>Thanh toán</h1>

        <h2>Thông tin hóa đơn</h2>
        <p>Mã hóa đơn: <span id="invoice-number">123456</span></p>
        <p>Ngày khám: <span id="appointment-date">28/08/2023</span></p>
        <p>Tên bệnh nhân: <span id="patient-name">Nguyễn Văn A</span></p>
        <p>Số điện thoại: <span id="phone-number">0123456789</span></p>

        <h2>Thông tin thuốc đã mua</h2>
        <table>
            <tr>
                <th>Tên thuốc</th>
                <th>Số lượng</th>
                <th>Giá tiền</th>
                <th>Hướng dẫn sử dụng</th>
                <th>Tổng tiền</th>
            </tr>
            <tr>
                <td>Thuốc A</td>
                <td>5</td>
                <td>100,000</td>
                <td>Hướng dẫn A</td>
                <td>500,000</td>
            </tr>
            <!-- Thêm các dòng dữ liệu khác tương tự -->
        </table>

        <h2>Thông tin dịch vụ đã sử dụng</h2>
        <table>
            <tr>
                <th>Tên dịch vụ</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Tổng tiền</th>
            </tr>
            <tr>
                <td>Dịch vụ A</td>
                <td>2</td>
                <td>200,000</td>
                <td>400,000</td>
            </tr>
            <!-- Thêm các dòng dữ liệu khác tương tự -->
        </table>

        <div class="payment-section">
            <h2>Phần thanh toán</h2>
            <p>Tổng tiền: <span id="total-amount"> </span></p>

            <div class="payment-method">
                <label>Phương thức thanh toán:</label>
                <select id="payment-method-select" onchange="toggleCashPayment()">
                    <option value="cash">Tiền mặt</option>
                    <option value="momo">MoMo</option>
                    <option value="zalopay">ZaloPay</option>
                </select>
            </div>

            <div id="cash-payment" class="payment-method">
                <label>Tiền khách đưa:</label>
                <input type="number" id="customer-payment">
            </div>

            <div id="cash-payment" class="payment-method">
                <label>Tiền Trả khách:</label>
                <input type="number" id="customer-payment">
            </div>
        </div>



    </div>
</div>


<style>


    .container {

        margin: 30px auto;
        padding: 20px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        overflow: auto;
        max-height: 400px;

    }

    h1 {
        text-align: center;
    }
    thead>tr>th{
        text-align: center;
    }

    table {

        border-collapse: collapse;
        margin-top: 20px;
        margin-bottom: 40px;
        table-layout: fixed;
    }
    thead {
        color: white;

    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        white-space: nowrap;
        width: 20%;
        word-break: break-all;

    }


    th {
        background-color: #198754;
        ;
    }
    .input{
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        width: 100%;
        margin-top: 50px;
        margin: 42%;
        text-decoration: none;
    }
    .payment-section {
        margin-top: 20px;
    }

    .payment-method {
        display: inline-block;
        margin-right: 10px;
    }

    .hidden {
        display: none;
    }
</style>