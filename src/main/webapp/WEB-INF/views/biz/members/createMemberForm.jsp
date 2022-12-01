<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">		
$("#home").on("click" , function(){
	location.href = "/";
});

$("#createMemberSubmit").on("click", function(){

	let id		= $("#mId").val();
	let pw		= $("#mPw").val();
	let name	= $("#mName").val();
	let tel		= $("#mTel").val();
	
	var param		= {};
	param.mem_id	= id;
	param.mem_pw	= pw;
	param.mem_name	= name;
	param.mem_tel	= tel;
	
	$.ajax({
		type: "json",  
		url:  "/members/createMember.act", 
		method : 'POST',
		data: param, 
		success: function(data) {
				 alert("data : "+data);
				 }
	});
	

});
</script>

<div id = "SampleCreateMemberForm">
	<div class="container">
		<div class="form-group">
			<label for="mId">ID</label>
			<input type="text" id="mId" name="mId" required/><br>
			<label for="mPw">PW</label>
			<input type="text" id="mPw" name="mPw" required/><br>
			<label for="mName">이름</label>
			<input type="text" id="mName" name="mName" required/><br>
			전화번호<input type="text" id="mTel" name="mTel" placeholder="숫자만 입력해주세요" required/><br>
			<!-- <p>##파라미터값 id : ${member.id }</p>
			<p>##파라미터값 name : ${member.name }</p>
			 -->
		</div>
		<button id = "createMemberSubmit">등록</button>
		<button id = "home">메인</button>
	</div>
</div>
