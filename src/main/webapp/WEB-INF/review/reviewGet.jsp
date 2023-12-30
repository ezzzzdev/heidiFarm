<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="../../menu.jsp" %>  
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<style>
 	#imgContentBox {width:600px;max-height:550px;overflow:auto;position:absolute;top:30%;left:30%;border-radius:5px;z-index:9999999;} 
 	#imgBoxTitleBar {border-bottom:1px solid #777;border-radius:5px 5px 0 0;background-color:#ddd;width:100%;padding:10px;text-align:right;font-size:20px;font-weight:bolder;} 
 	#imgBoxImg {width:100%;border-radius: 0 0 5px 5px;} 
 	#closeX {padding:5px 20px;border-radius:5px;border:1px solid #777;background-color:red;color:#fff;} 
 	#closeX:hover {background-color:#777;cursor:pointer;} 
 	.form-control:disabled, .form-control[readonly] {
    background-color: #fff;
    opacity: 1;
}
#writer{background-color:#e9ecef; width: 65%;}
#date{ width:15%;}
span{width:100px; height: input=vh; text-align: center; justify-content: center;}
h1{text-align: center;}
#footer{float: right;}
#text{width: 55%;}



</style></head>

<body>
   <h1>후기</h1>   
   <hr>
<div class="container-fluid">
  <form name="fm" method="post">
  <input type="hidden" name="review_num" value="${review.review_num}">
   <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control innm" name="review_title" value="${review.review_title}" style="background-color: white;" readonly>      
    </div>
    
    
    <div class="input-group mb-3" >
      <div class="input-group-prepend" >
        <span class="input-group-text">작성자</span>
      </div>
      <input id="writer" type="text"  name="review_writer" value="${review.review_writer}" readonly>      
<%--       <input type="text" class="form-control innm" value="${board.writer}" readonly <%=sts %>>       --%>
   
      <div class="input-group-prepend">
        <span class="input-group-text">등록일</span>
      </div>
      <input id="date"type="text"  name="review_date" value="${review.review_date}" readonly>      
    </div>
    <div class="input-group mb-3">
    
      <textarea class="form-control innm" rows="10" id="comment" name="review_content" style="background-color: white;" readonly>${review.review_content}</textarea>      
    </div>  
   
   
    
      <div class="input-group mb-3">
      <div class="input-group-prepend">
        <span class="input-group-text">답글</span>
      </div>
      <textarea class="form-control innm" rows="5" style="background-color: white;" readonly></textarea>      
    </div>
   
    <div id="footer">
	    <button id="reviewListget" type="button" class="btn btn-primary">글목록</button>
	</div>
  </form>  
</div>
</body>
</html>
