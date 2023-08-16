<%-- 
    Document   : login
    Created on : Aug 6, 2023, 11:15:03 AM
    Author     : Trinh Bao Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        Tài khoản hoặc mật khẩu của bạn nhập sai !!! Vui lòng nhập lại ...!
    </div>
</c:if>
<c:if test="${param.accessDenied}">
    <div class="alert alert-danger">
        Ban khong co quyen truy cap
    </div>
</c:if>
<c:url value="/login" var="action" />
<form method="post" action="${action}">
    <div class="login">
        <div class="img_login">
            <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1691914443/Login_Web_Animation_fhmgp8.png" alt="alert"/>
        </div>
        <div class="mainLogin">
            <p>Login</p>
            <div class="">
                <label for="username">Tên đăng nhập</label>
                <input type="text" class="" id="username" placeholder="Nhập username..." name="username">

            </div>

            <div class="">
                <label for="pwd">Mật khẩu</label>
                <input type="text" class="" id="pwd" placeholder="Nhập mật khẩu..." name="password">

            </div>

            <div class="">
                <input type="submit" value="Đăng nhập" class="btn btn-danger" />
            </div>
        </div>
    </div>
</form>
<style>

    .login{
        display: flex;
        padding: 10px;
    }
    .img_login{
        width: 40%;
    }
    .mainLogin {
        background-color: white;
        font-family: Arial, sans-serif;
        /*        display: flex;*/
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        width: 60%
    }
    .mainLogin p{
        font-family: 'Charcoal', sans-serif;
        font-size: 48px;
        color: #fff;

        letter-spacing: 3px;
        font-weight: bold;

        background: blue;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        transition: all 0.3s ease;
    }
    .mainLogin div{
        padding: 20px;
        margin: 20px;
    }
    .login-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        text-align: center;
    }


    form-floating mt-3 mb-3:hover {
        background-color: #45a049;
    }
</style>