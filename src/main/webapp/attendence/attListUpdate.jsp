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
			$('.radio-inline').addClass('radio-inline') ; // 라디오 버튼 스타일 지정
			
			var att = ['출석', '병결', '결석','지각','조퇴','공결'];
			$.each(att, function(index, item){
				console.log(item);
				var optvalue = '<option value="' + item + '">' + item + '</option>' ;
				$('#att').append(optvalue);
			});	
			
			
		});
	</script>
</head>
<body>
	<div class="container" align="center">
		<h2>출결 수정하기</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left">
						<b>출결 수정</b>을 위한 양식입니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post"> 
						<input type="hidden" name="command" value="manAttUpdate"> 
						<input type="hidden" name="a_no" value="${requestScope.bean.a_no}"> 
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="student_id"> 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeid"
									disabled="disabled" name="fakeid" value="${requestScope.bean.student_id}">
									
								<input type="hidden" name="student_id"  value="${requestScope.bean.student_id}">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="student_name"> 이름 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="student_name"
									 name="student_name" value="${requestScope.bean.student_name}" disabled="disabled">									
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="fakeatt_date"> 출결일 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeatt_date" name="fakeatt_date" value="${requestScope.bean.att_date}" disabled="disabled">
							</div>
							<div class="col-sm-<%=content%>">
								<input type="hidden" class="form-control" id="att_date" name="att_date" value="${requestScope.bean.att_date}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="att"> 출결여부 </label>
							<div class="col-sm-<%=content%>">
								<select class="form-control" id="att" name="att">
								    <option value="-">----- 출결여부를 선택해 주세요. -----</option>								    
							  	</select>								
							</div>
						</div>
									
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="reason"> 사유 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="reason" name="reason" value="${requestScope.bean.reason}">
							</div>
						</div>					

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="remark"> 비고 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="remark" name="remark" value="${requestScope.bean.remark}">
							</div>
						</div>	

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">수정 하기</button>
							</div>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>