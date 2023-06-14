<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link href="/resources/css/board.css" rel="stylesheet" />

<!-- Page content wrapper-->
    <div class="container">
        <div class="container-fluid">
            <h1 class="mt-4">게시판</h1>
            <div class="row">
                <div class="col col-12">
                    <div class="card">
                        <div class="card-header text-bg-dark">
                            <div class="row">
                                <div class="col-10">게시판 수정</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <form name="boardFrm" id="boardFrm"  method="post" action="modify">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
        						<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
        						<!-- 검색 적용 -->
        						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
              			 		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'> 
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="bno" class="form-label">번호</label>
                                            <input style="background-color: #e0dede;" type="text" name="bno" id="bno" value='<c:out value="${board.bno}"/>' class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="title" class="form-label">제목</label>
                                            <input type="text" name="title" id="title" value='<c:out value="${board.title}"/>' class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="content" class="form-label">내용</label>
                                            <textarea name="content" id="content" class="form-control" rows="5" > <c:out value="${board.content}"/></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="writer" class="form-label">작성자</label>
                                            <input style="background-color: #e0dede;" type="text" name="writer" id="writer" value='<c:out value="${board.writer}"/>' class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="regDate" class="form-label">게시일</label>
                                            <input style="background-color: #e0dede;" type="text" name="regDate" id="regDate"value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regDate}" />' class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="mb-3">
                                            <label for="updateDate" class="form-label">수정일</label>
                                            <input style="background-color: #e0dede;" type="text" name="updateDate" id="updateDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
	                        </div>
	                        <div class="card-footer d-flex justify-content-center">
	                        <sec:authentication property="principal" var="pinfo"/>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${pinfo.username eq board.writer}">
	                            	<button type="submit" onclick="checkFrm()" data-oper='modify' class="btn btn-outline-primary btn-sm me-1" >수정</button>
	                            	<button type="submit" onclick="checkFrm()" data-oper='remove' class="btn btn-outline-secondary btn-sm me-1">삭제</button>
	                        	</c:if>
	                        </sec:authorize>
	                        	<a type="submit" href="list" data-oper='list' class="btn btn-outline-secondary btn-sm me-1" data-oper='list'>목록</a>
	                        </div>
                    	</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function checkFrm() {
            let f = document.boardFrm;

            if(f.title.value == '') {
                alert('제목을 입력하세요');
                f.title.focus();
                return;
            }

            if(f.content.value == '') {
                alert('내용을 입력하세요');
                f.content.focus();
                return;
            }

            f.submit();
        }
    </script>
	<script>
	$(document).ready(function(){
		let formObj = $("#boardFrm");
		
		$("button").on("click",function(e){
			e.preventDefault();
			
			let operation = $(this).data("oper");
			
			console.log("operation : "  + operation);
			
			if(operation == "remove") {
				formObj.attr("action","remove");
			}
			else if(operation == "list") {
				formObj.attr("action", "list").attr("method","get");
				//페이지 정보
				let pageNumTag = $("input[name='pageNum']").clone(); 
			    let amountTag = $("input[name='amount']").clone();
				//검색정보
			    let keywordTag = $("input[name='keyword']").clone();
			    let typeTag = $("input[name='type']").clone();
			    
				formObj.empty();
				formObj.append(pageNumTag); 
			    formObj.append(amountTag);
			    formObj.append(keywordTag);
			    formObj.append(typeTag);	       
			}
			formObj.submit();
		});
		
	});
	</script>
    
    <br><br><br><br><br><br>

<%@include file="../includes/footer.jsp" %>