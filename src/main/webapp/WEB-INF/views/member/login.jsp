<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/member/login.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
	
    <div class="login-wrapper">
    	<div style="text-align: center;">
        	<h4><c:out value="${error}"/></h4>
  			<h4><c:out value="${logout}"/></h4>
  		</div>
        <h2>로그인</h2>
        <form method="post" action="/login" id="login-form">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        	<b>아이디</b>
            <input type="text" name="username" placeholder="ID">
            <b>비밀번호</b>
            <input type="password" name="password" placeholder="Password">
            
            <div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="rememberMe" name="remember-me" checked>
				<label class="form-check-label" for="rememberMe" aria-describedby="rememberMeHelp">remember-me</label>			
			</div>
			
            <input type="submit" value="로그인">
            <input type="button" value="회원가입" onclick="location.href='/member/join'">
        </form>
    </div>
    
</body>
</html>
<%@include file="../includes/footer.jsp" %>