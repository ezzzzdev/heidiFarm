//핸드폰 유효성검사 체크 
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
	$(function() {

		$('#idChk').on('click', function() {
			let user_id = $('input[name="user_id"]').val();			

			$.ajax({
				url : "idChk.do",
				type : "post",
				data : {
					user_id : user_id
				},
				cache : false,
				success : function(result) {
					if (!user_id) {
						$("#checkId").html('아이디를 입력해 주세요.');
						$("#checkId").css('color', 'red');
				    }else if (result == 1) {
						console.log('success');
						$("#checkId").html('사용할 수 없는 아이디입니다.');
						$("#checkId").attr('color', 'red');
					}else if (result == 0) {
						$("#checkId").html('사용 가능한 아이디입니다.');
						$("#checkId").attr('color', 'green');
					}
				},

				error : function() {
					alert('error');
				}
			});
		});
	});
 
 function checkSelectAll()  {
	  // 전체 체크박스
	  const checkboxes 
	    = document.querySelectorAll('input[name="chk2"]');
	  // 선택된 체크박스
	  const checked 
	    = document.querySelectorAll('input[name="chk2"]:checked');
	  // select all 체크박스
	  const selectAll 
	    = document.querySelector('input[name="selectall"]');
	  
	  if(checkboxes.length === checked.length)  {
	    selectAll.checked = true;
	  }else {
	    selectAll.checked = false;
	  }

	}


	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName("chk2");
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  });
	}

// 문자인증
	var timer;
	var isRunning = false;

	// 인증번호 발송하고 타이머 함수 실행	


	function sendAuthNum() {
		

		// 남은 시간
		var leftSec = 180, display = document.querySelector('#timer');
		// 이미 타이머가 작동중이면 중지
		if (isRunning) {
			 isRunning = false;
			
		} else {
			isRunning = true;
		}

		//    startTimer(leftSec, display);
		const user_phone = $('#user_phone').val();
		alert(user_phone + " 으로 인증 번호가 발송되었습니다.")

		var frm = document.idfindscreen;

		if (frm.user_phone.value == "") {
			alert("핸드폰번호를 정확하게 입력해주세요");
			return;
		}
		 $("#hidden").css("display", "block");

		startTimer(leftSec, display);
		$.ajax({
			url : '/check/sendSMS.do',
			type : 'get',
			data : {
				"user_phone" : user_phone
			},
			success : function(data) {
				const checkNum = data;

				$('#enterBtn').click(function() {
					const user_num = $('#user_num').val();

					if (checkNum === user_num) {
						 clearInterval(timer);
						alert('인증 성공하였습니다.');

					} else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
					}
				});

			}
		});

	}

	function startTimer(count, display) {
		display = document.querySelector('#timer');
		var minutes, seconds;
		timer = setInterval(function() {
			minutes = parseInt(count / 60, 10);
			seconds = parseInt(count % 60, 10);
			minutes = minutes < 10 ? "0" + minutes : minutes;
			seconds = seconds < 10 ? "0" + seconds : seconds;

			display.textContent = minutes + ":" + seconds;

			// 타이머 끝
			if (--count < 0) {
				 clearInterval(timer);
				alert("인증 시간이 초과되었습니다.");
				
				$("#hidden").css("display", "none");
				isRunning = false;
			}
		}, 1000);
	}
	
	$(document).ready(function(){
		$("#user_mailSel").on("change",function(){
			$("#user_mail02").val($("#user_mailSel").val());
		});
		
		$(".userMail").on("change",function(){
			$("#user_mail").val($("#user_mail01").val() +"@"+$("#user_mail02").val());
		});
		
		$("#user_mailSel").on("click",function(){
			$("#user_mail").val($("#user_mail01").val() +"@"+$("#user_mail02").val());
		});
	})