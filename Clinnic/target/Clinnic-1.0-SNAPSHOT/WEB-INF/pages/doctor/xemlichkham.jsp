<%-- 
   Document   : home
   Created on : Aug 12, 2023, 10:56:21 PM
   Author     : hung
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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