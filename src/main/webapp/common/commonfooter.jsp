<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath2 = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
	.upperfooter{
		background-color: #eaf1f1;
		margin-top : 30px;
		height: 300px;
	}
	.topfooter{
		height: 100px;
	}
	.kostable{
		margin: auto;
	}
	.footerkosmo{
		font-style: italic;
	}
	.f_kr_kos{
		font-size: large;
	}
	.f_eng_kos{
		font-size: 11px;
	}
	#impnum{
		font-weight: bolder;
	}
</style>
</head>
<body>
	<div class="upperfooter">
		<div class="topfooter"></div>
		<div class="infofoot">
			<table class="kostable">
				<tr>
					<td rowspan="3" class="logo"> <img
					src="<%=contextPath2%>/images/cosmologo-removebg-preview.png"
					width="200px"></td>
<!-- 					<td rowspan="3"> -->
<!-- 						<b class="footerkosmo">COSMO</b><br> -->
<!-- 						<b class="f_kr_kos">한국소프트웨어인재개발원</b><br> -->
<!-- 						<b class="f_eng_kos">Korea Software ManPower Organization</b> -->
<!-- 					</td> -->
					<td>&nbsp; (주) 한국소프트웨어아이엔씨 </td>
					<td>&nbsp; (153-759) 서울시 금천구 가산동 426-5 월드메르디앙 2차 310호 </td>
				</tr>
				<tr>
					
					<td>&nbsp; 사업자등록번호 : 123-45-7890</td>
					<td>&nbsp; 직업정보제공사업신공확인증 신고번호 : <b id="impnum">J123456789</b></td>
					<td>&nbsp; TEL : 02-123-4567 </td>
				</tr>
				<tr>
					<td>&nbsp; FAX : 02-123-4567 </td>
					<td>&nbsp; E-mail: cosmo@cosmo.com </td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>