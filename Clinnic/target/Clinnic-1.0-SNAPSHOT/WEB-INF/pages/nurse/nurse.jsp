<%-- 
    Document   : doctorInfor
    Created on : Aug 15, 2023, 1:27:23 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<c:url value="/nurse" var="action" />
<sec:authorize access="hasRole('NURSE')">
        <div class="infor1">
            <form:form method="post" action="${action}" modelAttribute="nurse"  enctype="multipart/form-data">
                <nav class="bookingleft">
                    <div class="dkk1">
                        <div class="booking1">
                            <img src="${nurse.avatar}" alt="alert"/>
                        </div>
                        <div class="contentbooking2_main">

                            <div class="contentbooking2">
                                <h1>Y tá ${nurse.name}</h1>
                                <h5>Mã: ${nurse.id} </h5>
                                <h5>Ngày sinh: ${nurse.dod}</h5>
                                <h5>Số điện Thoại: ${nurse.phone}</h5>
                                <h5>Địa chỉ: ${nurse.address}</h5>
                                <h5>Email: ${nurse.emaill}</h5>
                                <h5>Giới tính: ${nurse.sex}</h5>
                            </div>


                        </div>


                    </div>
                </nav>
            </form:form>
            <nav class="bookingright">
                <div class="dkk2">
                    <div class="submitbooking">
                        <a href="#"><button type="submit">Khám Bệnh</button></a>
                    </div>
                    <div class="submitbooking">
                        <a href="#"><button type="submit">Xem Lịch Khám</button></a>
                    </div>

                </div>

            </nav>
        </div>
</sec:authorize>
    <style>
        .bookingleft{
            width: 30%;
        }
        .bookingright{
            width: 70%;
            padding-left: 30px;
            background-image: url(https://res.cloudinary.com/dstqvlt8d/image/upload/v1692119274/Free_Vector___Cardio_heartbeat_medical_and_healthcare_background_oxvnvc.jpg);
            border: 0.5px solid #5AAC4E;
            border-radius: 30px;
            margin-left: 30px;
            background-color: rgba(0, 0, 0, 0.5);

        }
        .infor1{
            display: flex;
            padding: 30px;

        }
        .dkk1{

            /*        display: flex;*/
            justify-content:  space-between;
            /*padding: 50px;*/
            border: 0.5px solid #5AAC4E;
            border-radius: 30px;
        }
        .dkk2{

            padding-top: 80px;
            padding-left: 150px;

            display: flex;
        }
        .dkk2 div {

            padding: 30px;
        }
        .booking1{
            width: 30%;
            /*        width: 300px;
                    height: 300px;*/
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }
        .booking1 img{
            padding: 5px;
            /* border-radius: 20px; */
            border-radius: 50px;
            width: 100%;
            height: 100%;
            object-fit: cover;
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
        .contentdkk1 h3{
            font-size: 18px;
            color: white;
        }
        .contentbooking2_main
        {
            display: block;
            padding-bottom: 30px;
            width: 70%;
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
            margin-top: 30px;
            display: flex;
            justify-content: center;
        }
        .contentdkk3 input{
            width: 350px;
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
        }

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
    </style>