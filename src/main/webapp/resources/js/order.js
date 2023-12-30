var chk = false;
$(document).ready(function(){
	
	var IMP = window.IMP;
	IMP.init('imp28373434');
	
	var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
	const kind = document.getElementsByClassName('resultPrice').length;
	var oif_id = new Date().getTime();
	   
    if(!isMobile) {
    	$("#pay_module").click(function () {
    		IMP.request_pay({
     			pg: 'html5_inicis.INIpayTest',
    			pay_method: 'card',
    			merchant_uid: oif_id,
    			name: '[하이디농장]'+kind+'건 주문',
    			amount: document.getElementById('totalPrice').innerText, //결제금액
    			buyer_email: $("#user_mail").val(),
    			buyer_name: $("#user_name").val(),
    			buyer_tel: $("#user_phone").val(),
    			buyer_addr: $("#oif_ordaddr2").val() + $("#oif_ordaddr3").val(),
    			buyer_postcode: $("#oif_ordaddr1").val(),
    			}, function (rsp) {
    				console.log(rsp);
    				if (rsp.success) {
    					var msg = '고유ID : '+ rsp.imp_uid;
    					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    					msg += '\n결제 금액 : ' + rsp.paid_amount;
    					msg += '\n카드 승인번호 : ' + rsp.apply_num;
    					
    					$("#oif_id").val(rsp.merchant_uid);
    					chk = true;
    					
    					document.orderAPI.action = "/orderIntoOIF.do";
						document.orderAPI.method= "post";
						document.orderAPI.submit();
    				} else {
    					var msg = '결제에 실패하였습니다.';
    					msg += '\n에러내용 : ' + rsp.error_msg;
	    				alert(msg);
    				}
    		});
    	});
        
    } else {
        
    	$("#pay_module").click(function () {
    		IMP.request_pay({
    			pg: 'A010002002',
    			pay_method: 'card',
    			merchant_uid: oif_id,
    			name: '[하이디농장]'+kind+'건 주문',
    			amount: document.getElementById('totalPrice').innerText,
    			buyer_email: $("#user_mail").val(),
    			buyer_name: $("#user_name").val(),
    			buyer_tel: $("#user_phone").val(),
    			buyer_addr: $("#oif_ordaddr2").val() + $("#oif_ordaddr3").val(),
    			buyer_postcode: $("#oif_ordaddr1").val(),
    			m_redirect_url: '/payments/complete',
    			}, function (rsp) {
    				console.log(rsp);
    		});
    	});
        
    }
	                      
	
	$("#cancel_module").click(function () {
		$.ajax({
			url : "/paycan",
			data : {"mid": $("#oifId").val()},
			method : "POST",
			success : function(val){
				console.log(val);
				if(val==1){
					alert("취소 완료");
				}
				else alert("취소 실패\n이미 취소되었거나 잘못된 정보입니다.");
			},
			error :  function(request, status){
				alert("취소가 실패하였습니다.");
			}
		});
	});
	
	$(".myOrder_module").click(function(){
		$.ajax({
			url : "/payamount",
			data : {"mid": $("#merchant_uid").val(), "status" : $(this).attr("data-val")},
			// 파라미터 : mid = 상점 주문번호, status = /paid
			method : "GET",
// 			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				if(val.msg!=null){
					$("#paylist").append(val.msg);
				}else{
					$("#paylist").append("고유ID: "+val.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+val.merchant_uid);
					$("#paylist").append("<br>주문상품: "+val.name);
					$("#paylist").append("<br>주문자: "+val.buyer_name);
					$("#paylist").append("<br>결제금액: "+val.amount);
				}
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
	$("#all_module").click(function(){
		$.ajax({
			url : "/paylist",
			method : "GET",
// 			contentType : 'application/json; charset=UTF-8',
			success : function(val){
				console.log(val);
				$("#paylist").empty();
				$.each(val, function(i, v){
					$("#paylist").append("고유ID: "+v.imp_uid);
					$("#paylist").append("<br>상점 거래ID: "+v.merchant_uid);
					if(v.cancel_amount != 0 ) $("#paylist").append("<br><span style=\"color:red;font-weight:bold;\">주문취소</span>");
					else if(v.failed_at != 0 ) $("#paylist").append("<br><span style=\"color:pink;font-weight:bold;\">결제오류</span>");
					else $("#paylist").append("<br><span style=\"color:blue;font-weight:bold;\">결제완료</span>");
					$("#paylist").append("<br>주문상품: "+v.name);
					$("#paylist").append("<br>주문자: "+v.buyer_name);
					$("#paylist").append("<br>결제금액: "+v.amount+"<hr><br>");
				});
				
			},
			error :  function(request, status){
				alert("목록 가져오기를 할 수 없습니다.");
			}
		});
	});
	
});

function orderList(){
	let fm = document.fm;
	fm.action ="/pay";
	fm.method="post";
	fm.submit();
}
