<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.green.teamproject_groupware.dto.ApprovalDto" %>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--      hiredate 날짜 포맷 형식 변경 -->
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <script src="https://kit.fontawesome.com/82c57657fe.js" crossorigin="anonymous"></script>
      <script src="resources/js/jquery.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript"></script>

<title>Insert title here</title>
</head>
<style>
.header{
height : 70px;
border-bottom: 1px solid #eee;
background-color : 363945;
display : flex;

}

.info{
height : 100px;

}


.item a {
font-weight : bold;
font-size : 25px;
margin-top: 20px; 
 text-decoration: none; /* 밑줄 제거 */
color : black;
}
.item ul li a{
margin-top : 20px;}
.item ul {
/* margin-top : 10px; */
height : 80px;
}
.item {
list-style: none;
}
.content{
width : 100%;

}

.myinfo{
background-color : ;
height : 200px;
margin-top : 30px;
display : flex;

}
#profile-image img{
width : 150px; 
height : 150px;
border-radius: 10px;
margin-left: 50px;
margin-right : 50px;
}

#profile-name{
font-size : 24px;
font-weight : bold;
margin-bottom : 30px;
display : inline-block;

} 
.profile-id span{
font-weight : bold;

}

.description {
margin-top : 30px;
border-top : 1px soild #eee;
height : 800px;
}
.profile-info{
border-bottom : 1px soild #eee;

}
#profile-table{
/* margin-top : 50px; */
margin-left : 30px;
padding : 20px;
}
#profile-table th,td{
width : 100px;
height : 40px;
}
#profile-table td{
padding : 10px;
margin-right : 20px;
}
.info span{
font-weight : bold;
font-size : 34px;
margin-top : 40px;
margin-left : 50px;
}
.info{
border-bottom : 1px solid #eee;
}
.app-list{
border-bottom : 1px solid #eee;
}
.app-header{
margin-top : 10px;
margin-left : 400px;
display : flex;
flex-direction: row;

}
.doc-todo{
font-weight : bold;
font-size : 24px;
color : #4682b4;
cursor : pointer;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;

}
.doc-ing{
font-weight : bold;
font-size : 24px;
color : #363945;
margin-left:15px;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;
cursor : pointer;
}
.doc-end{
font-weight : bold;
font-size : 24px;
color : #0D47A1;
margin-left:15px;
text-align : center;
border-radius : 10%;
width : 250px;
height : 200px;
border : 1px solid #eee;
cursor : pointer;
}
.app-list span{
font-weight : bold;
font-size : 34px;
margin-top : 40px;
margin-left : 50px;
}

