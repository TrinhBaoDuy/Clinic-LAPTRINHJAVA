<%-- 
    Document   : saplichlam
    Created on : Aug 30, 2023, 1:19:18 PM
    Author     : Trinh Bao Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/admin/saplichlam" var="action" />
<h1>Trang sắp xếp lịch làm</h1>
<%-- Form sắp xếp lịch làm --%>
<h2>Sắp xếp lịch làm</h2>
<form:form   method="post" action="${action}" modelAttribute="lichlam" >
    <label for="employee">Chọn bác sĩ</label>
    <form:select class="form-select" id="userId" name="userId" path="userId">
        <option>Chọn bác sĩ...</option>
        <c:forEach items="${getdoctor}" var="r">
            <option value="${r.id}">${r.name}</option>
        </c:forEach>
    </form:select>

    <label for="shift">Chọn ca làm việc:</label>
    <form:select class="form-select" id="shiftId" name="shiftId" path="shiftId">
        <option>Chọn ca làm việc...</option>
        <c:forEach items="${lich}" var="r">
            <option value="${r.id}">${r.name}</option>
        </c:forEach>
    </form:select>

    <button type="submit">Sếp</button>
</form:form>

<%-- Hiển thị lịch làm --%>
<h2>Lịch làm chưa sát nhận</h2>
<table>
    <thead>
        <tr>
            <th>Avatar</th>
            <th>Họ và tên</th>
            <th>Ngày Làm</th>
            <th>Ca làm</th>
            <th>Chấp thuận</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${lichundone}" var="s">
            <tr>
                <td><img style="height: 40px; width: auto" src="<c:url value="${s.userId.avatar}"/>" alt="Avatar"></td>
                <td>${s.userId.name}</td>
                <td>${s.dateSchedule}</td>
                <td>${s.shiftId.name}</td>
                <td>
                    <a href="<c:url value="/admin/saplichlam/xatnhan/${s.id}"/>" class="btn btn-success">Xát nhận</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<h2>Lịch làm đã sát nhận</h2>
<table>
    <thead>
        <tr>
            <th>Avatar</th>
            <th>Họ và tên</th>
            <th>Ngày Làm</th>
            <th>Ca làm</th>
            <th>Chấp thuận</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${lichdone}" var="s">
            <tr>
                <td><img style="height: 40px; width: auto" src="<c:url value="${s.userId.avatar}"/>" alt="Avatar"></td>
                <td>${s.userId.name}</td>
                <td>${s.dateSchedule}</td>
                <td>${s.shiftId.name}</td>
                <td>
                    <a href="<c:url value="/admin/saplichlam/huy${s.id}"/>" class="btn btn-success">Hủy</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>