<%-- 
    Document   : adminhome
    Created on : Aug 27, 2023, 2:11:38 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/admin" var="action" />
<main class="table">
    <div class="containe">

        <div class="adminleft">
            <h2>Trang quản lý tài khoản</h2>
            <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1693121721/Customer_Service_Free_Avatar_User_Icon_Business_User_Icon_Users_Group_Icon_Female_User_Icon_User_Icon_Template_Download_on_Pngtree-removebg-preview_tcdrsw.png" alt="alert"/>
        </div>
        <div class="adminright">
            <a href="<c:url value="/admin/quanlytaikhoan" />">QUẢN LÝ TÀI KHOẢN</a>
            <a href="<c:url value="/admin/quanlythuoc" />">QUẢN LÝ THUỐC</a>
            <a href="<c:url value="/admin/saplichlam" />">QUẢN LÝ LỊCH TRỰC</a>
            <a href="<c:url value="/admin/thongke" />">THỐNG KÊ</a>
            

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
     


    a{
       
    }


</style>