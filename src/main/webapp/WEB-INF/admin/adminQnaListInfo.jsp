<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReviewList.css">
<meta charset="UTF-8">
<title>관리자 qna 상세보기</title>
</head>
	<div class="alldiv">
		<h3 class="header">qna</h3>
		<div class="container-fluid">
			<form action="updateQNAReply.do" method="POST">
				<input type="hidden" name="qna_num" value="${qna.qna_num}" readonly>
				
				<div class="all">
					<div class="spandiv">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control innm" name="qna_title" value="${qna.qna_title}" readonly>
				</div>

				<div class="all">
					<div class="spandiv">
						<span class="input-group-text">작성자</span>
					</div>
					
					<input id="id" type="text" class="form-control" name="qna_id" value="${qna.qna_id}" readonly>
					<div class="input-group-prepend">
						<span class="input-group-text">등록일</span>
					</div>
					
					<input id="date" type="text" class="form-control" name="qna_date" value="${qna.qna_date}" readonly>
				</div>
				
				<div class="all">
				<span class="input-group-text">질문</span>
					<textarea class="form-control textarea" name="qna_content" readonly>${qna.qna_content}</textarea>
				</div>
				
				<c:if test="${qna.qna_filename ne NULL}">
					<div>
						<div>
							<span class="input-group-text">첨부파일</span>
							<div>
								<input type="text" class="form-control" value="${qna.qna_filename}" onclick="downloadFile('${qna.qna_filename}')" readonly>
							</div>
						</div>
					</div>
				</c:if>

				<script>
					function downloadFile(qna_filename) {
						alert('다운로드테스트' + qna_filename);
						location.href = "download.do?filename="
								+ qna_filename;
					}
				</script>
				<c:if test="${qna.qna_filename eq NULL}">
					<div>
						<div>
							<div>
								<span class="input-group-text">첨부파일</span>
							</div>
							<input type="text" value="첨부된 파일이 없습니다.">
						</div>
					</div>
				</c:if>
				<br>
				<div class="all">
				<div class="input-group-prepend">
						<span class="input-group-text">답변 등록일</span>
				</div>				
					<input id="date" type="text" class="form-control" value="${qna.qna_replydate}" readonly>
				<span class="input-group-text">답변</span>
					<textarea class="form-control textarea" name="qna_reply">${qna.qna_reply}</textarea>
				</div>
				
				<div id="footer">
<%-- 					<c:if test="${user_id == qna.qna_id || user_id == 'farmadmin'}">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           --%>
<%-- 						<button type="button" id="qnareply" onclick="location.href='updateQNAReply.do?qna_reply=${qna.qna_reply}&qna_num=${qna.qna_num}'">답변 입력</button> --%>
						<button type="submit" id="qnareply" >답변 입력</button>
<%-- 						</c:if> --%>
					<button type="button" class="delbtn" onclick="location.href='admindeleteQNA.do?qna_num=${qna.qna_num}'">글 삭제</button>
					<button type="button" id="ReviewListget" onclick="location.href='/adminQnaList.do'">글목록</button>
				</div>
		</form>
	</div>
</div>
</body>
</html>