<%-- 
    Document   : doctorInfor
    Created on : Aug 15, 2023, 1:27:23 PM
    Author     : hung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<div class="infor1">
    <nav class="bookingleft">
        <form:form >
            <h2>THÔNG TIN KHÁM </h2>
            <div class="dkk1">
                <div class="booking1">
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
                        <h5>Ngày khám: </h5>
                        <h5>Giờ khám: </h5>
                        <div class="form-group" ">
                            <label for="problem">Chuẩn đoán bệnh:</label>
                            <input type="text" class="form-control" path="" id="problem"/>
                        </div>


                    </div>


                </div>


            </div>
        </form:form >
    </nav>
    <nav class="bookingright ">
        <div class="dkk2">

            <div class="contentdkk3  "  >

                <div class='content1'>
                    <h2>Tra cứu</h2>
                    <div class = "infoMeSearch" >
                        <form class="search-form" action="${action}">
                            <input class="form-control me-2" type="text"   name="name" placeholder="Nhập tên thuốc..."/>
                            <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i> Tìm</button>
                        </form>
                    </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên thuốc</th>
                                <th>Số lượng kho</th>
                                <th>Đơn giá</th>
                                <th>Đơn vị</th>

                                <th>Nhà sản xuất</th>
                                <th>Ngày sản xuất</th>
                                <th>Ngày hết hạn</th>
                                <th></th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="add">
                    <button class="btn btn-primary" type="submit"><i class="fas fa-search"></i>>></button>

                </div>
                <div class="content2">
                    <h2> Toa Thuốc</h2>

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


        </div>
    </nav>
</div>

<style>
    .bookingleft{

    }
    .bookingright{
        display: flex;


    }
    .content1{
        width: 70%;
        padding-left: 30px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;


    }
    .content2{
        width: 70%;
        padding-left: 30px;
        border: 0.5px solid #5AAC4E;
        border-radius: 30px;


    }
    .infor1{
        /*display: flex;*/
        padding: 30px;

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
    .infoMeSearch{
        padding-right: 30px;
    }
    .search-form{
        display: flex;
    }
</style>
