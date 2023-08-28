<%-- 
    Document   : Footer
    Created on : Jul 29, 2023, 2:02:36 PM
    Author     : Trinh Bao Duy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form >
    <footer>
  <div class="footers">
    <div class="row">
      <div class="col-md-6">
        <h4>Thông tin liên hệ</h4>
        <p>PISCES Hospital</p>
        <p>371 Nguyễn Kiệm Phường 3</p>
        <p>Quận Gò Vấp, TP.HCM</p>
        <p>Điện thoại: 0826523430</p>
        <p>Email: pisceshospital@gmail.com</p>
      </div>
      <div class="col-md-6">
        <h4>Liên kết nhanh</h4>
        <ul>
          <li><a href="#">Trang chủ</a></li>
          <li><a href="#">Giới thiệu</a></li>
          <li><a href="#">Dịch vụ</a></li>
          <li><a href="#">Bác sĩ</a></li>
          
        </ul>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="col-md-12">
        <p class="text-center">© 2023 Bệnh viện PISCES. All rights reserved.</p>
      </div>
    </div>
    
  </div>
</footer>
    
</form:form>

<style>
    footer {
  background-color: #f8f8f8;
  padding: 30px 0;
}

footer h4 {
  color: #333;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 20px;
}

footer p {
  color: #666;
  font-size: 14px;
  line-height: 1.5;
  margin-bottom: 10px;
}

footer ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

footer ul li {
  margin-bottom: 10px;
}

footer ul li a {
  color: #666;
  text-decoration: none;
  transition: color 0.3s ease;
}

footer ul li a:hover {
  color: #333;
}

footer hr {
  border: none;
  border-top: 1px solid #ddd;
  margin: 20px 0;
}

footer p.text-center {
  margin-top: 20px;
  color: #999;
  font-size: 12px;
}
</style>
