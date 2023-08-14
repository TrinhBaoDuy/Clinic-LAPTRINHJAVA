<%-- 
    Document   : quanlythuoc
    Created on : Aug 14, 2023, 11:48:09 AM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url value="/" var="action" />
<script src="<c:url value="/js/index.js" />"></script>
<div class="quanlythuoc">
    <section>
        <div class="container mt-3 one">
            <div class=" imglogo">
                <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1691993662/Red_and_white_pill_icon_on_white_ez3beg.jpg" alt="alert"/>
                <h2>Tủ thuốc PISCES</h2>
            </div>
            <form class="d-flex" action="${action}">
                <input class="form-control me-2" type="text" name="nameUser" placeholder="Nhập tên thuốc...">
                <button class="btn btn-primary" type="submit">Tìm</button>
            </form>
            <form action="add_product.jsp" method="post">
                <div class="addproduct">
                <label for="product_id">Mã Sản phẩm:</label>
                <input type="text" id="product_name" name="product_name" required>
                
                <label for="product_name">Tên sản phẩm:</label>
                <input type="text" id="product_name" name="product_name" required>

                <label for="product_price">Giá sản phẩm:</label>
                <input type="number" id="product_price" name="product_price" required>
                
                <label for="product_total">Số lượng sản phẩm:</label>
                <input type="number" id="product_price" name="product_total" required>

                

                <div class="btadd"><a href="<c:url value="/admin/users"/>" class="btn btn-info">Thêm Thuốc</a></div>
            
                </div>
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
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th></th>
                        <th>ID</th>
                        <th>Tên thuốc</th>
                        <th>Số lượng kho</th>
                        <th>Đơn vị</th>
                        <th>Hạn sử dụng</th>

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
                            <td>${ds.dod}</td>
                            <td>${ds.phone}</td>
                            <td>${ds.emaill}</td>
                            <td>${ds.address}</td>
                            <td>
                                <c:url value="/api/${ds.id}" var="apiDel" />
                                <a href="<c:url value="/admin/users/${ds.id}"/>" class="btn btn-success">Cập nhật</a>
                                <button class="btn btn-danger" onclick="delUser('${apiDel}', ${ds.id})">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</div>
<style>
    .quanlythuoc{
        background-color: #F0FFFF;
    }
    .one{
        padding: 0px;
    }
    .imglogo{
        display: flex;
        height: 50px;
        padding: 5px;
    }
    .imglogo h2{
        font-family: fangsong;
        font-size: 30px;
        padding-left: 10px;
    }
    .addproduct{
        display:flex;
        
    }
    .btadd{
        margin-top: 20px;
        text-align: right;
    }
    .btadd a{
        font-weight: 500;
        width: 150px;
    }
</style>