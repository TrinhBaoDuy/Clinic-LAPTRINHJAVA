<%-- 
    Document   : quanlythuoc
    Created on : Aug 14, 2023, 11:48:09 AM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/quanlythuoc" var="action" />
<div class="container">
    <div class="imglogo">
        <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1691993662/Red_and_white_pill_icon_on_white_ez3beg.jpg" alt="logo">
        <h2>Tủ thuốc PISCES</h2>
    </div>
    <form class="search-form" action="${action}">
        <input class="form-control me-2" type="text" name="name" placeholder="Nhập tên thuốc...">
        <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i> Tìm</button>
    </form>
    <form class="add-product-form" action="add_product.jsp" method="post">
        <div class="row">
            <div class="col">
                <label for="product_id">Mã Sản phẩm:</label>
                <input type="text" id="product_id" name="product_id" class="form-control" required>
            </div>
            <div class="col">
                <label for="product_name">Tên sản phẩm:</label>
                <input type="text" id="product_name" name="product_name" class="form-control" required>
            </div>
            <div class="col">
                <label for="product_price">Giá sản phẩm:</label>
                <input type="number" id="product_price" name="product_price" class="form-control" required>
            </div>
            <div class="col">
                <label for="product_total">Số lượng sản phẩm:</label>
                <input type="number" id="product_total" name="product_total" class="form-control" required>
            </div>
        </div>
        <div class="btadd">
            <button type="submit" class="btn btn-info">Thêm Thuốc</button>
        </div>
    </form>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Tên thuốc</th>
                <th>Số lượng kho</th>
                <th>Giá</th>
                <th>Nhà sản xuất</th>
                <th>Ngày sản xuất</th>
                <th>Ngày hết hạn</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${mediciens}" var="ds">
                <tr>
                    <td>${ds.id}</td>
                    <td>${ds.name}</td>
                    <td>${ds.numMed}</td>
                    <td>${ds.price} VND</td>
                    <td>${ds.provider}</td>
                    <td>${ds.productionDate}</td>
                    <td>${ds.expirationDate}</td>
                    <td>
                        <a href="/admin/users/${ds.id}" class="btn btn-success">Cập nhật</a>
                        <button class="btn btn-danger" onclick="delUser('/api/${ds.id}', ${ds.id})">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<style>
    .container {
        margin-top: 30px;
    }
    .imglogo {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    .imglogo img {
        width: 50px;
        height: 50px;
        margin-right: 10px;
    }
    .imglogo h2 {
        font-size: 24px;
        font-weight: bold;
    }
    .search-form {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
    }
    .search-form input[type="text"] {
        flex-grow: 1;
        margin-right: 10px;
    }
    .table th, .table td {
        vertical-align: middle;
    }
    .add-product-form {
        margin-bottom: 20px;
    }
    .add-product-form .form-control {
        width: 300px;
    }
    .add-product-form .btn {
        margin-top: 10px;
    }
</style>