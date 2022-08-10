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
			
			var list = ['출석', '병결', '결석','지각','조퇴','공결'];
			$.each(list, function(index, item){
				console.log(item);
				var optvalue = '<option value="' + item + '">' + item + '</option>' ;
				$('#list').append(optvalue);
			});	
			
			//$("#birth").datepicker(); // 날짜 선택기
			$("#birth").datepicker({dateFormat:"yy/mm/dd"}); // 날짜 선택기
			
			$('option[value="${requestScope.bean.att}"]').attr('selected',true);
			
		});
	</script>
</head>
<body>
	<div class="container" align="center">
		<h2>학생 출결 수정하기</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left">
						<b>출결 수정</b>을 위한 양식입니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="a_no" value="${requestScope.bean.a_no}">
						<input type="hidden" name="command" value="teaAttUpdate">
						<input type="hidden" name="teacher_id" value="${sessionScope.loginfotea.teacher_id}">
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="id"> 학생 아이디 </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeid" disabled="disabled"
									 name="fakeid" value="${requestScope.bean.student_id}">
								<input type="hidden"id="id" name="id" value="${requestScope.bean.student_id}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="name"> 학생 이름 </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakename" disabled="disabled"
									 name="fakename" value="${requestScope.bean.student_name}">
								<input type="hidden"id="name" name="name" value="${requestScope.bean.student_name}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="att_date"> 출석일자 </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeatt_date" disabled="disabled"
									 name="fakeatt_date" value="${requestScope.bean.att_date}">
								<input type="hidden"id="att_date" name="att_date" value="${requestScope.bean.att_date}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="list"> 출결여부 </label>
							<div class="col-sm-<%=content%>">
								<select class="form-control" id="list" name="list">
								    <option value="-">----- 출결여부를 선택해 주세요. -----</option>								    
							  	</select>								
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="reason"> 사유 </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="reason"
									name="reason" value="${requestScope.bean.reason}">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="remark"> 학생 이름 </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="fakeremark" disabled="disabled"
									 name="fakeremark" value="${requestScope.bean.remark}">
								<input type="hidden"id="remark" name="remark" value="${requestScope.bean.remark}">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">수정하기</button>
							</div>

							<div class="col-sm-offset-1 col-sm-2">
								<button type="reset" class="btn btn-default">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- <footer> -->
<%-- 	<%@ include file="./../common/commonfooter.jsp"%> --%>
<!-- </footer> -->
</html>