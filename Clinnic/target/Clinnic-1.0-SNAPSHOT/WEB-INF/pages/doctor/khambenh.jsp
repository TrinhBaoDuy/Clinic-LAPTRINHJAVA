<%-- 
    Document   : kethuoc
    Created on : Aug 23, 2023, 12:24:04 AM
    Author     : hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/doctor/khambenh" var="action" />
<!DOCTYPE html>

<form:form  id="phieubenh" modelAttribute="phieubenh" method="post" action="${action}">
    <input type="hidden" name="appoID" value="${appo.id}" />
    <div class="infor1">
        <div class="contentdkk2_main contentdkk2_main1">
            <div class="contentdkk2 contentdkk21">
                <h1>PHIẾU KHÁM BỆNH NHÂN</h1>
            </div>
            <hr>
            <form:hidden path="prescriptioncol" value="1" />
            <form:hidden path="id" />
            <form:hidden path="prescriptionDate" value="${currentDateTime}"/>
            <div class="contentdkk3">
                <label class="custom-input" id="custom-input1" readonly>${appo.sickpersonId.id}</label>
                <label class="custom-input" id="custom-input1" readonly>${appo.sickpersonId.name}</label>
            </div>

            <div class="contentdkk2  ">
                <h5>* Thông tin bệnh án</h5>
            </div>
            <div class="contentdkk4">
                <div class="contentdkk5">
                    <h5>Triệu chứng</h5>
                    <form:input type="text" class="form-control" path="conclusion" id="conclusion" placeholder="Nhập triệu chứng..." />
                </div>
                <div class="contentdkk5">
                    <h5>Kết luận của bác sĩ</h5>
                    <form:input type="text" class="form-control" path="symptom" id="symptom" placeholder="Nhập kết luận..." />
                </div>
            </div>
        </div>
    </div>
</form:form>
<form:form id="dichvu"  modelAttribute="chitietdichvu" method="post"  action="${action}">
    <input type="hidden" name="appoID" value="${appo.id}" />
    <form:hidden path="appoId"/>
    <form:hidden path="id"/>
    <form:hidden path="dateSer" value="${currentDateTime}"/>
    <form:select class="form-select" id="serviceId" name="serviceId" path="serviceId">
        <c:forEach items="${dichvu}" var="r">
            <option value="${r.id}" selected>${r.name}</option>
        </c:forEach>
    </form:select>

</form:form>
<div class="submitbooking ">
    <button type="submit"  onclick="submitForms()">CẤP THUỐC</button>
</div>
<script>
    function submitForms() {
        document.getElementById("dichvu").submit();
//        document.getElementById("phieubenh").submit();
    }
</script>
<style>

    .infor1{
        /*display: flex;*/
        padding: 30px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        margin: 30px;
        background-color: #F5FFFA;

    }
    .add{
        width: 10%;
    }

    .add button{
        margin: 20px;
        width: 70px;
    }
    .submitbooking a button{

        padding: 14px;
        height: 100px;
        width: 200px;
        font-size: 30px;
        /* text-align: -webkit-auto; */
        font-weight: bold;

        border: 0px solid #ADD8E6;
        background-color:orangered;
        color: white;
        box-shadow: 0px 5px 10px 0 #ADD8E6;
        transition: 0.3s;
        border-radius: 6px;

    }
    .dkk1{

        display: flex;
        justify-content:  space-between;
        /*padding: 50px;*/
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
    }
    /*    .dkk2 h2{
            text-align: center;
    
        }
        .dkk2 div {
    
    
        }*/
    .contentdkk2{
        margin: 20px;
    }
    .booking1{
        width: 30%;
        /*        width: 300px;
                height: 300px;*/
        /*        display: flex;*/
        justify-content: center;
        align-items: center;
        overflow: hidden;
        width: 20%;
    }
    .booking1 img{
        padding: 5px;
        /* border-radius: 20px; */
        border-radius: 50px;
        width: 100%;

        object-fit: cover;
    }
    .form-select{
        border-radius: 10px;
    }

    /*    .contentbooking1{
            width: 100%;
            padding: 45px;
            text-align: justify;
        }
        .contentbooking1 img{
            top: 0;
            left: 0;
            width: 100%;  
            height: 100%;  
            object-fit: cover;
        }*/
    /*.booking1{
        position: relative;
            width: 200px;  Độ rộng của khung chứa ảnh 
            height: 200px;
    }
    .contentbooking1 img{
         position: absolute;
            top: 0;
            left: 0;
            width: 100%;  Độ rộng của ảnh 
            height: 100%;  Chiều cao của ảnh 
            object-fit: cover;
    }*/
    .contentdkk5 input{
        width: 100%;
        border-radius: 5px;
        border-width: 1px;
        margin-bottom: 5px;
    }
    .contentbooking2_main
    {
        display: block;
        padding-bottom: 30px;
        width: 80%;
    }
    /*    .contentbooking2_main{
            width: 70%;
        }*/

    .contentbooking2 h1{
        font-size: 23px;
        font-weight: 700;
        color: #4682B4;
    }
    .contentbooking2 h5{
        font-size: 16px;
        color: black;
    }

    .contentbooking2_main{
        padding-left: 30px;

    }
    hr {
        border: none;
        border-top: 3px solid #ccc;
    }
    select{

        background-color: #f2f2f2;
        color: #333;
        font-size: 14px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        width: 350px;
        height: 40px;
        text-align: center;

    }

    .contentdkk3{

        display: flex;
        justify-content: center;
        margin-top: 50px;
    }
    .contentdkk3 div{

        margin: 20px;
    }
    .contentdkk3 input{
        width: 90%;
        border: 1px solid #e0e0e0;
        border-radius: 10px;
        font-size: 15px;
        padding: 10px;
    }

    .contentdkk3 input:first-child{
        margin-right: 20px;
    }
    /*    .contentdkk3 input{
            width: 90%;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            font-size: 15px;
            padding: 10px;
        }
    
        .contentdkk3 input:first-child{
            margin-right: 20px;
        }
    
        .contentdkk5{
            margin-top: 10px;
            padding-top: 10px;
        }
        .contentdkk5 input{
            width: 100%;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            font-size: 15px;
            padding: 10px;
        }
        .contentdkk4{
            margin-top: 20px;
            font-size: 15px;
            text-align: center;
        }
        .contentdkk4 select{
            width: 100%;
            height: 45px;
            border: 1px solid #e0e0e0;
            padding: 10px;
            border-radius: 10px;
        }*/

    /*    .contentdkk6{
            margin-top: 10px;
            font-size: 15px;
            padding-top: 10px;
            text-align: center;
        }
        .contentdkk6 input{
            width: 100%;
            height: 45px;
            border: 1px solid #e0e0e0;
            padding: 10px;
            border-radius: 10px;
        }*/

    .submitbooking{
        margin-top:30px;
        display: flex;
        justify-content: center;
    }

    .submitbooking a button{

        padding: 14px;


        font-size: 30px;
        /* text-align: -webkit-auto; */
        font-weight: bold;

        border: 0px solid #ADD8E6;
        background-color: #4169E1;
        color: white;
        box-shadow: 0px 5px 10px 0 #ADD8E6;
        transition: 0.3s;
        border-radius: 6px;
        width: 100%;
        height: 70px;
    }
    .infoMeSearch{
        padding-right: 30px;
    }
    .search-form{
        display: flex;
    }
</style>