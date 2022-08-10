<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.yellow {
	background-color: yellow;
}
.pagenavi{
	font-size: 15px;
}
</style>

</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">강사님께서 맡으신 학생들 명단입니다.</h2>
			</div>
			<div class="panel-body">학생명단</div>


			<table id="tclass" class="table table-hover">
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생일</th>
						<th>주소</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bean" items="${requestScope.lists}">
						<tr>
							<td>${bean.student_id}</td>
							<td>${bean.student_name}</td>
							<td>${bean.student_gender}</td>
							<td>${bean.student_birth}</td>
							<td>${bean.student_address}</td>
							<td>${bean.lecture_room}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="3" align="center">
							<a href="<%=noForm%>teaAttCheck&id=${sessionScope.loginfotea.teacher_id}">
								<button>출석 체크</button>
							</a>
						</td>
						<td colspan="3" align="center">
							<a href="<%=noForm%>teaAtt&id=${sessionScope.loginfotea.teacher_id}">
								<button>출석 현황 확인</button>
							</a>
						</td>						
					</tr>
				</tbody>
			</table>
<!-- 			<div align="center"> -->
<!-- 				<table> -->
<!-- 					<tr> -->
<%-- 						<c:forEach var="i" begin="1" end="${requestScope.totalPage}"> --%>
<!-- 							<td class="pagenavi"> -->
<%-- 								<a href="<%=noForm%>teaStuList&pagenum=${i}&id=${sessionScope.loginfo.teacher_id}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a> --%>
<!-- 							</td> -->
<%-- 						</c:forEach> --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<!-- 			</div> -->
		</div>
	</div>
</body>
<footer>
	<%@ include file="./../common/commonfooter.jsp"%>
</footer>
</html>
