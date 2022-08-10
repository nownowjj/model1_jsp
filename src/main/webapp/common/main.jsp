<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- <link rel="stylesheet" href="./sakura.css"> -->
<!-- <script src="./sakurajs.js"></script> -->
<style type="text/css">

 *{margin: 0; padding: 0; box-sizing: border-box;}
 .container1{
 	position: sticky;
 	top: 0;
 	left: 0;
 	margin-top: -71px;
 	padding-top:50px;
 	margin-bottom: 15px;
 }
 .container2{
 	border:5px solid #e8e8e8;
 	border-top-left-radius:50px;
 	border-top-right-radius:50px;
 	position:relative;
 	z-index: 99;
 	background-color: #fff;
 	padding-top:150px;
 }
 .pink{
 	color: pink;
 }
 [data-scroll]{
 	opacity: 0;
 	will-change: transform , scale , opacity;
 	transform: translateY(6rem) scale(0.93);
 	transition: all 1s cubic-bezier(0.165,0.84,0.44,1);
 }
 [data-scroll='in']{
 	opacity: 1;
 	transform:translateY(0) scale(1);
 }
 [data-scroll='out']{
 	opacity: 0;
 }

</style>
<script src="https://unpkg.com/scroll-out/dist/scroll-out.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
    $('.container-fluid').sakura();
})


$(function(){
	  $('.bxslider').bxSlider({
		auto: true,
		speed: 500,
	    mode: 'fade',
	    captions: true,
	    slideWidth: 1000
	    
	  });
	});

</script>
</head>
<body>
<div class="container-fluid container1">
	
	<div class="text-area">
		<div>
			<div class="typing-demo">저희 <span class="pink">COSMO</span> 학점관리 시스템에 오신걸 환영합니다 <span class="last pink">!!</span></div>
		</div>
	</div>
		
	<div class="bxslider">
	  <div><img src="<%=contextPath%>/images/scadule_result1.jpg" title=""></div>
	  <div><img src="<%=contextPath%>/images/sco.jpg" title=""></div>
	  <div><img src="<%=contextPath%>/images/computer.jpg" title=""></div>
	</div>
	
</div>

<!-- 책 꺼내는 듯한 position -->
<div class="container2" data-scroll>

	<div class="cardContainer-box-text">짱구네 가족들 소개</div>
	
	<div class="cardContainer-box">
		<div class="cardContainer">
            <div class="card front min">발표 : 민유성</div>
            <div class="card back ">
            	<p class="back-top">기능 구현</p>
            	<p>출석 기능 구현</p>
            	<p>출석 등록</p>
            	<p>로그인 기능 구현</p>
            </div>
        </div>
        <div class="cardContainer">
            <div class="card front woo">조장 : 이현우</div>
            <div class="card back">
            	<p class="back-top">기능 구현</p>
            	<p>출석 기능 구현</p>
            	<p>출석 조회 </p>
            	<p>출석 페이지 페이징 </p>
            	<p>강사 목록 조회</p>
            </div>
        </div>
        <div class="cardContainer">
            <div class="card front ji">김지원</div>
            <div class="card back">
            	<p class="back-top">기능 구현</p>
            	<p>게시판 기능 구현</p>
            	<p>강의실별 게시판 구분</p>
            	<p>회원가입 기능 구현</p>
            	<p>전체적인 CSS</p>
            </div>
        </div>
	</div>
	<div class="cardContainer-box">
		<div class="cardContainer">
            <div class="card front oh">오민재</div>
            <div class="card back">
            	<p class="back-top">기능 구현</p>
            	<p>성적 기능 구현</p>
            	<p>성적 입력,성적 조회</p>
            	<p>회원 정보 수정</p>
            </div>
        </div>
        <div class="cardContainer">
            <div class="card front joo">조석환</div>
            <div class="card back">
            	<p class="back-top">기능 구현</p>
            	<p>성적 기능 구현</p>
            	<p>성적 수정</p>
            	<p>회원가입 기능 구현</p>
            </div>
        </div>
        <div class="cardContainer">
            <div class="card front han">김한나</div>
            <div class="card back">
           		<p class="back-top">기능 구현</p>
            	<p>게시판 기능 구현</p>
				<p>강의실별 게시판 구분</p>
				<p>내 학생 목록보기</p>
            	<p>PPT 제작</p>
            </div>
        </div>
	</div>
	
	<footer>
	<%@ include file="./../common/commonfooter.jsp"%>
	</footer>
	<script type="text/javascript">
		ScrollOut({});
	</script>
</div>
	
</body>

</html>
