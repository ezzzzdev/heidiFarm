<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="adminMenu.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<meta charset="UTF-8">
<style>
	.alldiv {
    width: 30%;
    margin: auto;
    margin-top: 60px;
    font-size: 20px;
    
}
.notiall {
    width: 100%;
    height: 25px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin: 5px 0 30px 0;
    padding-left: 10px;
}
.file {
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    text-align: left;
    padding: 5px;
    margin-bottom: 30px;
}
.backlistbtn, .modibtn{
	height: 40px;
	width: 60px;
	border: 1px solid #ccc;
	background-color:#3876bf;
	color: white;
	border-radius: 4px;
	font-size: 15px;
	margin-top: 30px;
}
</style>
</head>
<body>

<div class="alldiv">
  <form name="fm" action="adminUpdateNotice.do" method="post">
  <input type="hidden" class="notiall" name="notice_num" value="${notice.notice_num}">
    <div>
      <div>
        <span>제목</span>
      </div>
      <input type="text" class="notiall" name="notice_title" value="${notice.notice_title}" >      
    </div>
    <div>
      <div>
        <span>작성자</span>
      </div>
      <input type="text" class="notiall" name="notice_writer" value="${notice.notice_writer}">      
<%--       <input type="text" class="form-control innm" value="${board.writer}" readonly <%=sts %>>       --%>
    </div>
    <div>
      <div>
        <span>내용</span>
      </div>
      <textarea rows="10" id="comment" class="notiall textcla" name="notice_content" style="resize: none;" >${notice.notice_content}</textarea>      
    </div>  
    <div>
      <div>
        <span >파일</span>
      </div>
      <c:choose>
   		<c:when test="${notice.notice_filename ne NULL}">
   			<span style="cursor:pointer;" onclick="downloadFile('${notice.notice_filename}')">[파일다운]</span>
   			<script>
	   			function downloadFile(notice_filename){
	   				alert('다운로드테스트'+notice_filename);
	   		        location.href = "download.do?filename="+notice_filename;
	   			}
			</script>
   		</c:when>
   		<c:otherwise>
	  			<div><p class="file">파일 없음</p></div>
	  		</c:otherwise>
   	</c:choose>
   		
    </div>
    <div>
      <div>
        <span >등록일</span>
      </div>
      <input type="text" class="notiall" class="form-control innm" name="notice_date" value="${notice.notice_date}" readonly>      
    </div>
    <div>
      <div>
        <span>조회수</span>
      </div>
      <input type="text" class="notiall" class="form-control innm" name="notice_cnt" value="${notice.notice_cnt}" readonly >      
    </div>
	<button type="button" class="backlistbtn" onclick="location.href='adminNoticeList.do'">글목록</button> 
	<button type="submit" class="modibtn">글수정</button> 

  </form>  
</div>
</body>
</html>