<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	
	/* ----------텝메뉴 css-----------  */
	.tab_title{
		display: flex;
		margin:0;
		padding:0;
	}
	.panel-body{
		padding:0; 
	}
	.tab_title li{
		list-style-type: none;
		width: 25%; 
		height:50px;
		line-height:50px;
		border-right:1px solid #e8e8e8;
		margin:0;
		padding:0;
		text-align:center;
	}
	.tab_title li:last-child{
		border-right:none;
	}
	.tab_title li:hover{
		background-color:#e8e8e8;
	}
 	.tab_cont tbody{ 
   		display: none; 
 	} 
 	.tab_cont tbody.on { 
 		display: block;  
 	}   
	li.on{
	 		background-color:#e8e8e8;
	}
	.red{
		color: red;
	}
	.none{
		background-color:#e8e8e8;
	}
	/* -------------------------------  */
	
	</style>
	<script type="text/javascript">
	$(document).ready(function() {
		
		  /* ----------텝메뉴 제이쿼리--------  */
		  $(".tab_title li").click(function() {
		    var idx = $(this).index();
		    $(".tab_title li").removeClass("on");
		    $(".tab_title li").eq(idx).addClass("on");
		    
		    $(".tab_cont > tbody").hide();
		    
		    
// 		  var check = ($('.color-2 tr td:nth-child(3)').text().split('-'));
// 		  var admin =" admin";
// // 		  var x = new Boolean(((check[1]) == admin))
// // 		  console.log(check[4]);
// // 		  console.log(admin);
// 		  for(var i=0;i<check.length-1;i++){
// 			  var x = new Boolean(((check[i]) == admin));    
// 			  if(x == true){
// 		  			console.log("true인 i번째 :  " + i);  // true or false
// 				  $(".color-2 tr:nth-child("+ (i+1) +")").addClass('none');
		  			
// 			  }
// 		  }
		    
		    
		    
		    
		    $(".tab_cont > tbody").eq(idx).show();
		    
		    
		    
		    
		    
		  })
		  /* -----------------------------  */
		
		  
		  
// 		  var check = ($('.color-2 tr td:nth-child(3)').text().split('-'));
// 		  var admin =" admin";
// // 		  var x = new Boolean(((check[1]) == admin))
// // 		  console.log(check[4]);
// // 		  console.log(admin);
// 		  for(var i=0;i<check.length-1;i++){
// 			  var x = new Boolean(((check[i]) == admin));    
// 			  if(x == true){
// 		  			console.log("true인 i번째 :  " + i);  // true or false
// 				  $(".color-2 tr:nth-child("+ (i+1) +")").addClass('none');
		  			
// 			  }
// 		  }  
		  
		  
		  
		});
	</script>
</head>
<body>
	<br/>
	<div class="container">
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h2 class="panel-title" align="center">게시물 </h2>
			</div>
			<div class="panel-body">
				<ul class="tab_title">
					<li class="on">10강의실</li>
					<li>11강의실</li>
					<li>12강의실</li>
					<li>전체강의실</li>
				</ul>				
			</div>
			<table id="infotable" class="table table-hover tab_cont">
			<!-- 공통 사용 부분 -->
			    <thead>
			      <tr>
			        <th>글번호</th>
			        <th>글제목</th>
			        <th>작성자</th>
			        <th>글 내용</th>
			        <th>작성일</th>
			        <th>강의실</th>
			        <th>상세 보기</th>
			        <th>수정</th>
			        <th>삭제</th>
			      </tr>
			    </thead>
						
							    
<!-- 			    <tbody class="tab_cont"> -->
			    <!------------------------10강의실-------------------------------->
			    
			   <tbody class="on color-2" style="display: table-row-group;">
			    <c:forEach var="bean" items="${requestScope.lists}" varStatus="one" >
			      <c:if test="${bean.lecture_room == '10강의실'}">
			      <tr>
<%-- 			        <td>${bean.b_no}</td> --%>
					<td><c:out value="${one.count}"/></td>
			        <td>${bean.title}</td>
			        <td>${bean.writer}<span style="display:none;">-</span></td>
			        <td>${bean.b_content}</td>
			        <td>${bean.b_date}</td>
			        <td>${bean.lecture_room}</td>
			        <!----------------------------->
			        <td>
			        	<a href="<%=noForm%>boDetail&b_no=${bean.b_no}">상세보기</a>
			        </td>
			        
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        </td>
			        
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        </td>
			        <!----------------------------->
			      </tr>
			      </c:if>  
			     </c:forEach>
			    </tbody>
			    <!------------------------11강의실-------------------------------->
			    <tbody class="color-2">
			    <c:forEach var="bean" items="${requestScope.lists}" varStatus="two">
			      <c:if test="${bean.lecture_room == '11강의실'}">
			      <tr>
<%-- 			        <td>${bean.b_no}</td> --%>
					<td><c:out value="${two.count}"/></td>
			        <td>${bean.title}</td>
			        <td>${bean.writer}<span style="display:none;">-</span></td>
			        <td>${bean.b_content}</td>
			        <td>${bean.b_date}</td>
			        <td>${bean.lecture_room}</td>
			        <td>
			        	<a href="<%=noForm%>boDetail&b_no=${bean.b_no}">상세보기</a>
			        </td>
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        </td>
			        
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        </td>
			      </tr>
			      </c:if>  
			     </c:forEach>
			     </tbody class="color-2">
			    <!------------------------12강의실-------------------------------->
			    <tbody>
			    <c:forEach var="bean" items="${requestScope.lists}" varStatus="three">
			      <c:if test="${bean.lecture_room == '12강의실'}">
			      <tr>
<%-- 			        <td>${bean.b_no}</td> --%>
					<td><c:out value="${three.count}"/></td>
			        <td>${bean.title}</td>
			        <td>${bean.writer}<span style="display:none;">-</span></td>
			        <td>${bean.b_content}</td>
			        <td>${bean.b_date}</td>
			        <td>${bean.lecture_room}</td>
			        <td>
			        	<a href="<%=noForm%>boDetail&b_no=${bean.b_no}">상세보기</a>
			        </td>
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        </td>
			        
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        </td>
			      </tr>
			      </c:if>  
			     </c:forEach>
			     </tbody>
			  <!------------------------전체강의실-------------------------------->
			  	<tbody class="color-2">
			    <c:forEach var="bean" items="${requestScope.lists}" varStatus="cnt">
			      <tr>
<%-- 			        <td>${bean.b_no}</td> --%>
			        <td><c:out value="${cnt.count}"/></td>
			        <td>${bean.title}</td>
			        <td>${bean.writer}<span style="display:none;">-</span></td>
			        <td>${bean.b_content}</td>
			        <td>${bean.b_date}</td>
			        <td>${bean.lecture_room}</td>
			        <td>
			        	<a href="<%=noForm%>boDetail&b_no=${bean.b_no}">상세보기</a>
			        </td>
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boUpdate&b_no=${bean.b_no}">수정</a> <!-- 띄어쓰기 절~대 안됨  -->
			        	</c:if>
			        </td>
			        
			        <td>
			        	<c:if test="${sessionScope.loginfostu.student_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfotea.teacher_id == bean.writer}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        	<c:if test="${sessionScope.loginfomem.status == 4}">
			        		<a href="<%=noForm%>boDelete&b_no=${bean.b_no}">삭제</a>
			        	</c:if>
			        </td>
			      </tr>
			     </c:forEach>
			     </tbody>
			     
			     
			     
<!-- 			    </tbody> -->
			    
			    
			    
			  </table>
		</div>
	</div>
</body>
</html>










