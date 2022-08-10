<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.HoneyDew{background-color: HoneyDew ;}
		.mystyle{background-color: LightYellow; color:red;}
		
		.select {
		width : 600px;
	    padding: 15px 0px;
	    margin-top: -10px;
/* 	    padding-left: 20px; */
/* 	    margin-left: 210px; */
	}
	.select input[type=radio]{
	    display: none;
	}
	.select input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 24px;
	    width: 90px;
	    border: 1px solid #333;
	    line-height: 24px;
	    text-align: center;
	    font-weight:bold;
	    font-size:13px;
	}
	.select input[type=radio]+label{
	    background-color: #fff;
	    color: #333;
	}
	.select input[type=radio]:checked+label{
	    background-color: #333;
	    color: #fff;
	}
	#ra{
		margin-left: 30px;
	}  
	.container{
		justify-content: center;
	    display: flex;
	    align-items: center;
	    /* padding-left: 15px; */
	    /* margin-right: auto; */
	    /* margin-left: auto; */
	    /* margin-top: 150px; */
	    /* border: 1px solid; */
	    height: 60vh;
	    margin: 0 auto;
	}
	
	.col-sm-offset-3 {
        margin-left: 0; 
}		
	*{word-break : nowrap;}

.panel-body{
	padding-left: 0;
}
#submit,#reset{
	transition:0.5s;
}
#submit:hover{
	background-color:#333;
	color:white;
	font-weight: bold;
	transform:translateY(-3px);
}
#reset:hover{
	background-color:#333;
	color:white;
	font-weight: bold;
	transform:translateY(-3px);
}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();
			
			$('#id, #password').on('focus', function(){
				$(this).addClass('HoneyDew');
			});
			$('#id, #password').on('blur', function(){
				$(this).removeClass('HoneyDew');
			});
			
// 			$('#submit').hover(
// 				function(){
// 					$(this).animate({marginLeft:'+2px', marginTop:'+2px'}, 100);
// 					//$(this).addClass('btn-primary');
// 					$(this).addClass('mystyle');
// 					$(this).removeClass('btn-default');					
// 				},
// 				function(){
// 					$(this).animate({marginLeft:'-2px', marginTop:'-2px'}, 100);
// 					//$(this).removeClass('btn-primary');
// 					$(this).removeClass('mystyle');
// 					$(this).addClass('btn-default');
// 				}
				
// 			);
		});	
	</script>
</head>
<body>
	<div class="container">
		
		<div class="col-sm-offset-3 col-sm-6">
			<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title" align="center">
					로그인하기
				</h3>
			</div>
			<div class="panel-body" class="col-sm-8">
				  <form class="form-horizontal" action="<%=yesForm%>" method="post">
				  <input type="hidden" name="command" value="meLogin">					  
				    <div class="form-group">
				      <label class="control-label col-sm-3" for="id"> 아이디 : </label>
				      <div class="col-sm-9">
				        <input type="text" class="form-control" id="id" 
				        	placeholder="Enter id" name="id"
				        	data-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하로 입력해 주세요."
				        	data-placement="left" >
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-3" for="">비밀 번호 :</label>
				      <div class="col-sm-9">  <!--  -->         
				        <input type="password" class="form-control" id="password" 
				        	placeholder="비번를 넣어주세요" name="password">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="control-label col-sm-3" for="">로그인 구분</label>
				      <div class="col-sm-9">        <!--  -->   
							<div class="select">
						    	 <input type="radio" id="ra1" name="ra" value="student" checked="checked" ><label for="ra1" class="radio_but">학생</label>
						     	<input type="radio" id="ra2" name="ra" value="teacher" ><label for="ra2" class="radio_but">강사</label>
						     	<input type="radio" id="ra3" name="ra" value="admin"  ><label for="ra3" class="radio_but">관리자</label>
							</div>
				      </div>
				    </div>
				    <div class="form-group">        
				      <div class="col-sm-offset-4 col-sm-2 test">
				        <button id="submit" type="submit" class="btn btn-default">로그인</button>
				      </div>
<!-- 				      <div class="col-sm-offset-1 col-sm-2"> -->
				      <div class="col-sm-offset-3 test">
				        <button id="reset" type="reset" class="btn btn-default">취소</button>
				      </div>
				    </div>
				  </form>
				</div>
			</div>
		</div>
	</div>
</body>
<footer class="forfoot">
<%@ include file="./../common/commonfooter.jsp" %>
</footer>
	    
</html>