<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
	int label = 3 ; // 양식의 label 너비
	int content = twelve - label ; // 양식의 입력 상자(input, select, textarea 등)의 너비 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function gotopage(){
		location.href = '<%=noForm%>main' ;
	}
</script>
</head>
<body>
<div class="container" align="center">
		<h2>게시판 작성</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left">
						<b>게시판 작성</b>을 위한 양식입니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="boInsert">
						<!----------------------------------------------------->
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="title"> 글 제목 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text" class="form-control" id="title" name="title" placeholder="글 제목 입력">
							</div>
						</div>
						<!----------------------------------------------------->
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="b_content"> 글 내용 : </label>
							<div class="col-sm-<%=content%>">
								<input type="text"  class="form-control" id="b_content" name="b_content" placeholder="글 내용 입력">
							</div>
						</div>
						<!----------------------------------------------------->
						<div class="form-group">
							<label class="control-label col-sm-<%=label%>" for="lecture_room"> 강의실 선택 : </label>
							<div class="col-sm-<%=content%>">
									 <select class="form-control" id="lecture_room" name="lecture_room">
									 	<option value="10강의실">10 강의실</option>
									 	<option value="11강의실">11 강의실</option>
									 	<option value="12강의실">12 강의실</option>
									 </select>
							</div>
						</div>
						<!-- --------------------------------------------------------- -->
						<c:if test="${whologin == 1 }">
							<input type="hidden" name="writer" value="${sessionScope.loginfostu.student_id}">  <!-- 수정  -->
						</c:if>						
						<c:if test="${whologin == 3 }">
							<input type="hidden" name="writer" value="${sessionScope.loginfotea.teacher_id}">  <!-- 수정  -->						
						</c:if>
						<c:if test="${whologin == 4 }">
							<input type="hidden" name="writer" value="${sessionScope.loginfomem.id}">  <!-- 수정  -->
						</c:if>						
						<!-- --------------------------------------------------------- -->
						<div class="form-group">
							<div class="col-sm-offset-1 col-sm-4">
								<button id="submit" type="submit" class="btn btn-default">게시물 작성하기</button>
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

</form>
</body>
</html>