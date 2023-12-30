<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="adminMenu.jsp" %>

<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminNoticeList.css">
<title>관리자 공지사항</title>
</head>
<body>
	<div class="boxx">
  	<h3 class="noticeh">공지사항</h3>
	  	<c:choose>
			<c:when test="${not empty noticeList }">
			  		<table class="tbl">
			  			<tr><th class="notice num">번호</th><th class="notice">제목</th><th class="notice">날짜</th><th class="notice">상세보기</th>
<!-- 			  			<th class="notice">삭제</th> -->
			  			</tr>
			  	<c:forEach var="noticeList" items="${noticeList }" end="4">
			  			<tr><td class="notice num">${noticeList.notice_num }</td><td class="notice">${noticeList.notice_title }</td><td class="notice">${noticeList.notice_date }</td>
			  			<td class="notice"><button type="button" class="selbtn" onclick="location.href='adminNoticeInfo.do?notice_num=${noticeList.notice_num}'">상세</button></td>
<%-- 			  			<td class="notice"><button type="button" class="delbtn" onclick="location.href='adminDeleteNotice.do?notice_num=${noticeList.notice_num}'">삭제</button></td> --%>
			  			</tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>공지사항이 없습니다</p>
	  			<table>
			  		<tr><th class="notice">제목</th><th class="notice">작성자</th></tr>
			  	</table>
	  		</c:otherwise>
		</c:choose>
		<button type="button" class="admina" onclick="location.href='/adminInsertInfo.do'">글등록</button>
  </div>
</body>
</html>