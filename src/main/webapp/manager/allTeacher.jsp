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
function search(){
	if($('#mode').val() == 'all'){
		alert('검색 항목을 선택해 주세요.') ;
		return false ;
	}
}

function searchAll(){
	location.href='<%=noForm%>manTeaList';
	
	}
</script>
</head>
<body>
	<br>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2 class="panel-title">현재 학원 강사 명단입니다.</h2>
			</div>
			<div class="panel-body">
				학원 강사 명단을 조회합니다.
				
			</div>


			<table id="tclass" class="table table-hover">
				<thead>
					<tr>
						<th align="center">아이디</th>
						<th align="center">이름</th>
						<th align="center">주소</th>
						<th align="center">성별</th>
						<th align="center">생일</th>
						<th align="center">강의실</th>
					</tr>
				</thead>
				<tbody>
				<tr>
						<td colspan="10" align="center">
							<form class="form-inline" action="<%=yesForm%>" method="get">
								<input type="hidden" name="command" value="manTeaList">
								<input type="hidden" name="pageNumber"
									value="${requestScope.pageInfo.pageNumber}"> 
								<input type="hidden" name="pageSize"
									value="${requestScope.pageInfo.pageSize}">
								<div class="form-group">
									<select class="form-control btn-xs" name="mode" id="mode">
										<option value="all">-- 검색할 항목을 선택하세요.
										<option value="teacher_id">강사아이디
										<option value="teacher_name">강사 이름
										<option value="lecture_room">강의실
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
				<c:forEach var="bean" items="${requestScope.lists}">
					<tr>
						<td>${bean.teacher_id}</td>
						<td>${bean.teacher_name}</td>
						<td>${bean.teacher_address}</td>
						<td>${bean.teacher_gender}</td>
						<td>${bean.teacher_birth}</td>
						<td>${bean.lecture_room}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<table>
					<tr>
						<c:forEach var="i" begin="1" end="${requestScope.totalPage}">
							<td class="pagenavi">
								<a href="<%=noForm%>manTeaList&pagenum=${i}">&nbsp;&nbsp;${i}&nbsp;&nbsp;</a>
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
<footer>
	<%@ include file="./../common/commonfooter.jsp"%>
</footer>
</html>
