<%-- 
    Document   : xatminhotp
    Created on : Sep 8, 2023, 5:39:49 PM
    Author     : Trinh Bao Duy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="<c:url value="/verify-otp" />" method="post">
  <label for="otp">Mã OTP:</label>
  <input type="text" id="otp" name="otp" required>
  <button type="submit">Xác minh</button>
</form>
