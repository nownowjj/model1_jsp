<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<%
	int label = 3 ; 
	int content = twelve - label ;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.radio-inline{margin-left: 5px;}
/* 		body { min-height: 100vh; background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } */
		#h2_1{
			color: black ;
		}
		#h3_1{
			background-color: #FFFFFF ;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.radio-inline').addClass('radio-inline') ; // 라디오 버튼 스타일 지정
			
	</script>
	
	<script type="text/javascript">
		function gotopage(){
			location.href = '<%=noForm%>main' ;
		}
	</script>
</head>
<body>
	<div class="container" align="center">
		<h2 id="h2_1">시험 점수 입력</h2>
		<div class="col-sm-offset-2 col-sm-8">
			<div class="panel panel-info">
				<div id="h3_1" class="panel-heading">
					<h3 class="panel-title" align="center">
						<b>정확한 정보를 기입하세요.</b>
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="grInsertdata">

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="fakestudent_id"> 학생 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakestudent_id" disabled="disabled"
									 name="fakestudent_id" value="${requestScope.id}">
									<input type="hidden" id="student_id" name="student_id" value="${requestScope.id}">
							</div>
						</div><%-- 
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="teacher_id"> 강사 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="teacher_id"
									placeholder="강사 아이디 입력" name="teacher_id" value="${sessionScope.loginfotea.teacher_id}">
							</div>
						</div> --%>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="s_code"> 과목 코드 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="s_code"
									placeholder="과목 코드 입력" name="s_code">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="lecture_score"> 점수 입력 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="lecture_score"
									placeholder="점수 입력" name="lecture_score">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">입력하기</button>
							</div>
							
							<div class="col-sm-offset-1 col-sm-2">
								<button type=reset class="btn btn-default" onclick="gotopage();">취소</button>
							</div>
							
							<div class="col-sm-offset-1 col-sm-2">
								<button type="reset" class="btn btn-default">초기화</button>
							</div>
						
						</div>
						<input type="hidden" name="teacher_id" value="${sessionScope.loginfotea.teacher_id}">

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>