<%-- 
    Document   : quanlytk
    Created on : Aug 6, 2023, 1:16:40 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin/quanlytaikhoan" var="actions"/>


<main class="table">
    <div class="container">
        <h1>Thêm tài khoản</h1>
        <form class="content">
            <div class="left">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id">

            <label for="username">Username:</label>
            <input type="text" id="username" name="username">

            <label for="fullname">Họ và tên:</label>
            <input type="text" id="fullname" name="fullname">

            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password">

            <label for="position">Chức vụ:</label>
            <input type="text" id="position" name="position">

            <label for="phone">Số điện thoại:</label>
            <input type="text" id="phone" name="phone">
            </div>
            <div class ="right">

            <label for="address">Địa chỉ:</label>
            <input type="text" id="address" name="address">

            <label for="email">Email:</label>
            <input type="email" id="email" name="email">

            <label for="birthdate">Ngày sinh:</label>
            <input type="date" id="birthdate" name="birthdate">

            <label for="gender">Giới tính:</label>
            <select id="gender" name="gender">
                <option value="male">Nam</option>
                <option value="female">Nữ</option>
                <option value="other">Khác</option>
            </select>
             
            <label for="avatar">Avatar:</label>
            <input type="file" id="avatar" name="avatar">

            <input type="submit" value="Lưu thông tin">
            </div>
        </form>
    </div>
</main>
<style>

   

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        border: 0.5px solid #5AAC4E;
    border-radius: 30px;
    margin: 20px;
     
    }
    .content{
        display: flex;
    }
    .left{
        width: 50%;
    }
    h1 {
        text-align: center;
    }

    form {
        margin-top: 20px;
    }

    label {
        display: block;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    input[type="date"],
    select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 100px;
        box-sizing: border-box;
        margin-top: 5px;
    }
    input[type="file"]
    {
        padding-top: 10px;

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