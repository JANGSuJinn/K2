<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>
<link href="/resources/css/board.css" rel="stylesheet" />

<!-- Page content wrapper-->
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <form id='searchForm' action="list" method='get' class="d-flex justify-content-space-between align-items-end">
                    <h1 class="col mt-4">게시판</h1>
                    <div class="col col-4">
                        <div class="input-group mb-3">
                        	<select name='type' class="form-control">
								<option value=""
									<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>----</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>
									제목 or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected':''}"/>>
									제목 or 내용 or 작성자</option>
							</select>
                            <input class="form-control" type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
                            <input type='hidden' name='pageNum' class='form-control' value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
                            <input type='hidden' name='amount' class='form-control' value='<c:out value="${pageMaker.cri.amount}"/>' />
                            <button id="search" class='btn btn-sm btn-outline-secondary' onclick="checkSearchFrm()">검색</button>
							<button id="clear" class="btn btn-sm btn-outline-secondary" type="button">취소</button>
						</div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col col-12">
                    <div class="card">
                        <div class="card-header text-bg-dark">
                            <div class="row">
                                <div class="col-10">게시판</div>
                                <div class="col-2 d-flex justify-content-end"> 
                                    <a href="/board/register" class="btn btn-sm btn btn-outline-primary">등록</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <tr>
                                    <td class="col-1 text-center">번호</td>
                                    <td>제목</td>
                                    <td class="col-2 text-center">작성자</td>
                                    <td class="col-2 text-center">조회수</td>
                                    <td class="col-2 text-center">작성일</td>
                                    <td class="col-2 text-center">수정일</td>
                                </tr>  
                                <c:forEach items="${list}" var="board">
                                <tr>
                                    <td class="text-center"><c:out value="${board.bno}"/></td>
                                    <td>
	                                    <a class='move' href='<c:out value="${board.bno}"/>'>
	                                    	<c:out value="${board.title}"/>
	                                    	<span class='badge text-bg-secondary' style="float:right;">
	                                			<c:out value="${board.replyCnt}"/>
	                                		</span>
	                                    </a>
                                    </td>
                                    <td class="text-center"><c:out value="${board.writer}"/></td>
                                    <td class="text-center"><c:out value="${board.viewcount}"/></td>
                                    <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
                  						value="${board.regDate}" /></</td>
                                    <td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd"
                 	 					value="${board.updateDate}" /></</td>
                                </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div class="card-footer d-flex justify-content-center">
                            <ul class="pagination justify-content-center" style="margin: 10px 0">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link"
									href="${pageMaker.startPage - 1}">Prev</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li
										class="page-item ${pageMaker.cri.pageNum == num ? 'active':''}">
										<a class="page-link" href="${num}">${num}</a>
										</li>
								</c:forEach>
								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class="page-link"
										href="${pageMaker.endPage + 1}">Next</a></li>
								</c:if>
							</ul>
							
							<form id='actionForm' action="list" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'> 
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>	
								<!-- 검색 처리 -->
								<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
								<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
							</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="../includes/messageModal.jsp"%> 
    <script>
    	
        let searchForm = $("#searchForm");
		
		$("#searchForm #search").on(
			"click",
			function(e) {

				if (!searchForm.find("option:selected").val()) {
					alert("검색어의 종류를 선택하세요");
					return false;
				}

				if (!searchForm.find(
						"input[name='keyword']").val()) {
					alert("검색어를 입력하세요");
					return false;
				}

				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();

		});
		
		$('#searchForm #clear').click(function(e){

            searchForm.empty().submit();

       });
		
        
		 $(document).ready(function(){
	        	let result = '<c:out value="${result}"></c:out>';
	        	 
	        	checkModal(result);
	        	
	        	function checkModal(result) {
					if (result == "") {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body #mbody").html(
								"게시글 : " + parseInt(result)
										+ "번이 등록 되었습니다");
					} else if (result == "success") {
						$(".modal-body #mbody").html(
								"게시글 수정/삭제가 처리 되었습니다");
					} else {
						return;
					}

					$("#messageModal").modal("show");
			}	
        	
        	let actionForm = $("#actionForm");
        	
        	$(".page-item a").on("click",function(e) {
				e.preventDefault(); 
				console.log('page 번호 클릭');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
        	
        	$(".move").on("click", function(e){
                
        	      e.preventDefault();
        	      actionForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
        	      actionForm.attr("action","get");
        	      actionForm.submit();
        	      
        	    });
        	
        });
      
        
    </script>
    
    <br><br><br><br><br><br>
   
<%@include file="../includes/footer.jsp" %>