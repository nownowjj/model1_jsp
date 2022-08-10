<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
int label = 3; // 양식의 label 너비
int content = twelve - label; // 양식의 입력 상자(input, select, textarea 등)의 너비
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<style type="text/css">
.radio-inline {
	margin-left: 5px;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				var list = [ '출석', '병결', '결석', '지각', '조퇴', '공결' ];
				$.each(list, function(index, item) {
					console.log(item);
					var optvalue = '<option value="' + item + '">' + item
							+ '</option>';
					$('.list').append(optvalue);
				});

			});
</script>
</head>
<body>
	<div class="container" align="center">
		<h2>출석체크하기</h2>
		<div class="col-sm-offset-1 col-sm-10">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title" align="left">
						<b>출결 체크</b>를 시작합니다.
					</h3>
				</div>
				<div class="panel-body" class="col-sm-8">
					<form class="form-horizontal" action="<%=yesForm%>" method="post">
						<input type="hidden" name="command" value="teaAttCheck">
						<table>
							<tr>
								<th>ID</th>
								<th>이름</th>
								<th>출결상황</th>
								<th>비고</th>
							</tr>
							<c:forEach var="bean" items="${requestScope.lists}">
								<tr>
									<td>${bean.student_id} <input type="hidden"
										name="student_id" value="${bean.student_id}">
									</td>
									<td>${bean.student_name} <input type="hidden"
										name="student_name" value="${bean.student_name}">
									</td>
									<td>
										<div class="form-group">
											<label class="control-label col-sm-<%=label%>" for="list">
												출결여부 </label>
											<div class="col-sm-<%=content%>">
												<select class="form-control list" name="list">
													<option value="-">----- 출결여부를 선택해 주세요. -----</option>
												</select>
											</div>
										</div>
									</td>
									<td>
										<div class="col-sm-<%=content%>">
										<input type="text" class="form-control" name="reason">
									</div>
									</td>
								</tr>
							</c:forEach>
						</table>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-2">
								<button id="submit" type="submit" class="btn btn-default">출석완료</button>
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