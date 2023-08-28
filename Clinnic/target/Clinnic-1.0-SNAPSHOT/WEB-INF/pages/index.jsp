<%-- 
    Document   : index
    Created on : Jul 22, 2023, 1:13:32 PM
    Author     : Trinh Bao Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/" var="action" />
<script src="<c:url value="/js/FunctionObject.js" />"></script>
<section>
    <div class="container mt-3">
        <h2>nguoi dung</h2>
        <a href="<c:url value="/admin/users"/>" class="btn btn-info">Thêm Nguoi dung</a>
        <form class="d-flex" action="${action}">
            <input class="form-control me-2" type="text" name="nameUser" placeholder="Nhập tên nguoi dung...">
            <button class="btn btn-primary" type="submit">Tìm</button>
        </form>
        <c:if test="${counter > 1}">
            <ul class="pagination mt-1">
                <li class="page-item"><a class="page-link" href="<c:url value="/" />">Tất cả</a></li>
                    <c:forEach begin="1" end="${counter}" var="i">
                        <c:url value="/" var="pageUrl">
                            <c:param name="page" value="${i}"></c:param>
                        </c:url>
                    <li class="page-item"><a class="page-link" href="${pageUrl}">${i}</a></li>
                    </c:forEach>
            </ul>
        </c:if>
        <p>Thông tin ${countuser} của phòng khám của phòng khám :</p>            
        <table class="table table-striped">
            <thead>
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Gender</th>
                    <th>Dob</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${getuser}" var="ds">
                    <tr>
                        <td>
                            <img src="${ds.avatar}" alt="Avatar" width="50" height="50" />
                        </td>
                        <td>${ds.id}</td>
                        <td>${ds.name}</td>
                        <td>${ds.sex}</td>
                        <<td>${ds.dod}</td>
                        <td>${ds.phone}</td>
                        <td>${ds.emaill}</td>
                        <td>${ds.address}</td>
                        <td>
                            <c:url value="/api/${ds.id}" var="apiDel" />
                            <a href="<c:url value="/admin/users/${ds.id}"/>" class="btn btn-success">Cập nhật</a>
                            <button class="btn btn-danger" onclick="delObject('${apiDel}', ${ds.id})">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>
<div>
    <h1>Prescription Export</h1>
    <a href="${pageContext.request.contextPath}/export">Export Prescription to PDF</a>
</div>

