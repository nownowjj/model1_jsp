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
</style>
<script type="text/javascript">
function search(){
	if($('#mode').val() == 'all'){
		alert('검색 항목을 선택해 주세요.') ;
		return false ;
	}
}

function searchAll(){
	location.href='<%=noForm%>teaAtt&id=${sessionScope.loginfotea.teacher_id}&pageNumber=1&pageSize=10';
	
	}
</script>
</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">담당하신 반 학생들의 출결상황입니다.</h2>
			</div>
			<div class="panel-body">이름을 클릭하면 수정할 수 있습니다.</div>
			<table id="tclass" class="table table-hover">
				<thead>
					<tr>
						<th>순서</th>
						<th>학생 ID</th>
						<th>학생 이름</th>
						<th>출석 일자</th>
						<th>출석</th>
						<th>사유</th>
						<th>비고</th>
						<th>수정하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="10" align="center">
							<form class="form-inline" action="<%=yesForm%>" method="get">
								<input type="hidden" name="command" value="teaAtt">
								<input type="hidden" name="pageNumber"
									value="${requestScope.pageInfo.pageNumber}"> 
								<input type="hidden" name="pageSize"
									value="${requestScope.pageInfo.pageSize}">
								<input type="hidden" name="id" value="${requestScope.teacher_id}" >

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
							<td><a
								href="<%=noForm%>teaAttUpdate&id=${bean.student_id}&a_no=${bean.a_no}">수정하기</a></td>
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
<!-- <footer> -->
<%-- 	<%@ include file="./../common/commonfooter.jsp"%> --%>
<!-- </footer> -->
</html>
