<%@page import="oracle.jdbc.oracore.TDSPatch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
/* 		body { min-height: 100vh; background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c)); background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); } */

		
	</style>
	<script type="text/javascript">
	/*
		
	*/
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">성적 조회</h3>
			</div>
			<table id="infotable" class="table table-hover">
				<thead>
					<tr>
						<th>성적 번호</th>
						<th>학생아이디</th>
						<th>강사아이디</th>
						<th>과목코드</th>
						<th>과목점수</th>
<!-- 						<th>비고</th> -->
						<th>수정하기</th>
<!-- 						<th>삭제하기</th> -->
		
					</tr>
				</thead>
				<tbody>
					<%-- 리스트 목록을 불러와서 forEach 문장으로 tr, td 생성 --%>
					<c:forEach var="bean" items="${requestScope.lists}" varStatus="cnt">
						<tr>
							<td><c:out value="${cnt.count}"/></td>
							<td>${bean.student_id}</td>
							<td>${bean.teacher_id}</td>
							<td>${bean.s_code}</td>
							<td>${bean.lecture_score}</td>
<%-- 							<td>${bean.remark}</td> --%>
							
							
							<td><a href="<%=noForm%>grUpdate&id=${bean.student_id}&s_code=${bean.s_code}">수정하기</a></td>
<%-- 							<td><a href="<%=noForm%>grDelete&student_id=${bean.student_id}">삭제하기</a></td> --%>
						
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>