<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member/join.css">

<br><br><br>
   <div class="join-wrapper" id="wrap">
        <h2>회원정보</h2>
           <div class="field">
               <b>아이디*</b>
               <input id="input3" class='id_input' type="text" name="username" value="${member.memberId}" readonly>
            </div>
            <div class="field">
               <b>비밀번호*</b>
               <input id="input3" class='pw_input' type="password" name="memberPw" value="${member.memberPw}" readonly>
            </div>
            <div class="field">
               <b>이름*</b>
               <input id="input3" type="text" name="memberName" value="${member.memberName}" readonly>
            </div>
            <div class="field">
               <b>이메일*</b>
               <input id="input3" type="email" name="memberMail" value="${member.memberMail}" readonly>
            </div>
            <div class="field">
               <b>주소</b>
               <div>
                  <input class="addr_input_1" type="text" id="input4" name="memberAddr1" value="${member.memberAddr1}" readonly>
                  <input type="button" id="input2" value="주소찾기" onclick="daum_address()"> 
               </div>
               <input id="input3" class="addr_input_2" type="text" name="memberAddr2" value="${member.memberAddr2}" readonly>
               <input id="input3" class="addr_input_3" type="text" name="memberAddr3" value="${member.memberAddr3}" readonly>
           </div>
           <div class="field">
           		<input type="button" value="수정하기" onClick="location.href='/member/modify?memberId=${member.memberId}'">
           </div>
           
    </div>
    <br><br><br><br><br><br>
    

<%@include file="../includes/footer.jsp" %>