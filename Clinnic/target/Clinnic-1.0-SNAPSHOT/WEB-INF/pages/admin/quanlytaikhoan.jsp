<%-- 
    Document   : quanlitaikhoan
    Created on : Aug 15, 2023, 1:27:23 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container">
    <h1>Trang quản lý tài khoản</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Avatar</th>
                <th>Username</th>
                <th>Họ và tên</th>
                <th>Mật khẩu</th>
                <th>Chức vụ</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Email</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th> </th>
                <th> </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td><img src="avatar1.jpg" alt="Avatar"></td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td> </td>
                <td><button type="fix">ĐĂNG KÝ LÀM</button></td>

            </tr>

        </tbody>
    </table>
    <input type="submit" value="THÊM TÀI KHOẢN">
     
            
</div>
 
   
<style>


    .container {

        margin: 0 auto;
        padding: 20px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
    }

    h1 {
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    thead {
        color: white;

    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;

    }

    th {
        background-color: #198754;
        ;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        width: 100%;
        margin-top: 50px;
    }
</style>