.doc-todo:hover {
	background-color : #eee;
}
.doc-ing:hover {
	background-color : #eee;
}
.doc-end:hover {
	background-color : #eee;
}
.allList {
margin-top : 50px;
margin-left : 300px;
}
.allList table th{
background-color: #eee; 
}
.allList table{
text-align : center;
border-collapse: collapse;
}
.allList table tbody tr:hover{
background-color : #eee;
cursor: pointer;
}
/* 팝업 배경 스타일  */
.popup_bg{
position: absolute;
top:0;
left:0;
width:100%;
height:100%;
background: rgba(0,0,0,0.5);
display:none;
z-index: 1; /* z-index 값 설정 */
}    
/* 받는사람 찾기 기능 */
.popup_doc{
position : absolute;
left : calc(50%-100px);
top : calc(50% - 500px);
background : white;
display:none;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */
width : 955px;
height : 900px;
border : 1px solid #363945;
margin-top : 30px;
margin-left : 60px; 
display : none; 
 
} 
.popup_doc > #popup-doc-out{
font-size: 2rem; 
float: right; 
margin-right:5px;
cursor: pointer;
}
.document table{
    border-collapse: collapse;
width : 800px;
height : 800px;

}
.document tr,th{
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
.document table td{
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }



.document th {
      background-color: #eee;
    }    
.todo_list{
display:none;
}    
.reject_list{
display:none;
}
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

		
		  $("#popup-doc-out").on("click",function(){
		    	$(".popup_bg").css({"display":"none"});
		    	$(".popup_doc").css({ "display": "none" });
		    });  
		  
	$(".Alllist table tbody tr").on("click",function(){
		var doc_id = $(this).find(".doc_id").text();
		
// 		var todoList = ${todoList_json};
		
// 		for(var i =0;i<todoList.length;i++){
// 			if(doc_id==todoList[i].doc_id){
// 				var lasttr = $(".document table tr:last");
// 				var newtr = $("<tr>").html("<td colspan='6'><button id='reject' type='button'>반려</button><button id='approve' type='button'>승인</button></td>");
// 				lasttr.after(newtr);
// 			}
// 		}
		
		 $.ajax({
	         type: "POST",
	         url: "getDocById", 
	         data: { doc_id : doc_id },
	         headers: {
	             "Accept": "application/json"
	         },
	         success: function (response) {
	        	 var docDto = response;
	        	 var now = new Date(docDto.doc_date);
	        	 var year = now.getFullYear();
	        	 var month = String(now.getMonth() + 1).padStart(2, '0'); 
	        	 var day = String(now.getDate()).padStart(2, '0');
				var line1_img = docDto.doc_img+'.jpg';
				var line2_img = docDto.first_img+'.jpg';
				var line3_img = docDto.second_img+'.jpg';
				var line4_img = docDto.third_img+'.jpg';
	        	 
		$("#line1_name").text(docDto.doc_name);
		$("#line1_name").append("<input type='hidden' id='doc_empno_todo' value="+docDto.doc_empno+">")
		$("#line2_name").text(docDto.first_name);
		$("#line3_name").text(docDto.second_name);
		$("#line4_name").text(docDto.third_name);
		$("#doc_date").val(year+'-'+month+'-'+day);
		$("#doc_name").text(docDto.doc_name);
		$("#doc_dname").text(docDto.doc_dname);
		$("#doc_idd").text(docDto.doc_id);
		$("#doc_title").val(docDto.doc_title);
		$("#doc_content").val(docDto.doc_content);
		$("#doc_expire").text(docDto.doc_expire);
		$("#doc_confidential").text(docDto.doc_confidential);
	    $("#line1_img").html("<img src='./showStamp?fileName="+line1_img+"'style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>");  
	    $("#line2_img").html("<img src='./showStamp?fileName="+line2_img+"'style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>");  
	    $("#line3_img").html("<img src='./showStamp?fileName="+line3_img+"'style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>");  
	    $("#line4_img").html("<img src='./showStamp?fileName="+line4_img+"'style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>");  
	    
		$(".popup_doc").css("display","block");
		$(".popup_bg").css("display","block");
	    
	         }
		 });
		
		
		
	});	// end-of-결재문서 클릭시 출력
		
	// 결재 승인 처리
	$("#approve").on("click",function(){
		var doc_id = $("#doc_idd").text();
		var empno ='${dto.getEmpno()}';
		console.log(doc_id);
		console.log(empno);

		 $.ajax({
	         type: "GET",
	         url: "doc_approval", 
	         data: { empno : empno,
	        	 doc_id : doc_id },
	         headers: {
	             "Accept": "application/json"
	         },
	         success: function (data) {
	        	 if(data===1){
	        		 alert("승인 처리되었습니다.");
	        		 window.location.href='approval';
	        	 }
	         
	         }
		
		});
	});
	// 결재 반려 처리
	$("#reject").on("click",function(){
		var doc_id = $("#doc_idd").text();
		var empno ='${dto.getEmpno()}';
		console.log(doc_id);
		console.log(empno);

		 $.ajax({
	         type: "GET",
	         url: "doc_reject", 
	         data: { empno : empno,
	        	 doc_id : doc_id },
	         headers: {
	             "Accept": "application/json"
	         },
	         success: function (data) {
	        	 if(data===1){
	        		 alert("반려 처리되었습니다.");
	        		 window.location.href='approval';
	        	 }
	         
	         }
		
		});
	});
	
	
	$(".doc-todo").on("click",function(){
		$(".app-list span").text("결재할 문서 목록");
		$(".todo_list").css({"display":"block"});
		$(".doclist").css({"display":"none"});
		$(".reject_list").css({"display":"none"});
		
	});
	$(".doc-ing").on("click",function(){
		$(".app-list span").text("결재중인 문서 목록");
		$(".doclist").css({"display":"block"});
		$(".todo_list").css({"display":"none"});
		$(".reject_list").css({"display":"none"});
	});
	$(".doc-end").on("click",function(){
		$(".app-list span").text("반려된 문서 목록");
		$(".doclist").css({"display":"none"});
		$(".todo_list").css({"display":"none"});
		$(".reject_list").css({"display":"block"});
	});
	
	
		
 });
 
 
 </script>
