<%-- 
    Document   : adminhome
    Created on : Aug 27, 2023, 2:11:38 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<main class="table">
    <div class="containe">

        <div class="adminleft">
            <h2>Trang quản lý tài khoản</h2>
            <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1693121721/Customer_Service_Free_Avatar_User_Icon_Business_User_Icon_Users_Group_Icon_Female_User_Icon_User_Icon_Template_Download_on_Pngtree-removebg-preview_tcdrsw.png" alt="alert"/>
        </div>
        <div class="adminright">
            <input type="submit" value="QUẢN LÝ TÀI KHOẢN">
            <input type="submit" value="QUẢN LÝ THUỐC">
            <input type="submit" value="QUẢN LÝ LỊCH TRỰC">
            <input type="submit" value="THỐNG KÊ">
            

        </div>


    </div>
</main>

<style>


    .containe{
        margin: 30px;
        padding: 20px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        background-color: #F5FFFA;
        display: flex;
    }
    .adminleft{
        width: 50%;
        margin-right: 10%;
    }
    .adminleft img{
        width: 100%;
         
    }
     


    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        height: 30%;
        width: 30%;
        MARGIN: 37PX;
    }


</style>