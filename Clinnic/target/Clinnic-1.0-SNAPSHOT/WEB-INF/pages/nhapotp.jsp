<%-- 
    Document   : nhapotp
    Created on : Sep 8, 2023, 5:26:54 PM
    Author     : Trinh Bao Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="<c:url value="/forgot-password" />" method="post">
  <label for="email">Địa chỉ email:</label>
  <input type="email" id="email" name="email" required>
  <button type="submit">Gửi mã OTP</button>
</form>
