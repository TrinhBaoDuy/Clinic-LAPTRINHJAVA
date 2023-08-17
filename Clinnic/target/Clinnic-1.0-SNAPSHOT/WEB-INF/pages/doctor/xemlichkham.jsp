<%-- 
   Document   : home
   Created on : Aug 12, 2023, 10:56:21 PM
   Author     : hung
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/doctor/xemlichkham" var="action" />
<sec:authorize access="hasRole('ADMIN')"> 
    <script src="<c:url value="/js/FunctionObject.js" />"></script>
    <div class="container">
        <div class="imglogo">
            <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1691993662/Red_and_white_pill_icon_on_white_ez3beg.jpg" alt="logo">
            <h2>Tủ thuốc PISCES</h2>
        </div>
        <div class="main">
            <div class = "addMe">
                <form:form >
                    <form:hidden path="id" />
                    <div class="form-floating mb-3 mt-3">
                        <div class="form-group">
                            <label for="product_name">Tên thuốc</label>
                            <form:input type="text" class="form-control" path="name" id="product_name" placeholder="Tên thuốc..." />


                            <form:form >
                                <div class="content1">
                                    <h2> Lịch Khám </h2>
                                    <div class="content2">

                                        <table class="table table-striped">
                                            <thead>
                                                <tr>

                                                    <th>Tên thuốc</th>
                                                    <th>Đơn giá</th>
                                                    <th>Số lượng</th>

                                                    <th>Nhà sản xuất</th>
                                                    <th>Ngày sản xuất</th>
                                                    <th>Ngày hết hạn</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>    





                            </form:form>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <style>
        .content2{
            padding-left: 30px;
            border: 0.5px solid #5AAC4E;
            border-radius: 30px;
        }
        .content1 h2{
            text-align: center;
            font-family: serif;
            font-weight: bold;
            padding: 20px;
        }

    </style>