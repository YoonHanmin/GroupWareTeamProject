<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.document-type{
width: 200px;
height : 200px;
border : 1px solid #363945;
margin-top : 30px;
margin-left : 30px;
}
.document-form{
display : flex;
flex-direction: row;

}
#type-select{
height : 30px;
text-align : center;

background-color : #363945;
color : #FFFAFA
}
#type1,#type2,#type3,#type4{
border : 1px solid #eee;
text-align : center;
cursor: pointer;
height : 30px;
}

#type1:hover{
background-color : #eee;
}
#type2:hover{
background-color : #eee;
}
#type3:hover{
background-color : #eee;
}
#type4:hover{
background-color : #eee;
}
.document{
    width : 945px;
height : 800px;
border : 1px solid #363945;

margin-top : 30px;
margin-left : 60px;
display : none;
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
.popup-search{
position : absolute;
left : calc(50% - 200px);
top : calc(50% - 300px);
width : 400px;
height : 150px;
background : white;
display:none;
border-radius: 8px;
 z-index: 2; /* z-index 값 설정 (팝업은 배경 팝업보다 위에 있어야 함) */
}

.popup-search > #popup-search-out{
font-size: 2rem; 
float: right; 
margin-right:5px;
cursor: pointer;
}    
.add-search{
margin-left : 100px;
 margin-top : 10px;
 width : 233px;
 height : 30px;
 background-color : #eee;
 border-radius : 5px;
}
.add-search > form > input{
border : none;
/* background : rgba(0,0,0,0.5); */
color : black;
padding-left : 5px;
background-color : #eee;
margin-left : 10px;
margin-top : 6px;
width : 200px;
height : 20px;
}

.add-search > form > span{
font-weight : bold;
cursor: pointer;

}
/*  사원 클릭시 받는사람에 추가되는 요소 */
 .added-element{ 
 border : 1px solid #aed581; 
 border-radius: 6px; 
 color : black; 
 background-color: #aed581; 
 margin-top : 10px; 
 font-weight : bold; 
 height:30px ; 
 width: 100px; 
 
 text-decoration: none; 
font-weight:bold; 
 color:black; 
 }
.added-element {
      margin-left: 10px;
    }
