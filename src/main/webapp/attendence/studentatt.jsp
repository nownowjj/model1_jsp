<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	.yellow{
		background-color: yellow;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">현재 본인의 출결상황요약입니다.</h2>
			</div>
			<div class="panel-body">
				현재 출결 상황을 조회합니다.
				<!-- 버튼 그룹을 이용하여 아래 표의 클래스를 변경할 것임. -->
				
			</div>


			<table id="tclass" class="table table-hover">
				<thead>
					<tr>
						<th>출결상황</th>
						<th>카운트</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.attType}</td>
						<td>${bean.attCount}</td>
					</tr>
				</c:forEach>
					<tr>
						<td colspan="2" align="center">
							<a href="<%=noForm%>stuAttAll&id=${sessionScope.loginfostu.student_id}">자세히보기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
<!-- <footer> -->
<%-- 	<%@ include file="./../common/commonfooter.jsp"%> --%>
<!-- </footer> -->
</html>
