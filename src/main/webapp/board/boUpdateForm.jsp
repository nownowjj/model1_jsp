<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
	int label = 3 ; // 양식의 label 너비
	int content = twelve - label ; // 양식의 입력 상자(input, select, textarea 등)의 너비 
%>
<%
	//Human managers = new Human();

	//request.setAttribute("managers", managers) ; // 관리자 목록을 바인딩
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  
	<style type="text/css">
		.radio-inline{margin-left: 5px;}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fakeaddress').attr('disabled', true); // 주소 읽기 전용으로 설정
			$('.radio-inline').addClass('radio-inline') ; // 라디오 버튼 스타일 지정
			
			var managers = ['yusin', 'kim9', 'soon'];
			$.each(managers, function(index, item){
				console.log(item);
				var optvalue = '<option value="' + item + '">' + item + '</option>' ;
				$('#manager').append(optvalue);
			});	
			
			$("#birth").datepicker({dateFormat : "yy/mm/dd" }); // 날짜 선택기
			
			
		});
		
		
		
	</script>
	
	<script type="text/javascript">
		function gotopage(){
			location.href = '<%=noForm%>boAllList' ;
		}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2>게시물 수정하기</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="center">
						작성하신 글 :(${requestScope.bean.title}) 수정을 위한 페이지 입니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form id="testCode" class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="boUpdate">
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="fakeb_no"> 글번호 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeb_no"
									disabled="disabled" name="fakeb_no" value="${requestScope.bean.b_no}">
								<input type="hidden" name="b_no" value="${requestScope.bean.b_no}">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="writer"> 글쓴이 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fake_writer"
									 disabled="disabled" name="fake_writer" value="${requestScope.bean.writer}">
								<input type="hidden" name="writer" value="${requestScope.bean.writer}">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="fake_b_date"> 작성일 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fake_b_date"
									 disabled="disabled" name="fake_b_date" value="${requestScope.bean.b_date}">
								<input type="hidden" name="b_date" value="${requestScope.bean.b_date}">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="title"> 글제목 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="title"
									 name="title" value="${requestScope.bean.title}">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="b_content"> 글 내용 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="b_content"
									 name="b_content" value="${requestScope.bean.b_content}">
							</div>
						</div>
						
						
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="lecture_room"> 강의실 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="lecture_room"
									 name="lecture_room" value="${requestScope.bean.lecture_room}">
							</div>
						</div>
						
						
						<input type="hidden" name="writer" value="${sessionScope.loginfostu.student_id}"> <!-- 수정-->
						
						

						<div class="form-group">
							<div class="col-sm-offset-1 col-sm-4">
								<button id="submit" type="submit" class="btn btn-default">수정하기</button>
							</div>

							<div class="col-sm-offset-1 col-sm-2">
								<button type="reset" class="btn btn-default" onclick="gotopage();">취소</button>
							</div>
							
							<div class="col-sm-offset-1 col-sm-2">
								<button type="reset" class="btn btn-default">초기화</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>