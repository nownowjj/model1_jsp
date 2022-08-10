<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
	int label = 3 ; 
	int content = twelve - label ;
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
/* 		body { min-height: 100vh; background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } */
		#mainId{
			background-color: #FFFFFF ;
		}
		#h2_1{
			color: black ;
		}
		#h3_1{
			background-color: #FFFFFF ;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#fakeaddress').attr('disabled', true); 
			$('.radio-inline').addClass('radio-inline') ; 
			}
		
		
	</script>
	
	<script type="text/javascript">
			function gotopage(){
				location.href = '<%=noForm%>grAllList' ;
			}
	</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="mainClass" id="h2_1">성적 수정하기</h2>
		<div class="col-sm-offset-2 col-sm-8">
			<div class="panel panel-info">
				<div class="panel-heading" id="h3_1">
					<h3 class="panel-title" align="center">
						<b>정확한 정보를 기입하세요.</b>
					</h3>
				</div>
				<div id="mainId" class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post"> 
						<input type="hidden" name="command" value="grUpdate"> 
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="teacher_id"> 강사 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="faketeacher_id"
									disabled="disabled" name="faketeacher_id" value="${requestScope.bean.teacher_id}">
									
								<input type="hidden" name="teacher_id"  value="${requestScope.bean.teacher_id}">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="student_id"> 학생 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="student_id" disabled="disabled"
									 name="student_id" value="${requestScope.bean.student_id}">		
							<input type="hidden" name="student_id"  value="${requestScope.bean.student_id}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="fakes_code"> 과목 코드 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakes_code" disabled="disabled"
									placeholder="과목 코드 입력" name="fakes_code" value="${requestScope.bean.s_code}">
									<input type="hidden" name="s_code"  value="${requestScope.bean.s_code}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="lecture_score"> 점수 입력 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="lecture_score"
									placeholder="점수 입력" name="lecture_score" value="${requestScope.bean.lecture_score}">
							</div>
						</div>
						

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">수정 하기</button>
							</div>
							<div class="col-sm-offset-1 col-sm-2">
								<button type=reset class="btn btn-default" onclick="gotopage();">취소</button>
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