<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="noticeMenu.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 	#content1{	
	background-color : white;	
	color : gray;
}

#footer{float: right;}
button{
 text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
   padding : 5px 13px; float: right; 
   margin-left:3.5px;}
#idtest{background-color:#e9ecef;}
	span{width:100px; height: input=vh; text-align: center; justify-content: center;}
	#content{background-color: #e9ecef;}
	#footer{float: right;}
	#content1{	
	background-color : white;	
	color : gray;
}
@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom: 60px;}
}
.container-fluid{margin-bottom: 60px;}
</style>

</head>
<body>
   
<div class="container-fluid">
  <form name="fm" action="adminNoticeInfo.do" method="post">
  <input type="hidden" name="notice_num" value="${notice.notice_num}">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
<!--     <div class="input-group mb-3" style="margin-bottom: 0.01rem !important;"> -->
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control innm" name="notice_title" value="${notice.notice_title}" readonly >      
    </div>
    
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend" style="flex:1;" >
        <span class="input-group-text">작성자</span>
      <input type="text" class="form-control innm" name="notice_writer" value="${notice.notice_writer}" id="idtest" readonly>     
      </div>
   		
    
   	
      <div class="input-group-prepend" style="flex:0.5;">
        <span class="input-group-text" >등록일</span>
      <input type="text" class="form-control innm" name="notice_date" value="${notice.notice_date}" readonly>      
      </div>
   
    
   
      <div class="input-group-prepend" style="flex:0.5;">
        <span class="input-group-text">조회수</span>
      <input type="text" class="form-control innm" name="notice_cnt" value="${notice.notice_cnt}" readonly >      
      </div>
    </div>
    
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
<!--       <div class="input-group-prepend"> -->
<!--         <span class="input-group-text">내용</span> -->
<!--       </div> -->
      
       <textarea class="form-control innm" rows="10" id="comment" name="notice_content" style="resize: none; background-color: white;" readonly>${notice.notice_content}</textarea>
      
    </div>  
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      
      
   			<script>
	   			function downloadFile(notice_filename){
	   				alert('다운로드테스트'+notice_filename);
	   		        location.href = "download.do?filename="+notice_filename;
	   			}
			</script>
      
   		<c:if test="${notice.notice_filename ne NULL}">
    <div class="input-group mb-3">
    <div class="input-group mb-3">
     
      <div class="input-group-prepend">
        <span class="input-group-text">첨부파일</span>
       </div>
   			<input type="text" value="${notice.notice_filename} [다운로드]" class="form-control innm" 
   			style="cursor:pointer;" onclick="downloadFile('${notice.notice_filename}')" readonly>
   			
   		
			</div>
			</div>
			
    </c:if>
   			
    <c:if test="${notice.notice_filename eq NULL}">
    <div class="input-group mb-3">
    	<div class="input-group mb-3">
    		<div class="input-group-prepend">
       			<span class="input-group-text">첨부파일</span>
     		</div>
     		<input type="text" class="form-control innm" value="첨부된 파일이 없습니다." style="background-color: white;" readonly>      
    	</div>
    	</div>
    </c:if>
   		
   		
   		
    </div>
    <div id="footer">
    <c:if test="${user_id == 'farmadmin'}"> <!-- marine부분은 관리자 부분. farmadmin으로 수정해야함. -->
	  	<button type="submit"  >글수정</button>
	  	<button id="conWrite" type="button" >글쓰기</button>
	  	<button id="conDel" type="button"  >글삭제</button>
	  	</c:if>
	<button id="conList" type="button" >글목록</button>
	</div>
  </form>  
</div>
<%@ include file="/footer.jsp"%>
</body>
</html>
