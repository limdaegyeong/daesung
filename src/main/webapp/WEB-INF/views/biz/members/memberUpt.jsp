<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Enumeration" %>
<%
	/*
	Enumeration<String> attrNames = request.getAttributeNames();                

	while(attrNames.hasMoreElements()){
	      String attrName = attrNames.nextElement();
	      Object attrValue = application.getAttribute(attrName);
	      System.out.println(attrName + " : " + attrValue);
	}*/

%>
<style>
	table, th, td {
		border: 1px solid #bcbcbc;
		border-collapse: collapse;
	}
	.jb-th-1 {
		padding: 40px 60px;
	}
</style>

<script src="/resource/js/cmm/com.js"></script>
<script>
$("#home").on("click",function(){
	location.href = "/";
});
$(".editMemInfo").on("click",function(){

	var confirmCheck = confirm(this.textContent+" 님의 회원 정보를 수정하시겠습니까?")
	if(confirmCheck){
		var mem_id = this.textContent;
/* 		$.ajax({
			type: "JSON",  
			url:  "/members/editMemForm", 
			method : 'POST',
			data: {"mem_id" : mem_id}, 
			success:function(data) {
				console.log("###data : "+data.mem_id);
				let html = "";
				html += 'ID 		: <input type="text" id="mem_id" value='+data.mem_id+' readonly><br>';
				html += '현재 PW		: <input type="password" id="mem_cPw" placeholder="비밀번호를 입력해 주세요"><button id="pwCheck" value="N">비밀번호확인</button><br>';
				html += '변경할 PW	: <input type="password" id="mem_ePw" placeholder="비밀번호를 입력해 주세요"><br>';
				html += '이름			:<input type="text" id="mem_name" value='+data.mem_name+'><br>';
				html += '번호 		: <input	 type="text" id="mem_tel" value='+data.mem_tel+'><br>';
				html += '<button id="memberUpt">수정하기</button>'
				$("#TEST").html(html);
				console.log("TTET");
			}
		}); */
		ajaxAction("POST","/members/editMemForm",{"mem_id" : mem_id},function(data){
			let html = "";
			html += 'ID 		: <input type="text" id="mem_id" value='+data.mem_id+' readonly><br>';
			html += '현재 PW		: <input type="password" id="mem_cPw" placeholder="비밀번호를 입력해 주세요"><button id="pwCheck" value="N">비밀번호확인</button><br>';
			html += '변경할 PW	: <input type="password" id="mem_ePw" placeholder="비밀번호를 입력해 주세요"><br>';
			html += '이름			:<input type="text" id="mem_name" value='+data.mem_name+'><br>';
			html += '번호 		: <input	 type="text" id="mem_tel" value='+data.mem_tel+'><br>';
			html += '<button id="memberUpt">수정하기</button>'
			$("#TEST").html(html);
		});
	};	
});

$(document).on("click","#pwCheck",function(){
	let mem_id = $("#mem_id").val();
	let mem_pw = $("#mem_cPw").val();
	console.log("###!");
/* 	$.ajax({
		type: "JSON",  
		url:  "/members/pwCheck", 
		method : 'POST',
		data: {"mem_id" : mem_id,
			   "mem_pw" : mem_pw},
		success:function(data) {
			
			if("0"==data){
				alert("정보가 일치하지 않습니다. 다시 확인해주세요.");
			}else if("1"==data){
	 			$("#pwCheck").attr("value", "Y"); 				
	 			$("#mem_cPw").attr("readonly", true); 
	 			alert("비밀번호확인이 완료되었습니다.");
			}
			
		}
			
		
	}); */
	ajaxAction("POST","/members/pwCheck",{"mem_id" : mem_id,"mem_pw" : mem_pw},function(data){
		if("0"==data){
			alert("정보가 일치하지 않습니다. 다시 확인해주세요.");
		}else if("1"==data){
 			$("#pwCheck").attr("value", "Y"); 				
 			$("#mem_cPw").attr("readonly", true); 
 			alert("비밀번호확인이 완료되었습니다.");
		}
	});
});

$(document).on("click","#memberUpt",function(){
	var param={};
	
	param.mem_id = $("#mem_id").val();
	param.mem_pw = $("#mem_ePw").val();
	param.mem_name = $("#mem_name").val();
	param.mem_tel = $("#mem_tel").val(); 
	console.log("param : "+param);
	if("" != $("#mem_id").val() && "" != $("#mem_ePw").val() && "" != $("#mem_name").val() && "" != $("#mem_tel").val()){
		if($("#mem_ePw").val().length < 4){
			alert("비밀번호를 4자리 이상 입력해주세요.");
		}else{
			if($("#pwCheck").val() == "Y"){
				var editCheck = confirm("회원 정보를 수정하시겠습니까?");
				if(editCheck){
/* 					$.ajax({
						type: "JSON",  
						url:  "/members/editMemInfo", 
						method : 'POST',
						data: param,
						success:function(data) {
							alert("회원정보가 수정되었습니다. 수정하신 회원님의 ID : "+data);
							location.href="/";
						}
					}); */
					ajaxAction("POST","/members/editMemInfo",param,function(data){
						alert("회원정보가 수정되었습니다. 수정하신 회원님의 ID : "+data);
						location.href="/";
					});
				}	
			}else{
				alert("비밀번호 확인을 하지 않으셨습니다. 비밀번호를 확인해주세요.");
			}
		}
	}else{
		alert("회원 정보를 모두 입력해 주세요.");
	}
})

$(document).on("click","#test2",function(){
	var param = {};
	ajaxAction("POST","/members/test",param,function(data){
		alert("data : "+data);
	});
}); 
</script>

<div id="memberList">
	<div class="container">
		<div id="TEST"> <h1>수정하실 회원님의 ID를 클릭해주세요</h1>
			<table >
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>가입날짜</th>
						<th>수정한날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${members}">
					   <tr>
					     <td class="editMemInfo">${item.mem_id}</td>
					     <td>${item.mem_name}</td>
					     <td>${item.mem_tel}</td>
					     <td>${item.mem_regDate}</td>
					     <td>${item.mem_uptDate}</td>
					   </tr>  
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<button id = "home">메인</button>
		</div>
		<div>
			<button id="test2">test2</button>
		</div>
	</div>
</div>