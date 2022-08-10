<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
int label = 3; // label의 너비
int content = twelve - label; // 입력상자 양식의 너비(input, select,textarea 등에 대한 너비)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<style type="text/css">

.radio-inline {
	margin-left: 10px;
}
#insertform{
	margin-top : 30px;
}
.emailsend{
	margin-top: 4px;
}
.none{
	display: none;
}
#certificationBtn{
	cursor: pointer;
	border: 1px solid #e8e8e8;
	border-radius: 5px;
	height: 35px;
    background-color: #e8e8e8;
    line-height: 35px;
    text-align: center;
}
.select {
		width : 600px;
	    padding: 15px 10px;
	    margin-top: -10px;
	    padding-left: 20px;
	    margin-left: 135px;
	}
	.select input[type=radio]{
	    display: none;
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
$(document).keypress(function(e) { if (e.keyCode == 13) e.preventDefault(); });

	$(document).ready(function() {
		// -----------------------------------------------------
		// .teacher-check-box 는 강사입력코드 영역 
		// #gojoin 가입하기 버튼
		$(".teacher-check-box").addClass("none");   // 학생으로 checked 되어있으면 인증코드창 숨김
		
		
		$("input:radio[name='tors']").click(function(){
			if($(this).val() == 'teacher'){
				$(".teacher-check-box").removeClass('none');
				$("#gojoin").addClass("none");
			}else{
				$(".teacher-check-box").addClass('none');
				$("#gojoin").removeClass("none");
			}
		})
		// -----------------------------------------------------
		// #certificationBtn 강사인증버튼
		// #certificationNumber 강사인증 입력 코드
		
		
		$("#certificationBtn").click(function(){
			var code = "isTeacher";
			
			var inputcode = $("#certificationNumber").val();
// 			alert(inputcode);
			if(inputcode == code){
				$("#gojoin").removeClass("none");
				alert("인증성공!");
			}else{
				$("#gojoin").addClass("none");
				alert("인증실패!");
			}
		})		
	});
		
		
</script>

</head>
<body>
	<div class="container" align="center">
		<h2>회원 가입하기</h2>
		<div class="col-sm-offset-1 col-sm-10" id="insertform">
			<div class="panel panel-info" id="mainpanel">
				<div class="panel-heading">
					<h5 class="panel-title" align="left">회원가입 양식</h5>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="meJoin">
						<!--  -->
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="id">아이디
								: </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="id"
									placeholder="아이디 입력" name="id">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="name">이름
								: </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="name"
									placeholder="이름 입력" name="name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="password">비밀번호
								: </label>
							<div class="col-sm-<%=content%>">
								<input type="password" class="form-control" id="password"
									placeholder="비밀번호 입력" name="password">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="std_gender">성별
								: </label>
<%-- 							<div class="col-sm-<%=content%>" align="left"> --%>
<!-- 								<label class="radio-inline"> <input type="radio" -->
<!-- 									id="gender1" name="gender" value="남자">남자 -->
<!-- 								</label> <label class="radio-inline"> <input type="radio" -->
<!-- 									id="gender2" name="gender" value="여자">여자 -->
<!-- 								</label> -->
<!-- 							</div> -->
							<div class="select" align="left">
						    	 <input type="radio" id="gender1" name="gender" value="남자" checked="checked" ><label for="gender1" class="radio_but">남자</label>
						     	<input type="radio" id="gender2" name="gender" value="여자" ><label for="gender2" class="radio_but">여자</label>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="birth">생일
								: </label>
							<div class="col-sm-<%=content%>" align="left">
								 <input type="date" id="birth" name="birth">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="address">주소 :</label>
							<div class="col-sm-<%=content%>" align="left">
							 	<input type="text" id="address" name="address">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="address"> 강의실 : </label>
							<div class="col-sm-<%=content%>">
								<select class="form-control" id="lecture_room" name="lecture_room">
								    <option value="-">--- 강의실을 선택해 주세요. ---------</option>
								    <option value="10강의실">10강의실</option>								    
								    <option value="11강의실">11강의실</option>								    
								    <option value="12강의실">12강의실</option>								    
							  	</select>								
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>">강사여부확인
								: </label>
<%-- 							<div class="col-sm-<%=content%>" align="left"> --%>
<!-- 								  <input type="radio" id="student" name="tors" value="student" checked="checked">학생 -->
<!-- 								 <input type="radio" id="teacher" name="tors" value="teacher">강사 -->
<!-- 							</div> -->
							<div class="select" align="left">
						    	 <input type="radio" id="student" name="tors" value="student" checked="checked" ><label for="student" class="radio_but">학생</label>
						     	<input type="radio" id="teacher" name="tors" value="teacher" ><label for="teacher" class="radio_but">강사</label>
							</div>
						</div>
						
						
						<div class="form-group teacher-check-box">
							<label class="control-label col-sm-<%=label%>" for="certificationNumber"> 강사 인증코드
								: </label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="certificationNumber"
									placeholder="인증번호를 입력해주세요" name="certificationNumber">
							</div>
							<div class="col-sm-3" align="left">
								<div id="certificationBtn">(강사님 인증코드 확인 버튼)</div>
							</div>
						</div>
						<input type=submit id="gojoin" name="join_page" value="가입하기" >
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="./../common/commonfooter.jsp"%>