<body>
 <jsp:include page="../nav2.jsp"/>
 
 <main>
 	<div class="header">
      	<ul class="nav nav-underline">
  <li class="item">
    <a class="people" aria-current="page" href="#" style="color:#FFFAFA;"><i class="bi bi-people-fill" style="color:#FFFAFA;"></i>내 사원정보</a>
  </li>
  <li class="item">
    <a class="company" href="#" style="color:#FFFAFA;"><i class="bi bi-list-ul" style="color:#FFFAFA;"></i>비밀번호 변경</a>
  </li>
</ul>      	
      </div>
      
      
      <div class="info">
      	<span>결재현황</span>
      </div>
      
        <div class="content">
        	
        	<div class="app-header">
        		<div class="doc-todo">
        			<span style="color:#0D47A1;">결재할 문서</span>
        			<p style="font-size:70px; font-weight:bold;">${todoList.size()}</p>
        		</div>
        		<div class="doc-ing">
        			<span style="color:363945">결재중 문서</span>
        			<p style="font-size:70px; font-weight:bold;">${ingList.size()}</p>
        		</div>
        		<div class="doc-end" style="color:#e53935;">
        			<span>반려된 문서</span>
        		<p style="font-size:70px; font-weight:bold;">${rejectList.size()}</p>
        		</div>
        	
        	
        	</div>
        
        	
        	<div class="app-list">
        		<span>전자결재함</span>
        	</div>
        	
        		<div class="AllList">
        		
<!--         		전체 문서 목록 -->
        			<div class="doclist">
        			<span style="font-size:20px;"><b>총 ${list.size()} 건</b></span>        		
        				<table>
        					<thead>
        					<tr>
        						<th>문서번호</th>
        						<th>기안자</th>
        						<th>기안일자</th>
        						<th width="300px">문서 제목</th>
        						<th>결재현황</th>	
        					</tr>
        					</thead>
        					<tbody>
        					<c:forEach items="${list}" var="list">
        					
        					<tr>
        						<td class="doc_id">${list.getDoc_id()}</td>
        						<td>${list.getDoc_name()}</td>
        						<td><fmt:formatDate value="${list.getDoc_date()}" pattern="yy/MM/dd" /></td>
        						<td>${list.getDoc_title()}</td>
        						<c:choose>
        							<c:when test="${list.getDoc_status() eq 0}">
        						<td>결재중</td>        							
        							</c:when>
        							<c:when test="${list.getDoc_status() eq 2}">
        						<td>반려</td>        							
        							</c:when>
        							<c:when test="${list.getDoc_status() eq 1}">
        						<td>결재완료</td>        							
        							</c:when>
        						</c:choose>
        					</tr>
        					</c:forEach>
        					</tbody>
        				</table>
        			</div>
        			
<!--         			결재해야할 문서 목록 -->
        			<div class="todo_list">
        			<span style="font-size:20px;"><b>총 ${todoList.size()} 건</b></span>        		
        				<table>
        					<thead>
        					<tr>
        						<th>문서번호</th>
        						<th>기안자</th>
        						<th>기안일자</th>
        						<th width="300px">문서 제목</th>
        						<th>결재현황</th>	
        					</tr>
        					</thead>
        					<tbody>
        					<c:forEach items="${todoList}" var="todoList">
        					
        					<tr>
        						<td class="doc_id">${todoList.getDoc_id()}</td>
        						<td>${todoList.getDoc_name()}</td>
        						<td><fmt:formatDate value="${todoList.getDoc_date()}" pattern="yy/MM/dd" /></td>
        						<td>${todoList.getDoc_title()}</td>
        						<c:choose>
        							<c:when test="${todoList.getDoc_status() eq 0}">
        						<td>결재중</td>        							
        							</c:when>
        							<c:when test="${todoList.getDoc_status() eq 2}">
        						<td>반려</td>        							
        							</c:when>
        							<c:when test="${todoList.getDoc_status() eq 1}">
        						<td>결재완료</td>        							
        							</c:when>
        						</c:choose>
        					</tr>
        					
        					</c:forEach>
        					</tbody>
        				</table>
        			</div>
