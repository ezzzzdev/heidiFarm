<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminQnaList.css">
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="boxx">
  	<h3 class="qnah">Q&A</h3>
	  	<c:choose>
			<c:when test="${not empty qnaList }">
			  		<table class="tbl">
			  			<tr><th class="qna">제목</th><th class="qna">작성자</th><th class="qna day">등록일</th><th class="qna">상세보기</th></tr>
			  	<c:forEach var="qnaList" items="${qnaList }" end="10">
			  			<tr><td class="qna">${fn:substring(qnaList.qna_title, 0, 5)}${fn:substring('...', 0, fn:length(qnaList.qna_title) - 5)} </td><td class="qna">${qnaList.qna_id }</td><td class="qna day">${qnaList.qna_date }</td>
			  			<td class="qna"><button type="button" class="selbtn" onclick="location.href='adminQnaListInfo.do?qna_num=${qnaList.qna_num}'">상세</button></td></tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>Q&A가 없습니다</p>
	  			<table>
			  		<tr><th class="qna">제목</th><th class="qna">작성자</th></tr>
			  	</table>
	  		</c:otherwise>
		</c:choose>
		<button type="button" class="admina" onclick="location.href=''">글등록</button>
<!-- 		<span class="adiv"><a class="admina" href="/adminInsertInfo.do">글등록</a></span> -->
  </div>
</body>
</html>