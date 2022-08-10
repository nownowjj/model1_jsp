<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			// alert($('table tbody tr').length);
		});	
		function gotopage(){
			location.href = '<%=noForm%>boAllList' ;
		}
	</script>
</head>
<body>
	<br/>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title" align="center">게시물 상세 보기</h2>
			</div>
			<div class="panel-body" align="center">제목 : (${bean.title})에 관한 상세 페이지 입니다~</div>
			<table id="infotable" class="table table-hover">
				<tr>
					<td class="header" align="center">글번호</td>
					<td align="left">${bean.b_no}</td>
				</tr>
				<tr>
					<td class="header" align="center">글제목</td>
					<td align="left">${bean.title}</td>
				</tr>
				<tr>
					<td class="header" align="center">작성자</td>
					<td align="left">${bean.writer}</td>
				</tr>
				<tr>
					<td class="header" align="center">글내용</td>
					<td align="left">${bean.b_content}</td>
				</tr>
				<tr>
					<td class="header" align="center">작성일자</td>
					<td align="left">${bean.b_date}</td>
				</tr>
				<tr>
					<td class="header" align="center">강의실</td>
					<td align="left">${bean.lecture_room}</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<button class="btn btn-primary" onclick="gotopage();">
							돌아 가기
						</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>










