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
                                <div class="col-10">게시판 등록</div>
                            </div>
                        </div>
                        <form name="boardFrm" id="boardFrm" method="post" action="register" role="form">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        	<div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group mb-3">
                                            <label class="form-label">제목</label>
                                            <input type="text" class="form-control" id="title" placeholder="제목을 입력하세요." name="title"  required />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group mb-3">
                                            <label class="form-label">내용</label>
                                            <textarea name="content" id="content" class="form-control" rows="5" placeholder="내용을 입력하세요." required></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-group mb-3">
                                            <label class="form-label">작성자</label>
                                            <input style="background-color: #e0dede;" type="text" id="writer" name="writer" class="form-control" 
                                            	value='<sec:authentication property="principal.username"/>' readonly />	
                                        </div>
                                    </div>
                                </div>
                        	</div>
                        <div class="card-footer d-flex justify-content-center">
                            <button type="submit" onclick="checkFrm()" class="btn btn-outline-primary btn-sm me-1">등록</button>
                            <button type="reset" class="btn btn-outline-secondary btn-sm me-1">취소</button>
                            <a type="button" id="listLink" href="list" class="btn btn-outline-secondary btn-sm me-1">목록</a>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    function checkFrm()
    {
        let f = document.boardFrm;

        if(f.title.value == ''){
            alert('제목을 입력하세요.');
            f.title.focus();
            return;
        }
        
        if(f.writer.value == ''){
            alert('작성자를 입력하세요.');
            f.content.focus();
            return;
        }

        if(f.content.value == ''){
            alert('내용을 입력하세요.');
            f.content.focus();
            return;
        }
        
        f.submit();
    }
</script>

<br><br><br><br><br><br>
    

<%@include file="../includes/footer.jsp" %>