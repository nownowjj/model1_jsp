<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript">
		function searchAll(){
			location.href='<%=noForm%>manAtt';
		}
		function search(){
			if($('#mode').val() == 'all'){
				alert('검색 항목을 선택해 주세요.') ;
				return false ;
			}
		}
</script>
</head>
<body>
	<br />
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">전체 학생 출결 목록</h2>
			</div>
			<div class="panel-body">전체 학생 출결을 보여 줍니다.</div>
			<table id="infotable" class="table table-hover">
				<thead>
					<tr>
						<th>no</th>
						<th>학생ID</th>
						<th>학생이름</th>
						<th>해당일자</th>
						<th>출석여부</th>
						<th>사유</th>
						<th>비고</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
				<tr>
						<td colspan="10" align="center">
							<form class="form-inline" action="<%=yesForm%>" method="get">
								<input type="hidden" name="command" value="manAtt">
								<input type="hidden" name="pageNumber"
									value="${requestScope.pageInfo.pageNumber}"> 
								<input type="hidden" name="pageSize"
									value="${requestScope.pageInfo.pageSize}">
								<div class="form-group">
									<select class="form-control btn-xs" name="mode" id="mode">
										<option value="all">-- 검색할 항목을 선택하세요.
										<option value="student_id">학생아이디
										<option value="att">출석상태
										<option value="student_name">학생이름
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control btn-xs" id="keyword"
										name="keyword" placeholder="검색 키워드 입력">
								</div>
								<button class="btn btn-default" type="submit"
									onclick="return search();">검색</button>
								<button class="btn btn-default" type="button" onclick="searchAll();">전체 검색</button>	
								&nbsp;&nbsp;&nbsp;&nbsp;
								<p class="form-control-static">${requestScope.pageInfo.pagingStatus}</p>
							</form>
						</td>
					</tr>
					<c:forEach var="bean" items="${requestScope.lists}" varStatus="no">
						<tr>
							<td><c:out value="${no.count}"/></td>
							<td>${bean.student_id}</td>
							<td>${bean.student_name}</td>
							<td>${bean.att_date}</td>
							<td>${bean.att}</td>
							<td>${bean.reason}</td>
							<td>${bean.remark}</td>
							<td><a href="<%=noForm %>manAttUpdate&student_id=${bean.student_id}&a_no=${bean.a_no}">수정하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center">
			${requestScope.pageInfo.pagingHtml}
		</div>
	</div>
	<script type="text/javascript">
		/* 사용자가 선택한 항목을 그대로 보여 주기 */	
		$('#mode option').each(function(){
			if($(this).val() == '${requestScope.pageInfo.mode}'){
				$(this).attr('selected', 'selected') ;
			}
		});
		$('#keyword').val('${requestScope.pageInfo.keyword}');
	</script>
</body>
</html>










