<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp" %>

<div id="main" class="container mt-5 d-none">
	<h3 class="text-center text-info">로그아웃</h3>
	<form id="frm1" name="frm1" method="post" action="../member/customLogout">		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<br/>		
		<button type="submit" class="btn btn-success d-block mx-auto" id="btn1" >로그아웃</button>		
	</form>
</div>

<script>
$(document).ready(function(){
	$("#btn1").trigger("click");	
});
</script>

<%@include file="../includes/footer.jsp" %>