</style>
 <script>
 $(document).ready(function () {
		var profile = "${dto.getProfileimage()}";
		console.log("프로필사진명은 ==>"+profile);
		$("#profile-image").html("<img src='./display?fileName="+encodeURI(profile)+"'>");

		
	$("#type1").on("click",function(){
		$(".document").css("display","block");
		
	});	
		
		
		
	var linename = "";	
// 	  사원검색 스크립트 
 $('#line2').on('click', function() {
    	// 받는사람 검색창 초기화
    	linename = 'line2';
    	console.log(linename);
        	$(".popup_bg").css({"display":"block"});
        	$(".popup-search").css({ "display": "block" });
    });

    $("#popup-search-out").on("click",function(){
    	$(".popup_bg").css({"display":"none"});
    	$(".popup-search").css({ "display": "none" });
    });  
    
 $('#line3').on('click', function() {
    	// 받는사람 검색창 초기화
    	linename = 'line3';
    	console.log(linename);
        	$(".popup_bg").css({"display":"block"});
        	$(".popup-search").css({ "display": "block" });
    });
 $('#line4').on('click', function() {
    	// 받는사람 검색창 초기화
    	linename = 'line4';
    	console.log(linename);
        	$(".popup_bg").css({"display":"block"});
        	$(".popup-search").css({ "display": "block" });
    });

    $("#popup-search-out").on("click",function(){
    	$(".popup_bg").css({"display":"none"});
    	$(".popup-search").css({ "display": "none" });
    });  
   
    
//     엔터키 입력시 사원검색 버튼 클릭 효과
    $('.add-search').find("input[id='add-id']").keypress(function (e) {
        if (e.which === 13) { // 13은 엔터 키의 keyCode입니다.
            e.preventDefault(); // 엔터 키의 기본 동작을 막습니다.
            $('#add-search-btn').click(); // 버튼 클릭과 동일한 동작을 수행합니다.
        }
    });
    
//     검색 클릭시 submit
    $('#msg-search-btn').on("click",function(){
    	$('#search-box').submit();
    });
    
$('#add-search-btn').on('click',function(){
	var add_id = $('.add-search').find("input[id='add-id']").val();
	
	 $.ajax({
         type: "POST",
         url: "searchName", // 실제 컨트롤러 매핑 경로로 변경
         data: { name : add_id },
         headers: {
             "Accept": "application/json"
         },
         success: function (data) {
//         	 var profileimage = data.profileimage;
        	 console.log(data.name);
        	 
	 var imageHtml = "<img src='./display?fileName=" + data.profileimage + "' style='width: 80px; height: 80px; border-radius: 10%; margin-left: 10px; margin-top: 5px; flex-shrink: 0; object-fit: cover;'>";
             // 서버로부터 받은 JSON 데이터 사용
             console.log("Received data:", data);
			$(".search-img").html(imageHtml);
			$("#search-name").text("이름 :    "+data.name+"    "+data.position);
			$("#search-dname").text("소속부서 :    "+data.dname);
			$("#search-email").text("이메일 :    "+ data.email);
			
			
 var addedElements = []; // 초기화를 위한 배열			
$('.search-info').on('click',function(){
	$(".popup_bg").css({"display":"none"});
	console.log("클릭후 이름 ==>"+linename);
	
	// 새로 클릭시 이전 검색내용 초기화
// 	addedElements.forEach(function (element) {
//         element.remove();
//     });
		
	var addedElement = $("<div>").text(data.name+data.position).css({"border-bottom":"1px solid black"}).append("<input type='hidden' name='"+linename+"' value='"+data.empno+"'>").hide(); // 처음에는 숨겨둡니다.
	$(".popup-search").css({ "display": "none" });
		
	
	$("#"+linename).html(addedElement);
	addedElement.show("slow");
	
	addedElements.push(addedElement);
		
});
		
 }

	 }); //ene of ajax
}); // end of add-search-btn click 
 

         
      $("#approval_btn").on("click",function(){
    	  var doc_empno = ${dto.getEmpno()};
    	  var doc_name= '${dto.getName()}';
    	  var doc_dname= '${dto.getDname()}';
    	  var doc_date = $("#doc_date").val();
    	  var doc_expire = $("#doc_expire").val();
    	  var doc_confidential = $("#doc_confidential").val();
    	  var first_empno = $("#line2").find("input[name='line2']").val();
    	  var second_empno =$("#line3").find("input[name='line3']").val();
    	  var third_empno = $("#line4").find("input[name='line4']").val();
    	  var doc_title = $("#doc_title").val();
    	  var doc_content = $("#doc_content").val();
    	  
    	  $.ajax({
    	         type: "POST",
    	         url: "docWrite", // 실제 컨트롤러 매핑 경로로 변경
    	         data: JSON.stringify({ doc_empno : doc_empno,
    	        	 doc_name : doc_name,
    	        	 doc_dname : doc_dname,
    	        	 doc_date : doc_date,
    	        	 doc_expire : doc_expire,
    	        	 doc_confidential : doc_confidential,
    	        	 first_empno : first_empno,
    	        	 second_empno : second_empno,
    	        	 third_empno : third_empno,
    	        	 doc_title : doc_title,
    	        	 doc_content : doc_content
    	         }),
    	         contentType: "application/json",
    	         success: function (data) {
    	  			if(data=='1'){
    	  				alert("기안 작성 완료!");
    	  			
    	  				window.location.href = "approval";
    	  			}
    	         }
    	  }); //end of ajax

      });   
         
         
         
 }); // eno of ready
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
      	<span>전자결재 작성하기</span>
      </div>
      
        <div class="content">
        <div class="document-menu">
        </div>
        	<div class="document-form">
        	<div class="document-type">
				<div id="type-select">
					결재양식 선택
				</div>        	
        			<div id="type1">
        				품의서
        			</div>
					<div id="type2">        			
        				지출결의서
        			</div>
        			<div id="type3">
        				기안서
        			</div>
						<div id="type4">
        				출장신청서
						</div>        			
        		
        	</div>
        	<div class="document">
        			 <table style="border: 1px;">
            <tr style="height:100px; border:1px solid black; background-color: #eee;">
                <th colspan="4" style="text-align: center; font-weight: bold; font-size: 26px;">품의서</th>
                <td colspan="2">
                    <div style="display: flex; float:right;">
                        <span style="margin-right: 20px;">[결재라인]</span>
                          <div id="line1" style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                          
                         		 <div  style="border-bottom:1px solid black;">${dto.getName()}
                         		 </div>
                         		 <div>
                         		 	<img src="./showStamp?fileName=${dto.getProfileimage()}" style='width: 60px; height: 60px; margin-left: 10px;  flex-shrink: 0; object-fit: cover;'>
                         		 </div>
                          </div> 
                           
                          <div id="line2" style="width:85px; height:90px; border: 1px solid black; background-color: white; cursor: pointer;">
                          <i class="fa-solid fa-magnifying-glass-plus"></i>
                          		 <div style="border-bottom:1px solid black;"> 
                          		</div>
                          </div>
                            
                          <div id="line3" style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                           <i class="fa-solid fa-magnifying-glass-plus"></i>
                          		 <div style="border-bottom:1px solid black;">
                          		</div>
                          </div>
                            
                          <div id="line4"style="width:85px; height:90px; border: 1px solid black; background-color: white;cursor: pointer;">
                           <i class="fa-solid fa-magnifying-glass-plus"></i>
                          		 <div style="border-bottom:1px solid black;">
                          		</div>
                          </div>  
                          
                    </div>

                </td>
            </tr>
            <tr style="height:30px;">
                <th>기안부서</th>
                <td>${dto.getDname()}</td>
                <th>기안일</th>
                <td>
                	<input id="doc_date" type="date">
                </td>
                <th>문서번호</th>
                <td>111111</td>
                
            </tr>
            <tr style="height:30px;">
                <th>기안자</th>
                <td>${dto.getName()}</td>
                <th>보존년한</th>
                <td>
                <select id="doc_expire">
                	<option>1년</option>
                	<option>2년</option>
                	<option>3년</option>
                	<option>영구</option>
                </select>
                </td>
                <th>비밀등급</th>
                <td>
                 <select id="doc_confidential">
                	<option>1급</option>
                	<option>2급</option>
                	<option>3급</option>
                	<option>공개</option>
                </select>
                </td>
            </tr>
            <tr style="height:30px;border: 2px solid black;"></tr>
            <tr style="height:30px;">
                <th>제목</th>
                <td colspan="5">
                    <input id="doc_title" type="text" size="95">
                </td>
            </tr>
            
            <tr>
            <td colspan="6">
                <textarea id="doc_content"style="margin-bottom:100px;" cols="113" rows="15">
                </textarea>
                </td>
            </tr>
            
            <tr>
            	<td colspan="3">
            		<button type="button">돌아가기</button>
            	</td>
            	<td colspan="3">
            		<button id="approval_btn" type="button">기안 작성</button>
            	</td>
            </tr>
        </table>
        	</div>
        	</div>
        	
        	
        	
        	</div>
        	
        <!--  	받는사람 검색 팝업 -->
 	<div class="popup-search">
 	<i class="bi bi-x" id="popup-search-out"></i>
 			<div class="add-search">	
      			<form>
      				<input id="add-id" type="text">
      				<span id="add-search-btn"><i class="bi bi-search fas"></i></span>
      			</form>
      		</div>
      		
      		<div class="search-list">
      			
      			
      		</div>	
      				
  			<div class="search-info" style="width:400px; height:100px; border: 1px solid #ccc; padding: 6px; display: flex; cursor: pointer;">
      			<div class="search-img">
   				
      			</div>
   				 <div style="flex-grow: 0;margin-left : 20px;">
      				<h6 style="margin: 0;color:black;"><b id="search-name"></b></h6>
      					<p id="search-dname" style="margin: 0;width:300px; white-space: nowrap; overflow: hidden; font-weight: bold; color:black;"></p>
      					<p id="search-email" style="margin: 0;width:300px; white-space: nowrap; overflow: hidden; font-weight: bold; color:black;"></p>
     					
    					</div>
  				</div>
      				
 	</div>
      <!--     팝업 배경 창 -->
	<div class="popup_bg"></div> 
 </main>
</body>
</html>