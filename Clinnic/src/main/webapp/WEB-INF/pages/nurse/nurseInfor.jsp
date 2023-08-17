<%-- 
    Document   : doctorInfor
    Created on : Aug 15, 2023, 1:27:23 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
 
<form:form >
    <div class="infor1">
        <nav class="doctorleft">
            <div class="dkk1">
                <div class="doctor1">
                    <img src="https://res.cloudinary.com/dstqvlt8d/image/upload/v1692082761/969c4e31-83b3-4a58-9e9e-5133602c817a_rvsbt9.jpg" alt="alert"/>
                </div>
                <div class="contentbooking2_main">

                    <div class="contentbooking2">
                        <h1>Thạc sĩ X "link tên tk login vào đây"</h1>
                        <h5>Mã:        </h5>
                        <h5>Ngày sinh: </h5>
                        <h5>Số điện Thoại: </h5>
                        <h5>Địa chỉ: </h5>
                        <h5>Email: </h5>
                        <h5>Giới tính: </h5>
                    </div>


                </div>


            </div>
        </nav>
        <div class="doctorright">
            <h2> Lịch Khám </h2>
                    <div class="content2">

                    <table class="table table-striped">
                        <thead>
                            <tr>

                                <th>Mã lịch khám</th>
                                <th>
                                    <a href="url">Tên khách hàng</a> 
                                </th>
                                <th>Giờ khám</th>

                    
                                <th>Ngày khám</th>
                                <th>Trạng Thái</th>
                                <th></th>
                            </tr>
                        </thead>
                    </table>
                        </div>
        </div>


    </div>
</nav>
</div>
</form:form>
<style>
    .doctorleft{
        width: 30%;
    }
    .doctorright{
        width: 70%;
        padding-left: 30px;
        /*background-image: url(https://res.cloudinary.com/dstqvlt8d/image/upload/v1692119274/Free_Vector___Cardio_heartbeat_medical_and_healthcare_background_oxvnvc.jpg);*/
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;
        margin-left: 30px;
       
        

    }
    .bookingright h1{
  
    text-align: center;
    font-weight: bold;
    padding-top: 30px;
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
/*
 padding-top: 80px;*/
    padding-left: 150px;

        display: flex;
    }
.dkk2 div {

        padding: 30px;
    }
    .doctor1{
        width: 30%;
        /*        width: 300px;
                height: 300px;*/
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }
    .doctor1 img{
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
.doctorright th a{
    color: black;
    text-decoration: auto;
}
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
/*        background-color:orangered;*/
        color: #285cc6;
        box-shadow: 0px 5px 10px 0 #ADD8E6;
        transition: 0.3s;
        border-radius: 6px;
        background-image: url('https://res.cloudinary.com/dstqvlt8d/image/upload/v1692163867/Free_Vector___Blue_dna_background_with_medical_and_healthcare_purpose_askygz.jpg');
  background-size: cover;
  background-position: center;
  padding-top: 5px;
  
    }
    
</style>
