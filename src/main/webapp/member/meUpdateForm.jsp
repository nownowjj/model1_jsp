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
		.select {
		width : 600px;
	    margin-top: -10px;
	}
	.select input[type=radio]{
	    display: none;
	}
	.checkbox-inline, .radio-inline{
		padding-left : 0px;
	}
	.select input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 24px;
	    width: 90px;
	    border: 1px solid #333;
	    line-height: 24px;
	    text-align: center;
	    font-weight:bold;
	    font-size:13px;
	}
	.select input[type=radio]+label{
	    background-color: #fff;
	    color: #333;
	}
	.select input[type=radio]:checked+label{
	    background-color: #333;
	    color: #fff;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.fakeaddress').attr('disabled', true); // 주소 읽기 전용으로 설정
			$('.radio-inline').addClass('radio-inline') ; // 라디오 버튼 스타일 지정
			
			var lecture_room = ['10강의실', '11강의실', '12강의실'];
			$.each(lecture_room, function(index, item){
				console.log(item);
				var optvalue = '<option value="' + item + '">' + item + '</option>' ;
				$('#lecture_room').append(optvalue);
			});	
			
			//$("#birth").datepicker(); // 날짜 선택기
			$(".birth").datepicker({dateFormat:"yy/mm/dd"}); // 날짜 선택기
			
			$('option[value="${requestScope.bean.lecture_room}"]').attr('selected',true);
			
		});
		function gotopage(){
			location.href = '<%=noForm%>main' ;
		}
	</script>
</head>
<body>
	<div class="container" align="center">
		<h2>회원 정보 수정하기</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left">
						<b>회원 정보 수정</b>을 위한 양식입니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="meUpdate">
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="id"> 아이디 : </label>
							<div class="col-sm-<%=content%>">
								<input type="hidden" id="status" name="status" value="${requestScope.status}">
								<c:if test="${requestScope.bean.status==1}">
									<input type="text" class="form-control" id="fakeid" disabled="disabled"
										 name="fakeid" value="${requestScope.bean.student_id}">
									<input type="hidden"id="id" name="id" value="${requestScope.bean.student_id}">
								</c:if>
								<c:if test="${requestScope.bean.status==3}">
									<input type="text" class="form-control" id="fakeid" disabled="disabled"
										 name="fakeid" value="${requestScope.bean.teacher_id}">
									<input type="hidden"id="id" name="id" value="${requestScope.bean.teacher_id}">
								</c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="name"> 이름 : </label>
							<c:if test="${requestScope.bean.status==1}">
								<div class="col-sm-<%=content%>">
									<input type="text" class="form-control" id="name"
									placeholder="이름 입력" name="name" value="${requestScope.bean.student_name}">
								</div>
							</c:if>
							<c:if test="${requestScope.bean.status==3}">
								<div class="col-sm-<%=content%>">
									<input type="text" class="form-control" id="name"
									placeholder="이름 입력" name="name" value="${requestScope.bean.teacher_name}">
								</div>
							</c:if>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="password"> 비밀 번호 : </label>
							<c:if test="${requestScope.bean.status==1}">	
								<div class="col-sm-<%=content%>">
									<input type="password" class="form-control" id="password"
									placeholder="비밀 번호 입력" name="password">
								</div>
							</c:if>
							<c:if test="${requestScope.bean.status==3}">	
								<div class="col-sm-<%=content%>">
									<input type="password" class="form-control" id="password"
									placeholder="비밀 번호 입력" name="password">
								</div>
							</c:if>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="gender"> 성별 : </label>
							<c:if test="${requestScope.bean.status==1}">
							
								<div class="col-sm-<%=content%>" align="left">
									<label class="radio-inline">
										<div class="select" >
										<c:if test="${requestScope.bean.student_gender =='남자'}">
<!-- 											<input  type="radio" id="gender1" name="gender" value="남자" checked="checked">남자 -->
										    	 <input type="radio" id="gender1" name="gender" value="남자" checked="checked" ><label for="gender1" class="radio_but">남자</label>

										</c:if>
										<c:if test="${requestScope.bean.student_gender !='남자'}">
<!-- 											<input type="radio" id="gender1" name="gender" value="남자">남자 -->
									    	 <input type="radio" id="gender1" name="gender" value="남자"  ><label for="gender1" class="radio_but">남자</label>

										</c:if>
				
									</label>
									
									<label class="radio-inline">
										<c:if test="${requestScope.bean.student_gender == '여자'}">
<!-- 											<input type="radio" id="gender2" name="gender" value="여자" checked="checked">여자 -->
										     	<input type="radio" id="gender2" name="gender" value="여자" checked="checked"><label for="gender2" class="radio_but">여자</label>

										</c:if>
										<c:if test="${requestScope.bean.student_gender != '여자'}">
