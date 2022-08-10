<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	overflow: hidden;
}
.text-area{
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}
.typing-demo{
	width: 50ch;
	animation: typing steps(45), blink 0.5s step-end alternate;
	animation-duration:2s; 
	animation-iteration-count:1;
	animation-fill-mode:none;
	white-space: nowrap;
	overflow: hidden;
	border-right: 3px;
	font-family: monospace;
	font-size: 3em;
}
.hide{
	animation: blink-effect 1s step-end infinite;
}
@keyframes typing{
	from{
		width:0;
	}
} 
@keyframes blink{
	50%{
		border-color: transparent;
	}
}
@keyframes blink-effect{
	50% {
    opacity: 0;
  }
}
</style>
</head>
<body>
<div class="text-area">
	<div>
		<div class="typing-demo">저희 KOSMO 학점관리 시스템에 오신걸 환영합니다 <span class="hide">!!</span></div>
	</div>
</div>
</body>
</html>