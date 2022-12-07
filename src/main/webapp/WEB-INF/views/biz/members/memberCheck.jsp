<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
$("#memberCheck").on("click",function(){
	var param;
	param.mem_id = $("#mem_id").val();
	param.mem_pw = $("#mem_pw").val();
	
	$.ajax({
		type: "json",  
		url:  "/members/memberCheck", 
		method : 'POST', 
		data : param,
		success: function(data) {
				 alert("data : "+data);
		},
		error : function(error , status){
			console.log("error : "+error);
			console.log("status : "+status);
			
		}
	});
});
$("#home").on("click",function(){
	location.href = "/";
});
</script>

<div id="memberCheck">
	<input type="text" id="mem_id" name="mem_id">
	<input type="password" id="mem_pw" name="mem_pw">
	<div>
		<button id = "home">메인</button>
	</div>
</div>