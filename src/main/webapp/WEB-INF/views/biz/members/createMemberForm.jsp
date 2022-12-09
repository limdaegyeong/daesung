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
	
	if(""==id || ""==pw || ""==name || ""==tel){
		alert("정보를 모두 입력해주세요");
	}else{
		if($("#mPw").val().length < 4){
			alert("비밀번호를 4자리 이상 입력해주세요.");
		}else{
			if($("#idCheck").val() == "Y"){
/* 				$.ajax({
					type: "json",  
					url:  "/members/createMember.act", 
					method : 'POST',
					data: param, 
					success: function(data) {
						alert("data : "+data);
							 alert("회원가입이 완료되었습니다. ID : "+data);
							 location.href = "/";
							 }
				});	 */
				ajaxAction("POST","/members/createMember.act",param,function(data){
					 alert("회원가입이 완료되었습니다. ID : "+data);
					 location.href = "/";
				});
			}else{
				alert("ID 중복확인을 하지 않으셨습니다.");
			}	
		}
	}
	
});

$("#idCheck").on("click",function(){
	if(""==$("#mId").val()){
		alert("ID를 입력해주세요.");
	}else{
/* 		$.ajax({
			url : "/members/idCheck",
			type : "POST",
			dataType : "JSON",
			data : {"mem_id" : $("#mId").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 ID입니다.");
				}else if(data == 0){
					$("#idCheck").attr("value","Y");
					var setId = confirm("사용 가능한 ID입니다. 이 ID를 사용하시겠습니까?");
					if(setId){
						$("#mId").attr("readonly","true");
					}
				}
			}
		
		}); */
		ajaxAction("POST","/members/idCheck",{"mem_id" : $("#mId").val()},function(data){
			if(data == 1){
				alert("중복된 ID입니다.");
			}else if(data == 0){
				$("#idCheck").attr("value","Y");
				var setId = confirm("사용 가능한 ID입니다. 이 ID를 사용하시겠습니까?");
				if(setId){
					$("#mId").attr("readonly","true");
				}
			}
		});
	}
})
</script>

<div id = "SampleCreateMemberForm">
	<div class="container">
		<div class="form-group">
			<label for="mId">ID</label>
			<input type="text" id="mId" name="mId" required/>
			<button id="idCheck" value="N">중복확인</button><br>
			<label for="mPw">PW</label>
			<input type="password" id="mPw" name="mPw" required/><br>
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
