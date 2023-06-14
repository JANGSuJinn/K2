<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/member/join.css">

<br><br><br>
   <div class="join-wrapper" id="wrap">
        <h2>회원가입</h2>
        <form method="post" action="join" id="joinForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           <div class="field">
               <b>아이디*</b>
               <input class='id_input' type="text" name="memberId" required>
               <span class='id_ck_1'>사용 가능한 아이디입니다.</span>
               <span class='id_ck_2'>아이디가 이미 존재합니다.</span>
            </div>
            <div class="field">
               <b>비밀번호*</b>
               <input class='pw_input' type="password" name="memberPw" required>
            </div>
            <div class="field">
               <b>비밀번호 확인*</b>
               <input class='pwck_input' type="password" name="memberPwCk" required>
               <span class='pw_ck_1'>비밀번호가 일치합니다.</span>
               <span class='pw_ck_2'>비밀번호가 일치하지 않습니다.</span>
            </div>
            <div class="field">
               <b>이름*</b>
               <input type="text" name="memberName" required>
            </div>
            <div class="field">
               <b>이메일*</b>
               <input type="email" name="memberMail" placeholder="abcd@naver.com" required>
            </div>
            <div class="field">
               <b>주소</b>
               <div>
                  <input class="addr_input_1" type="text" id="input1" name="memberAddr1" readonly>
                  <input type="button" id="input2" value="주소찾기" onclick="daum_address()"> 
               </div>
               <input class="addr_input_2" type="text" name="memberAddr2" placeholder="도로명 주소" readonly>
               <input class="addr_input_3" type="text" name="memberAddr3" placeholder="상세주소" readonly>
           </div>
           <div class="field">
               <input type="submit" value="가입하기">
            </div>
        </form>
    </div>
    <br><br><br><br><br><br>
    
<%@include file="../includes/footer.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

   //아이디 중복확인
   $('.id_input').on("propertychange change keyup paste input", function(){

      let memberId = $('.id_input').val();
      let data = {memberId : memberId}
      
      $.ajax({
         type: "get",
         url: "/member/memberIdChk",
         data: data,
         success: function(result) {
            if(result != 'fail') {
               $('.id_ck_1').css("display", "inline-block");
               $('.id_ck_2').css("display", "none");
            }else {
               $('.id_ck_1').css("display", "none");
               $('.id_ck_2').css("display", "inline-block");
            }
         }
      });
   });
   
   //주소찾기
   function daum_address() {
      
      new daum.Postcode({
           oncomplete: function(data) {
              var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 주소변수 문자열과 참고항목 문자열 합치기
                    addr += extraAddr;
                
                } else {
                    addr += ' ';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample6_postcode').value = data.zonecode;
                $(".addr_input_1").val(data.zonecode);
                //document.getElementById("sample6_address").value = addr;
                $(".addr_input_2").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("sample6_detailAddress").focus();
                $(".addr_input_3").attr("readonly", false);
                $(".addr_input_3").focus();
           }
       }).open();
   }
   
   //비밀번호 확인
   $('.pwck_input').on("propertychange change keyup paste input", function(){
      
      let pw = $('.pw_input').val();
      let pwck = $('.pwck_input').val();
      
      if(pw == pwck){
           $('.pw_ck_1').css('display','inline-block');
           $('.pw_ck_2').css('display','none');
       }else{
           $('.pw_ck_1').css('display','none');
           $('.pw_ck_2').css('display','inline-block');
       } 
   })
</script>