<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div id = "main">
	<div id="mainList">
		<h1 align="center">메인 페이지</h1>
		회원가입 하기 <button id = "memberJoin">회원가입</button><br>
		회원정보 보기 <button id = "memberList">회원 리스트</button>
	</div>
</div>
</body>
<script type="text/javascript">
$("#memberJoin").on("click",function(){
	$.ajax({
	type: "html",  
	url:  "/members/create.view", 
	method : 'POST',
	data: {}, 
	success:function(data) {
			$("#main").html(data);
			}
	});
});
</script>
</html>