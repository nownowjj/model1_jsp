
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int twelve = 12; // for BootStrap
%>
<!DOCTYPE html>
<%@
		taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@
    	taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@
    	taglib prefix="fn"
	uri="http://java.sun.com/jsp/jstl/functions"%>

<%--
	로그인 정보는 session 영역에 loginfo라는 이름으로 바인딩할 것
--%>

<%--
	로그인시 id가 admin이면 관리자로 해석
--%>

<%--
	whologin 변수는 로그인 상태를 저장하고 있다.
--%>

<%--
	whologin : 0 1 3 4
	0 -> 미로그인 
	1 -> 일반 사용자 
	3 -> 강사 
	4 -> 관리자
--%>

<c:set var="whologin" value="0" />

	<c:if test="${sessionScope.loginfomem.status == 4}">
		<c:set var="whologin" value="4" />
	</c:if>
	<%-- 선생님 여부에서 학생이라 입력되면 --%>
	<c:if test="${sessionScope.loginfostu.status == 1}">
		<c:set var="whologin" value="1" />
	</c:if>
	<!-- 강사  -->
	<c:if test="${sessionScope.loginfotea.status == 3}">
		<c:set var="whologin" value="3" />
	</c:if>


<%
String contextPath = request.getContextPath();
//서블릿 매핑 이름	
String mapping = "/cosmo";

//폼태그에서 사용할 공용 변수
String yesForm = contextPath + mapping;
//폼이 없는 <a> <img> 태그에서 사용할 공용 변수
String noForm = yesForm + "?command=";
//
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=contextPath%>/common/maincss.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<!--  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<style type="text/css">
/*  */
@font-face {	
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* 폼 head 폰트 */
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*  */
</style>
<link rel="stylesheet" href="<%=contextPath%>/common/sakura.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="<%=contextPath%>/common/sakurajs.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--  -->
 <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<style type="text/css">

/*  */
*{
	font-family: 'Cafe24SsurroundAir';
 	font-weight: bold; 
	color:black;
}
/*  */

#logo {
	padding-top: 10px;
	background-color: white;
	border: white;
}

.navbar-inverse11 {
	background-color: yellow;
	opacity: 0.7;
}

#mymessage {
	font-size: 13px;
	margin-top: 7px;
	margin-right: 20px;
}

#divalert {
	border-radius: 15px;
	width: 60%;
	margin: auto;
}

.err {
	font-size: 30px;
	color: red;
	font-weight: border;
}
.fluid{
	/*background: linear-gradient(45deg, lightCyan, beige, ivory  , #ece6cc);   1번 후보(베이지색 계열)*/
	/*background: linear-gradient(45deg, #dddddd, #c6c6c6 ,  #b0b0b0 ,#9a9a9a,#dddddd, #c6c6c6); 2번 후보(회색계열)  */
/* 	background: linear-gradient(45deg,#ffffff, #e9e9e9,#d3d3d3,#9a9a9a); */
	background: linear-gradient(45deg,#ffffff, #e9e9e9,#d3d3d3,#9a9a9a);
/* 	opacity: 0.8; */
	opacity: 1;
	position: absolute;
	z-index: 20;
	width: 100vw;
	padding-right: 25px;
/* 	border-top: 1px solid black; */
/* 	border-bottom: 1px solid black; */
}
.join_form{
	font-family: 'Cafe24SsurroundAir';
}

#logout{
	margin-right: 25px;
}
#home{
	background-color: white;
}
body{
	overflow-x:hidden; 
}
.common{
	position: fixed;
	z-index: 100;
	top: 0;
	left: 0;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('.navbar-inverse').addClass('navbar-inverse');
	});
</script>
</head>
<body>
<!-- 					src="https://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" -->
	<nav class="navbar navbar-default">
		<div class="container-fluid fluid common">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=noForm%>main" id="logo"> <img
					src="<%=contextPath%>/images/cosmologo.png"
					width="95px">
				</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="<%=noForm%>main">Home</a></li>
				<li><a href="#" class="dropdown-toggle"> <font
						color="black"> <c:if test="${whologin ==0}">
							미로그인
						</c:if> <c:if test="${whologin ==1}">
							${sessionScope.loginfostu.student_name}(${sessionScope.loginfostu.student_id})님
						</c:if> <c:if test="${whologin ==3}">
							${sessionScope.loginfotea.teacher_name}(${sessionScope.loginfotea.teacher_id})님
						</c:if> <c:if test="${whologin ==4}">
							관리자님
						</c:if>
					</font>
				</a></li>

				<!-- 회원 섹션 -->
				<%--
					로그인을 하지 않은 상태에서 유일하게 볼 수 있는 곳
					회원 란에서 회원가입과 로그인만 볼 수 있음.
				--%>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">회원<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<c:if test="${whologin == 0}">
							<li><a href="<%=noForm%>meJoin">회원가입</a></li>
							<li><a href="<%=noForm%>meLogin">로그인</a></li>
						</c:if>

						<c:if test="${whologin == 1}">
							<li><a href="<%=noForm%>meUpdate&id=${sessionScope.loginfostu.student_id}&status=1">
								회원정보 수정</a></li>
						</c:if>
						<c:if test="${whologin == 3}">
							<li>
								<a href="<%=noForm%>meUpdate&id=${sessionScope.loginfotea.teacher_id}&status=3">
								회원정보 수정</a></li>
						</c:if>
						<c:if test="${whologin != 0}">
							<li>
								<a href="<%=noForm%>meLogout">로그아웃</a></li>
						</c:if>
