<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="qnaMenu.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<script>
<% String sts ="";
if (session.getAttribute("user_id") == null) {
	sts = "disabled";
	}
%>
qnaid = "${qna.qna_id}";

</script>
<meta charset="UTF-8">
<style>
#content2{   
   background-color : white;   
   color : gray;}
 	#imgContentBox {width:600px;max-height:550px;overflow:auto;position:absolute;top:30%;left:30%;border-radius:5px;z-index:9999999;} 
 	#imgBoxTitleBar {border-bottom:1px solid #777;border-radius:5px 5px 0 0;background-color:#ddd;width:100%;padding:10px;text-align:right;font-size:20px;font-weight:bolder;} 
 	#imgBoxImg {width:100%;border-radius: 0 0 5px 5px;} 
 	#closeX {padding:5px 20px;border-radius:5px;border:1px solid #777;background-color:red;color:#fff;} 
 	#closeX:hover {background-color:#777;cursor:pointer;} 
 	.form-control:disabled, .form-control[readonly] {
    background-color: #fff;
    opacity: 1;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    margin-top: 20%;
    margin-bottion: 20%;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
    text-align: center; 
}
#myModal .modal-content #report_reason {
    width: 100%; /* 입력창이 모달 내에서 꽉 차게 하기 */
    box-sizing: border-box; /* 내용에 padding과 border 포함 */
    margin-bottom: 10px; /* 입력창과 버튼 사이의 간격 조절 */
}

#myModal .modal-content button[type="submit"] {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}


.close {
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    position: absolute;
    top: 0;
    right: 10px;
    
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
#footer{float: right;} 
#idtest{background-color:#e9ecef;}
	span{width:100px; height: input=vh; text-align: center; justify-content: center;}
	#content{background-color: #e9ecef;}
	#footer{float: right;}
	#content2{	
	background-color : white;	
	color : gray;
}
button {
    text-decoration: none;
    background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
    padding: 5px 13px;
    float: right;
    margin-left: -13px;
}
@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom: 100px;}
}
 .container-fluid{margin-bottom: 100px;}
</style> 
</head>
<body>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" id="closeModalBtn">&times;</span>
        <h2>신고하기</h2>
        <form id="reportForm" action="insertQNAReport.do" method="post">
        	<input type="hidden" class="form-control innm" name="qna_num" value="${qna.qna_num}" readonly>
        	<input type="hidden" class="form-control innm" name="qna_title" value="${qna.qna_title}" readonly>
        	<input type="hidden" class="form-control innm" name="qna_id" value="${qna.qna_id}" readonly> 
        	<input type="hidden" class="form-control innm" name="qna_date" value="${qna.qna_date}" readonly>
        	<input type="hidden" class="form-control innm" name="qna_content" value="${qna.qna_content}" readonly>  
            <textarea name="report_reason" id="report_reason" placeholder="신고 내용을 입력하세요."></textarea>
            <button type="submit" >신고 제출</button>
        </form>
    </div>
</div>
<div class="container-fluid">
  <form name="fm" method="post">
  <input type="hidden" name="qna_num" value="${qna.qna_num}">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control innm" name="qna_title" value="${qna.qna_title}" style="background-color: white;" readonly>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="qna_id" value="${qna.qna_id}" id="idtest" readonly>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control innm" rows="10"  name="qna_content" style="background-color: white; resize:none; " readonly>${qna.qna_content}</textarea>      
    </div>  
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">파일</span>
      </div>
      
      
   		<c:if test="${qna.qna_filename ne NULL}">
   			<span style="cursor:pointer;" onclick="downloadFile('${qna.qna_filename}')">[파일다운]</span>
   			<a>${qna.qna_filename}</a>
   			<script>
	   			function downloadFile(qna_filename){
	   		        location.href = "download.do?filename="+qna_filename;
	   			}
			</script>
   		</c:if>
   		
   		
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">등록일</span>
      </div>
      <input type="text" class="form-control innm" name="qna_date" value="${qna.qna_date}" readonly>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">조회수</span>
      </div>
      <input type="text" class="form-control innm" name="qna_cnt" value="${qna.qna_cnt}" readonly >      
    </div>
   
      <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">답글</span>
       
      </div>
      <textarea class="form-control innm" rows="5" style="background-color: white; resize:none;" readonly>${qna.qna_reply}</textarea>
    </div>
    <div class="input-group mb-3" style="margin-bottom: 2rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">답글작성일</span>
      </div>
      <input type="text" class="form-control innm" name="qna_replydate" value="${qna.qna_replydate}" readonly >      
    </div>
          
   
    
    <!-- 모달 버튼 -->
<button type="button"  id="openModalBtn" style="float:left; margin-left:0px;">신고하기</button>
   
    <div id="footer">
<!--     	<button type="button" class="btn btn-primary" onclick=>신고하기</button> -->
		<c:if test="${user_id == qna.qna_id }">
	  	<button type="button"  onclick="QNAupdate('${user_id}')" style="margin-left: 2px;">글수정</button>
	  	</c:if>
	  	<button type="button"  onclick="QNAinsert('${user_id}')" style="margin-left: 2px;">글쓰기</button>
	  	<c:if test="${user_id == qna.qna_id }">
	  	<button type="button"  onclick="QNAdelete('${user_id}')" style="margin-left: 2px;">글삭제</button>
	  	</c:if>
	  	<button id="QNAListget" type="button" style="margin-left: 2px;">글목록</button>
	</div>
  </form>  
</div>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var modal = document.getElementById('myModal');
    var openBtn = document.getElementById('openModalBtn');
    var closeBtn = document.getElementById('closeModalBtn');
    
    
    

    // 모달 열기 버튼에 이벤트 리스너 추가
    openBtn.addEventListener('click', function () {
        modal.style.display = 'block';
    });

    // 모달 닫기 버튼에 이벤트 리스너 추가
    closeBtn.addEventListener('click', function () {
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // 폼 전송 후 모달 닫기
    var reportForm = document.getElementById('reportForm');
    reportForm.addEventListener('submit', function () {
        modal.style.display = 'none';
    });
});
</script>
<%@ include file="/footer.jsp"%>
</body>
</html>
