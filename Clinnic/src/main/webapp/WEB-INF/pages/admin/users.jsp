<%-- 
    Document   : doctors
    Created on : Jul 29, 2023, 5:11:35 PM
    Author     : Trinh Bao Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<sec:authorize access="hasRole('ADMIN')"> 
    <h1 class="text-center text-info mt-1">QUẢN LÝ NGƯỜI DÙNG</h1>

    <c:url value="/admin/users" var="action" />
    <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
        <form:hidden path="id" />
        <form:hidden path="avatar" />

        <%--<form:errors path="*" element="div" cssClass="alert alert-danger" />--%>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="name" id="name" placeholder="Tên người dùng..." />
            <label for="name">Họ và tên</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:select path="sex" id="sex" class="form-select" cssErrorClass="is-invalid">
                <form:option value="" label="Chọn giới tính" />
                <form:option value="Nam" label="Nam" />
                <form:option value="Nữ" label="Nữ" />
            </form:select>
            <label for="sex">Giới tính</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="phone" id="phone" placeholder="Phone người dùng..." />
            <label for="phone">Phone</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="emaill" id="emaill" placeholder="Email người dùng..." />
            <label for="email">Email</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <form:input type="text" class="form-control" 
                        path="address" id="address" placeholder="Địa chỉ người dùng..." />
            <label for="address">Address</label>

        </div>
        <div class="form-floating mb-3 mt-3">
            <label for="file">Avatar</label>
            <form:input type="file" id="file" path="file" class="form-control" />
        </div>
        <div class="form-floating mb-3 mt-3">
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

            <label for="category" class="form-label">Loại người dùng:</label>
        </div>

        <div class="form-floating mb-3 mt-3">
            <button class="btn btn-info" type="submit">
                <c:choose>
                    <c:when test="${user.id == null}">Thêm người dùng</c:when>
                    <c:otherwise>Cập nhật người dùng</c:otherwise>
                </c:choose>
            </button>
        </div>

    </form:form>
</sec:authorize>
