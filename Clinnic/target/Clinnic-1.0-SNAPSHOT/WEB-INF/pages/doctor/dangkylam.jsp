<%-- 
    Document   : dangkylam
    Created on : Aug 18, 2023, 11:22:51 AM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/doctor/dangkylam" var="action" />
<div class="content">
    <form:form method="post" action="${action}" modelAttribute="doctor"  enctype="multipart/form-data">
        <div class="contentleft">
            <div class="dkk1">
                <div class="booking1">
                    <img src="${doctor.avatar}" alt="alert"/>
                </div>
                <div class="contentbooking2_main">

                    <div class="contentbooking2">
                        <h1>Bác sĩ ${doctor.name}</h1>
                        <h5>Ngày sinh: ${doctor.dod}</h5>
                        <h5>Số điện Thoại: ${doctor.phone}</h5>
                        <h5>Địa chỉ: ${doctor.address}</h5>
                        <h5>Email: ${doctor.emaill}</h5>
                        <h5>Giới tính: ${doctor.sex}</h5>
                    </div>


                </div>


            </div>
        </div>
    </form:form>
    <script src="<c:url value="/js/dongho.js" />"></script>
    <div class="contentright">
        <h1>ĐĂNG KÝ LỊCH LÀM NGÀY<p id="future-date"></p></h1>
        <p style="display: none">Giờ hiện tại: <span id="current-time"></span></p>
        <table class="table table-striped">
            <thead>
                <tr>

                    <th>Ca/thứ</th>
                    <th>THỨ 2 </th>
                    <th>THỨ 3</th>
                    <th>THỨ 4</th>
                    <th>THỨ 5</th>
                    <th>THỨ 6</th>
                    <th>THỨ 7</th>
                    <th>CHỦ NHẬT</th>


                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Sáng</td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>

                </tr>
                <tr>
                    <td>Chiều</td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>

                </tr>
                <tr>
                    <td>Tối</td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>
                    <td><input type="checkbox" name="myCheckbox" value="1" /></td>

                </tr>
            </tbody>
        </table>
        <div class="submitbooking">
            <a href="#"><button type="submit">ĐĂNG KÝ LÀM</button></a>
        </div>
    </div>

</div>

<style>
    .content{
        display: flex;
        padding: 20px;

    }
    .contentleft{
        width: 30%;
        padding-left: 30px;
        /*background-image: url(https://res.cloudinary.com/dstqvlt8d/image/upload/v1692119274/Free_Vector___Cardio_heartbeat_medical_and_healthcare_background_oxvnvc.jpg);*/
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        margin-left: 30px;
        height: 100%;


    }
    .contentright {
        width: 70%;
        padding: 20px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        margin-left: 30px;
    }

    .contentright h1{
        font-family: 'Helvetica Neue', Arial, sans-serif;
        font-size: 24px;
        color: #333;
        margin-bottom: 10px;
    }
    .contentbooking2 h5{
        font-size: 16px;
        color: black;
    }
    .dkl {
        margin-bottom: 20px;
    }

    .dkl label {
        display: block;
        margin-top: 10px;
    }

    .dkl input[type="date"],
    .dkl select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .dkl select {
        height: 40px;
    }
    .submitbooking {
        text-align: center;
        margin-top: 20px;
    }

    .submitbooking a {
        text-decoration: none;
    }

    .submitbooking button[type="submit"] {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .submitbooking button[type="submit"]:hover {
        background-color: #45a049;
    }




</style>

