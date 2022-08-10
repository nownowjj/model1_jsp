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
				<h2 class="panel-title">현재 본인의 출결상황리스트입니다.</h2>
			</div>
			<div class="panel-body">
				현재 출결 상황을 조회합니다.
				<!-- 버튼 그룹을 이용하여 아래 표의 클래스를 변경할 것임. -->
				
			</div>


			<table id="tclass" class="table table-hover">
				<thead>
					<tr>
						<th align="center">아이디</th>
						<th align="center">이름</th>
						<th align="center">일자</th>
						<th align="center">출결</th>
						<th align="center">사유</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.student_id}</td>
						<td>${bean.student_name}</td>
						<td>${bean.att_date}</td>
						<td>${bean.att}</td>
						<td>${bean.reason}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<table>
					<tr>
						<c:forEach var="i" begin="1" end="${requestScope.totalPage}">
							<td class="pagenavi">
								<a href="<%=noForm%>stuAttAll&pagenum=${i}&id=${sessionScope.loginfostd.student_id}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a>
							</td>
						</c:forEach>
					</tr>
				</table>
			</div>
			<div align="center">
				${requestScope.pageInfo.pagingHtml}
			</div>
		</div>
	</div>
</body>
<!-- <footer> -->
<%-- 	<%@ include file="./../common/commonfooter.jsp"%> --%>
<!-- </footer> -->
</html>
