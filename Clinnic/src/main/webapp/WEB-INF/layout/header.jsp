<%-- 
    Document   : header
    Created on : Jul 29, 2023, 2:02:16 PM
    Author     : Trinh Bao Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/" var="action" />
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <div class="logo">
            <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1691909467/Online_Drug_Store___Infinite_Medical_Cross_Unused_for_Sale_xnf4hq.png" alt="Bệnh viện XYZ Logo">

        </div>
        <a class="navbar-brand" href="#">Pisces Hospital</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${action}">Trang chủ</a>
                </li>
                <c:forEach items="${roles}" var="r">
                    <c:url value="/" var="searchUrl">
                        <c:param name="roleId" value="${r.id}"></c:param>
                    </c:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${searchUrl}">${r.name}</a>
                    </li>
                </c:forEach>
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/" />">${pageContext.request.userPrincipal.name}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/logout" />">Dang xuat</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value="/login" />">Dang nhap</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>

<!--            <form class="d-flex" action="${action}">
                <input class="form-control me-2" type="text" name="kw" placeholder="Nhập từ khóa...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>-->
        </div>
    </div>
</nav>

<style>
    .logo img{
        width: 50px;
    }
    .navbar {
        background-color: #E0FFFF!important;
    }

    .navbar-brand {
        color: red!important;
        font-size: 24px;
        font-weight: bold;


        padding: 10px;

    }

    .navbar-toggler {
        border: none;
    }

    .navbar-toggler-icon {
        background-color: #fff;
    }

    .navbar-collapse {
        justify-content: flex-end;
    }

    .navbar-nav .nav-item {
        margin-right: 10px;
    }

    .navbar-nav .nav-link {
        color: black!important;
    }

    .navbar-nav .nav-link:hover {
        color: red;
    }

    .form-control {
        border: none;
        border-radius: 20px;
        background-color: #f8f9fa;
        color: #333;
    }

    .btn-primary {
        border-radius: 20px;
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
</style>

