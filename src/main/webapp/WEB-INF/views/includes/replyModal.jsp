<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replyModal</title>
</head>
<body>
	<div class="modal fade" id="replyModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">댓글쓰기</h5>
					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
			 	 		<label>내용</label>
			 	 		<input class="form-control" name='reply' value='New Reply!!!!'>
			 	 	</div>	
			 	 	<div class="form-group">
			 	 		<label>작성자</label>
			 	 		<input style="background-color: #e0dede;" class="form-control" name='replyer' value='Replyer'readonly>
			 	 	</div>	
			 	 	<div class="form-group">
			 	 		<label>작성 날짜</label>
			 	 		<input style="background-color: #e0dede;" class="form-control" name='replyDate' value='2023-05-04'>
			 	 	</div>
				</div>
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-primary">수정</button>
		        	<button id='modalRemoveBtn' type="button" class="btn btn-primary">삭제</button>
		        	<button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
		        	<button id='modalCloseBtn' type="button" class="btn btn-dark">닫기</button>		
				</div>
			</div>
		</div>
	</div>
</body>
</html>