<!-- 											<input type="radio" id="gender2" name="gender" value="여자">여자 -->
						     	<input type="radio" id="gender2" name="gender" value="여자" ><label for="gender2" class="radio_but">여자</label>

										</c:if>
										</div>
									</label>
								</div>
								
								
								
								<!--  -->
							</c:if>
							<c:if test="${requestScope.bean.status==3}">
<%-- 								<div class="col-sm-<%=content%>" align="left"> --%>
<!-- 									<label class="radio-inline"> -->
<%-- 										<c:if test="${requestScope.bean.teacher_gender =='남자'}"> --%>
<!-- 											<input type="radio" id="gender1" name="gender" value="남자" checked="checked">남자 -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${requestScope.bean.teacher_gender !='남자'}"> --%>
<!-- 											<input type="radio" id="gender1" name="gender" value="남자">남자 -->
<%-- 										</c:if> --%>
<!-- 									</label> -->
									
<!-- 									<label class="radio-inline"> -->
<%-- 										<c:if test="${requestScope.bean.teacher_gender == '여자'}"> --%>
<!-- 											<input type="radio" id="gender2" name="gender" value="여자" checked="checked">여자 -->
<%-- 										</c:if> --%>
<%-- 										<c:if test="${requestScope.bean.teacher_gender != '여자'}"> --%>
<!-- 											<input type="radio" id="gender2" name="gender" value="여자">여자 -->
<%-- 										</c:if> --%>
<!-- 									</label> -->
<!-- 								</div> -->
								<div class="col-sm-<%=content%>" align="left">
									<label class="radio-inline">
										<div class="select" >
										<c:if test="${requestScope.bean.teacher_gender =='남자'}">
<!-- 											<input  type="radio" id="gender1" name="gender" value="남자" checked="checked">남자 -->
										    	 <input type="radio" id="gender1" name="gender" value="남자" checked="checked" ><label for="gender1" class="radio_but">남자</label>

										</c:if>
										<c:if test="${requestScope.bean.teacher_gender !='남자'}">
<!-- 											<input type="radio" id="gender1" name="gender" value="남자">남자 -->
									    	 <input type="radio" id="gender1" name="gender" value="남자"  ><label for="gender1" class="radio_but">남자</label>

										</c:if>
				
									</label>
									
									<label class="radio-inline">
										<c:if test="${requestScope.bean.teacher_gender == '여자'}">
<!-- 											<input type="radio" id="gender2" name="gender" value="여자" checked="checked">여자 -->
										     	<input type="radio" id="gender2" name="gender" value="여자" checked="checked"><label for="gender2" class="radio_but">여자</label>

										</c:if>
										<c:if test="${requestScope.bean.teacher_gender != '여자'}">
<!-- 											<input type="radio" id="gender2" name="gender" value="여자">여자 -->
						     	<input type="radio" id="gender2" name="gender" value="여자" ><label for="gender2" class="radio_but">여자</label>

										</c:if>
										</div>
									</label>
								</div>
							</c:if>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="birth"> 생일 : </label>
							<c:if test="${requestScope.bean.status==1}">
								<div class="col-sm-<%=content%>">
									<input type="text" class="form-control birth"
										placeholder="생일 입력" name="birth" value="${requestScope.bean.student_birth}">
								</div>
							</c:if>
							<c:if test="${requestScope.bean.status==3}">
								<div class="col-sm-<%=content%>">
									<input type="text" class="form-control birth"
										placeholder="생일 입력" name="birth" value="${requestScope.bean.teacher_birth}">
								</div>
							</c:if>
						</div>		
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="address"> 주소 : </label>
							<c:if test="${requestScope.bean.status==1}">
								<div class="col-sm-<%=content%>">
									<input type="text" class="form-control" id="address" name="address" value="${requestScope.bean.student_address}">
								</div>
							</c:if>
							<c:if test="${requestScope.bean.status==3}">
								<div class="col-sm-<%=content%>">
									<input type="text"class="form-control" id="address" name="address" value="${requestScope.bean.teacher_address}">
								</div>
							</c:if>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="lecture_room"> 강의실 </label>
							<div class="col-sm-<%=content%>">
								<select class="form-control" id="lecture_room" name="lecture_room">
								    <option value="-">----- 강의실을 선택해 주세요. -----</option>								    
							  	</select>								
							</div>
							
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">수정하기</button>
							</div>
							<div class="col-sm-offset-1 col-sm-2">
								<button type="reset" class="btn btn-default" onclick="gotopage();">메인으로 돌아가기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>