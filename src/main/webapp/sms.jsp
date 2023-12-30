<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자인증</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script>
$(function () {
	
	$("#send").on('click',function() {

		const user_phone = $('#user_phone').val();
		alert("user_phone값 : " + user_phone)

		$.ajax({
			url : '/check/sendSMS.do',
			type : 'post',
			data : {"user_phone" : user_phone},
			success : function(data) {
				const checkNum = data;
				alert('checkNum:' + checkNum);
				alert("user_phone2 : " + user_phone);
				

				$('#enterBtn').click(function() {
					const user_num = $('#user_num').val();

					if (checkNum === user_num) {
						alert('인증 성공하였습니다.');
					} else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
					}
				});

			}
		});

	});
});
</script>
</head>
<body>
	<div id="contents">
		받는사람 : <input type="text" id="user_phone" name="user_phone" />
		<!-- 인증번호 받을사람 휴대폰 번호 -->
		<button type="button" id="send">전송</button>
		<br>
		<!-- 문자보내는 전송버튼 -->

		인증번호 : <input type="text" id="user_num">
		<!-- 인증번호 입력창 -->
		<button type="button" id="enterBtn">확인</button>
		<!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
	</div>
</body>


</html>