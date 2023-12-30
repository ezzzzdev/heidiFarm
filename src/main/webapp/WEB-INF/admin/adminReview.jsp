<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReview.css">
<meta charset="UTF-8">
<title>리뷰목록</title>
</head>
<body>
<div class="boxx">
  	<h3 class="reviewh">리뷰</h3>
	  	<c:choose>
			<c:when test="${not empty reviewList }">
			  		<table class="tbl">
			  			<tr><th class="review num">제목</th><th class="review">작성자</th><th class="review">상세보기</th></tr>
			  	<c:forEach var="reviewList" items="${reviewList }" end="10">
			  			<tr><td class="review num">${fn:substring(reviewList.review_title, 0, 5)}</td><td class="review">${reviewList.review_id }</td>
			  			<td class="review"><button type="button" class="selbtn" onclick="location.href='/adminReviewList.do?review_num=${reviewList.review_num}'">상세</button></td>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>공지사항이 없습니다</p>
	  			<table>
			  		<tr><th class="review">제목</th><th class="review">작성자</th></tr>
			  	</table>
	  		</c:otherwise>
		</c:choose>
		<button type="button" class="admina" onclick="location.href=''">글등록</button>
<!-- 		<span class="adiv"><a class="admina" href="/adminInsertInfo.do">글등록</a></span> -->
  </div>
</body>
</html>