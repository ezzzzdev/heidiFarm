<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="qnaMenu.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<script>
password = "${qna.qna_password }";
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a>비밀번호 입력</a>
<div class="container-fluid">
    <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">비밀번호</span>
      </div>
      <input type="text" class="form-control" name="qna_password" id="qna_password" required>      
    </div>
<button class="btn btn-primary" onclick="pwgetQNA(${qna.qna_num})">입력</button>
</div>
<%@ include file="/footer.jsp"%>
</body>
</html>