<%-- 						<li><c:if test="${(whologin)%2 != 0}"> --%>
<%-- 								<a href="<%=noForm%>">회원탈퇴</a> --%>  <!-- 회원탈퇴 x  -->
<%-- 							</c:if></li> --%>
						<c:if test="${whologin == 3}">
							<li><a
								href="<%=noForm%>teaStuList&id=${sessionScope.loginfotea.teacher_id}">내
									학생 목록보기</a></li>
						</c:if>
						<c:if test="${whologin == 4}">
							<li><a href="<%=noForm%>manStuList">학생 목록보기</a></li>
							<li><a href="<%=noForm%>manTeaList">강사 목록보기</a></li>
						</c:if>
					</ul></li>
					
			<!-- 게시물섹션 -->
			<c:if test="${whologin >= 1}">
				<!-- 셋다 -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">게시판<span class="caret"></span></a>
					<ul class="dropdown-menu">

						<c:if test="${whologin != 0}">
							<li><a href="<%=noForm%>boInsert">게시판 글쓰기</a></li>
							<li><a href="<%=noForm%>boAllList">게시판 목록보기</a></li>
						</c:if>

<%-- 						<li><a href="<%=noForm%>">공지 게시판</a></li> --%>
<%-- 						<li><a href="<%=noForm%>">질의응답 게시판</a></li> --%>
<%-- 						<li><a href="<%=noForm%>">이의신청 게시판</a></li> --%>
<%-- 						<li><a href="<%=noForm%>">과제제출 게시판</a></li> --%>
<%-- 						<li><a href="<%=noForm%>">상담 게시판</a></li> --%>
<%-- 						<li><c:if test="${whologin != 1}"> --%>
<%-- 								<a href="<%=noForm%>">강사 게시판</a> --%>
<%-- 							</c:if></li> --%>
					</ul></li>
			</c:if>

			<!-- 성적 섹션-->
			<c:if test="${whologin >= 1}">
            <li class="dropdown"><a class="dropdown-toggle"
               data-toggle="dropdown" href="#">성적<span class="caret"></span></a>
               <ul class="dropdown-menu">
<!--                   학생에게만 보여지는 부분 -->
                  <li><c:if test="${whologin == 1}">
                        <a href="<%=noForm%>grMeList&id=${sessionScope.loginfostu.student_id}">성적확인</a>
                     </c:if></li>
                  <%--선생님에게만 보여지는 부분(내 학생) --%>
                  <c:if test="${whologin == 3}">
                    	<li><a href="<%=noForm%>grInsert&id=${sessionScope.loginfotea.teacher_id}">성적입력</a></li>
                        <li><a href="<%=noForm%>grAllList">학생성적확인</a></li>
                   </c:if>
                  <%-- 관리자에게만 보여지는 부분 --%>
                  <li><c:if test="${whologin == 4}">
                        <a href="<%=noForm%>grAllList">성적확인</a>
                     </c:if></li>
               </ul></li>
         </c:if>
			<!-- 출석 섹션 -->
		<c:if test="${whologin >= 1}">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">출석<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><c:if test="${whologin == 1}">
									<a href="<%=noForm%>stuAtt&id=${sessionScope.loginfostu.student_id}">나의 출석 현황</a>
								</c:if></li>
								
							<c:if test="${whologin == 3}">
								<li><a
									href="<%=noForm%>teaAttCheck&id=${sessionScope.loginfotea.teacher_id}">출석
										체크 하기</a></li>
								<li><a href="<%=noForm%>teaAtt&id=${sessionScope.loginfotea.teacher_id}&pageNumber=1&pageSize=10">나의 반 출석 현황</a></li>
							</c:if>
							<c:if test="${whologin == 4}">
								<li><a href="<%=noForm%>manAtt">전체 학생 출석 현황</a></li>
							</c:if>
						</ul></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${whologin == 0}">
					<li><a href="<%=noForm%>meJoin"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					<li><a href="<%=noForm%>meLogin"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				</c:if>
				<c:if test="${(whologin)%2 == 1}">
					<c:if test="${whologin == 1}">
						<li><a href="<%=noForm%>meUpdate&id=${sessionScope.loginfostu.student_id}&status=1"><span
							class="glyphicon glyphicon-pencil"></span> 회원정보수정</a></li>
					</c:if>
					<c:if test="${whologin == 3}">
						<li><a href="<%=noForm%>meUpdate&id=${sessionScope.loginfotea.teacher_id}&status=3"><span
							class="glyphicon glyphicon-pencil"></span> 회원정보수정</a></li>
					</c:if>
					
					<li><a href="<%=noForm%>meLogout"><span
							class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
				</c:if>
				<c:if test="${whologin == 4}">
					<li><a href="<%=noForm%>meLogout"><span
							class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
		
	<%--message 변수는 사용자에게 어떠한 메세지를 전달하기 위하여 session 영역에 저장한다. --%>
	<%
	//session.setAttribute("message","감사합니다.");
	%>
	<c:if test="${not empty sessionScope.message}">
		<div id="divalert" class="alert alert-info alert-dismissible">
			<a href="#" id="mymessage" class="close" data-dismiss="alert"
				aria-label="close">닫기</a> <strong>${sessionScope.message}</strong>
		</div>
		<%
		session.removeAttribute("message");
		%>
	</c:if>

	<%--errmessage 변수는 사용자에게 어떠한 메세지를 전달하기 위하여 request영역에 저장한다. --%>
	<%
	//request.setAttribute("errmessage","Warning");
	%>
	<c:if test="${not empty requestScope.errmsg}">
		<div class="alert alert-danger alert-dismissible">
			<a href="#" id="myerrmessage" class="close" data-dismiss="alert"
				aria-label="close">닫기</a> <strong>${requestScope.errmsg}</strong>
		</div>
		<%
		request.removeAttribute("errmsg");
		%>
	</c:if>
	<!-- 
	<span class="err">Wrong</span>
	 -->
</body>
</html>