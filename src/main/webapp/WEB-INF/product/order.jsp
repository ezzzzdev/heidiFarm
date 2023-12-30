<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
img {
   width: 200px;
}
table, th, td{
   border: 1px solid black;
}
table{
   border-collapse: collapse;
}
</style>
<script>

$(document).ready(function(){
	totalPrice();
});

function totalPrice(){
	const ni = document.getElementsByClassName('selectAmount');
	if(ni.length != 0){
		var allPrice = 0;
		for(var i=0; i<ni.length; i++){
			allPrice += Number(document.getElementsByName('resultPrice')[i].innerText);
		}
		document.getElementById('totalPrice').innerText = allPrice;
	}
}

function execDaumPostcode(i) {
   console.log(i);
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementsByClassName("extraAddress")[i].value = extraAddr;
            
            } else {
                document.getElementsByClassName("extraAddress")[i].value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementsByClassName('postcode')[i].value = data.zonecode;
            document.getElementsByClassName("address")[i].value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementsByClassName("detailAddress")[i].focus();
        }
    }).open();
}
</script>





<%@ include file="../../header.jsp" %>
</head>
<body>
   <%@ include file="../../menu.jsp" %>
   <h1>제품주문</h1>
   <table>
      <c:choose>
         <c:when test="${!empty myCartList}">
            <c:forEach items="${myCartList}" var="cartProduct">
               <tr>
                  <td>
                     <a href="/productDetail.do?pro_num=${cartProduct.pro_num}">
                        <img src="/resources/img/productPicture/${cartProduct.pro_file}" title="${cartProduct.pro_name} 상품 사진">
                        <span>상품명 :${cartProduct.pro_name}</span>
                     </a>
                  </td>
                  <td>
                     <div name="selectAmount" class="selectAmount">${cartProduct.cart_amount}</div>개
                  </td>
                  <td>
                     <span name="resultPrice" class="resultPrice">${cartProduct.cart_totalp}</span>원
                  </td>
                  <td>50,000원 이상<br>배송비 무료</td>
               </tr>
            </c:forEach>
         </c:when>
         <c:otherwise>
            <p>상품이 존재하지 않습니다</p>
         </c:otherwise>
      </c:choose>
   </table>

   <div>
   총가격 : <span id="totalPrice"></span>원      
   </div>
   <hr>
   <form>
      <h3>주문자정보</h3>
      <table>
         <tr>
            <th>이름</th><td><input type="text" name="orderName"></td>
            <th>이메일</th><td><input type="text" name="orderEmail"></td>
         </tr>
         <tr>
            <th>전화번호</th><td><input type="text" name="orderTel"></td>
            <th>핸드폰번호</th><td><input type="text" name="orderPhone"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td colspan="3">
               <input type="text" class="postcode" placeholder="우편번호">
               <input type="button" onclick="execDaumPostcode(0)" value="우편번호 찾기"><br>
               <input type="text" class="address" placeholder="주소"><br>
               <input type="text" class="detailAddress" placeholder="상세주소">
               <input type="text" class="extraAddress" placeholder="참고항목">
            </td>
         </tr>
      </table>
      <hr>
      <h3>배송자정보</h3>
      <table>
         <tr>
            <th>이름</th><td><input type="text" name="rcvName"></td>
            <th>이메일</th><td><input type="text" name="rcvEmail"></td>
         </tr>
         <tr>
            <th>전화번호</th><td><input type="text" name="rcvTel"></td>
            <th>핸드폰번호</th><td><input type="text" name="rcvPhone"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td colspan="3">
               <input type="text" class="postcode" placeholder="우편번호">
               <input type="button" onclick="execDaumPostcode(1)" value="우편번호 찾기"><br>
               <input type="text" class="address" placeholder="주소"><br>
               <input type="text" class="detailAddress" placeholder="상세주소">
               <input type="text" class="extraAddress" placeholder="참고항목">
            </td>
         </tr>
         <tr>
            <th>메모</th><td colspan="3"><textarea></textarea></td>
         </tr>
      </table>
      <hr>
      <h3>결제방식</h3>
      <table>
         <tr>
            <td>
               <label><input type="radio" value="무통장입금" name="orderType">무통장입금</label>
               <label><input type="radio" value="신용카드" name="orderType">신용카드</label>
               <label><input type="radio" value="실시간계좌이체" name="orderType">실시간계좌이체</label>
               <label><input type="radio" value="휴대폰결제" name="orderType">휴대폰결제</label>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>