<!--         			반려된 문서 목록 -->
        			<div class="reject_list">
        			<span style="font-size:20px;"><b>총 ${rejectList.size()} 건</b></span>        		
        				<table>
        					<thead>
        					<tr>
        						<th>문서번호</th>
        						<th>기안자</th>
        						<th>기안일자</th>
        						<th width="300px">문서 제목</th>
        						<th>결재현황</th>	
        					</tr>
        					</thead>
        					<tbody>
        					<c:forEach items="${rejectList}" var="rejectList">
        					
        					<tr>
        						<td class="doc_id">${rejectList.getDoc_id()}</td>
        						<td>${rejectList.getDoc_name()}</td>
        						<td><fmt:formatDate value="${rejectList.getDoc_date()}" pattern="yy/MM/dd" /></td>
        						<td>${rejectList.getDoc_title()}</td>
        						<c:choose>
        							<c:when test="${rejectList.getDoc_status() eq 0}">
        						<td>결재중</td>        							
        							</c:when>
        							<c:when test="${rejectList.getDoc_status() eq 2}">
        						<td>반려</td>        							
        							</c:when>
        							<c:when test="${rejectList.getDoc_status() eq 1}">
        						<td>결재완료</td>        							
        							</c:when>
        						</c:choose>
        					</tr>
        					</c:forEach>
        					</tbody>
        				</table>
        			
        			</div>
        			
        			
        			
        		</div>
        	
        	</div>
      
       <!--     팝업 배경 창 -->
	<div class="popup_bg"></div> 
	
	<div class="popup_doc">
		<i class="bi bi-x" id="popup-doc-out"></i>
        			<div class="document">
        				 <table style="border: 1px;">
        				 
            <tr style="height:100px; border:1px solid black; background-color: #eee;">
                <th colspan="4" style="text-align: center; font-weight: bold; font-size: 26px;">품의서</th>
                <td colspan="2">
                    <div style="display: flex; float:right;">
                        <span style="margin-right: 20px;">[결재라인]</span>
                          <div id="line1" style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                           <div id="line1_name"  style="border-bottom:1px solid black;">
                         		 </div>
                         		 <div id="line1_img">
                         		 	<img src="./showStamp?fileName=${dto.getProfileimage()}" style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>
                         		 </div>
                          </div> 
                           
                          <div id="line2" style="width:85px; height:90px; border: 1px solid black; background-color: white; cursor: pointer;">

                          		 <div id="line2_name" style="border-bottom:1px solid black;"> 
                          		 
                          		</div>
                          		<div id="line2_img">
                          		</div>
                          </div>
                            
                          <div id="line3" style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                         
                          		 <div id="line3_name" style="border-bottom:1px solid black;">
                          		</div>
                          		<div id="line3_img">
                          		</div>
                          </div>
                            
                          <div id="line4"style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                          
                          		 <div id="line4_name" style="border-bottom:1px solid black;">
                          		</div>
                          		<div id="line4_img">
                          		</div>
                          </div>  
                          
                    </div>

                </td>
            </tr>
            <tr style="height:30px;">
                <th>기안부서</th>
                <td>
                	<span id="doc_dname"></span>
                </td>
                <th>기안일</th>
                <td>
                	<input id="doc_date" type="text" readonly>
                </td>
                <th>문서번호</th>
                <td>
                <span id="doc_idd"></span>
                </td>
                
            </tr>
            <tr style="height:30px;">
                <th>기안자</th>
                <td>
                <span id="doc_name"></span>
                </td>
                <th>보존년한</th>
                <td>
                <span id="doc_expire"></span>
                </td>
                <th>비밀등급</th>
                <td>
                <span id="doc_confidential"></span>
                </td>
            </tr>
            <tr style="height:30px;border: 2px solid black;"></tr>
            <tr style="height:30px;">
                <th>제목</th>
                <td colspan="5">
                    <input id="doc_title" value="" type="text" size="95" readonly>
                </td>
            </tr>
            
            <tr>
            <td colspan="6">
                <textarea id="doc_content"style="margin-bottom:100px;" cols="113" rows="15" readonly>
                </textarea>
                </td>
            </tr>
            
            <tr>
            <td colspan='6'>
            <button id='reject' type='button'>반려</button>
            <button id='approve' type='button'>승인</button>
            </td>
            </tr>

           
        </table>
        			</div>
        			
        			
        		</div>
	
	
	
 </main>
</body>
</html>