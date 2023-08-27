<%-- 
    Document   : quanlytk
    Created on : Aug 6, 2023, 1:16:40 AM
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/admin/quanlytaikhoan/themtaikhoan" var="action"/>
<sec:authorize access="hasRole('ROLE_ADMIN')"> 
    <main class="table">
        <form:form method="post" action="${action}" modelAttribute="nguoidung" enctype="multipart/form-data">
            <div class="container">

                <c:choose>
                    <c:when test="${user.id == null}"><h1>Thêm tài khoản</h1></c:when>
                    <c:otherwise><h1>Cập nhật tài khoản</h1></c:otherwise>
                </c:choose>

                <form:hidden path="id"/>
                <form:hidden path="avatar"/>

                <label for="name">Họ và tên:</label>
                <form:input type="text" id="fullname" path="name" />

                <label for="username">Username:</label>
                <form:input type="text" id="username" path="username" />

                <label for="password">Password:</label>
                <form:input type="text" id="password" path="password" />

                <label for="position">Chức vụ:</label>
                <form:select class="form-select" id="role" name="role" path="roleId">
                    <c:forEach items="${roles}" var="r">
                        <c:choose>
                            <c:when test="${r.id == user.roleId.id}">
                                <option value="${r.id}" selected>${r.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${r.id}">${r.name}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </form:select>

                <label for="phone">Số điện thoại:</label>
                <form:input type="text" id="phone" path="phone" />

                <label for="address">Địa chỉ:</label>
                <form:input type="text" id="address" path="address" />

                <label for="email">Email:</label>
                <form:input type="email" id="email" path="emaill" />

                <label for="dod">Ngày sinh:</label>
                <form:input type="date" id="dod" path="dod"/>

                <label for="gender">Giới tính:</label>
                <form:select id="sex" path="sex">
                    <option value="Nam">Nam</option>
                    <option value="Nữ">Nữ</option>
                    <option value="Khác">Khác</option>
                </form:select>

                <label for="file">Avatar:</label>
                <form:input type="file" id="file" path="file"/>

                <c:choose>
                    <c:when test="${user.id == null}"><input type="submit" value="Lưu thông tin"></c:when>
                    <c:otherwise><input type="submit" value="Cập nhật thông tin"></c:otherwise>
                </c:choose>
            </div>

        </form:form>

    </main>
</sec:authorize>
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