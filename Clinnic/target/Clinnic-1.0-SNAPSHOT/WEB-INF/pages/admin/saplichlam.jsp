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
        <c:forEach items="${getdoctor}" var="r">
            <option value="${r.id}">${r.name}</option>
        </c:forEach>
    </form:select>

    <c:forEach items="${dateList}" var="date">
        <td>
            <form:checkbox path="listdate" value="${date}"/>
            <h2><fmt:formatDate value="${date}" pattern="dd/MM/yyyy" /></h2>
        </td>
    </c:forEach>

    <label for="shift">Chọn ca làm việc:</label>
    <form:select class="form-select" id="shiftId" name="shiftId" path="shiftId">
        <c:forEach items="${lich}" var="r">
            <option value="${r.id}">${r.name}</option>
        </c:forEach>
    </form:select>

    <button type="submit">Sếp</button>
</form:form>

<%-- Hiển thị lịch làm --%>
<h2>Lịch làm</h2>
<table>
    <thead>
        <tr>
            <th>Nhân viên</th>
            <th>Ngày</th>
            <th>Ca làm việc</th>
        </tr>
    </thead>
    <%-- Lặp qua danh sách lịch làm và hiển thị thông tin --%>
    <tbody>
        <c:forEach items="${lichdone}" var="l">
            <tr>
                <td>${l.userId.name}</td>
                <td>${l.dateSchedule}</td>
                <td>${l.shiftId.name}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>