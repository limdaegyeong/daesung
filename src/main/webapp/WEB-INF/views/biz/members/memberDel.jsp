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

<script>
$("#home").on("click",function(){
	location.href = "/";
});

$(".deleteMem").on("click",function(){
	let mem_id = this.textContent;
	console.log("mem_id : "+mem_id);
/* 	$.ajax({
		type: "JSON",  
		url:  "/members/editMemForm", 
		method : 'POST',
		data: {"mem_id" : mem_id}, 
		success:function(data) {
			console.log("###data : "+data.mem_id);
			let html = "";
			html += '<h1> 비밀번호를 입력해주세요.</h1>';
			html += 'ID : <input type="text" id="mem_id" value='+data.mem_id+' readonly><br>';
			html += 'pw	: <input type="password" id="mem_pw" placeholder="비밀번호를 입력해 주세요"><button id="pwCheck" value="N">비밀번호확인</button><br>';
			html += '<button id="deleteMem">삭제하기</button>'
			$("#memberList").html(html);
			console.log("TTET");
		}
	}); */
	ajaxAction("POST","/members/editMemForm",{"mem_id" : mem_id},function(data){
		let html = "";
		html += '<h1> 비밀번호를 입력해주세요.</h1>';
		html += 'ID : <input type="text" id="mem_id" value='+data.mem_id+' readonly><br>';
		html += 'pw	: <input type="password" id="mem_pw" placeholder="비밀번호를 입력해 주세요"><button id="pwCheck" value="N">비밀번호확인</button><br>';
		html += '<button id="deleteMem">삭제하기</button>'
		$("#memberList").html(html);
	});
});

$(document).on("click","#pwCheck",function(){
	let mem_id = $("#mem_id").val();
	let mem_pw = $("#mem_pw").val();
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
	 			$("#mem_pw").attr("readonly", true); 
	 			alert("비밀번호확인이 완료되었습니다.");
			}
			
		}	
	}); */
	ajaxAction("POST","/members/pwCheck",{"mem_id" : mem_id, "mem_pw" : mem_pw},function(data){
		if("0"==data){
			alert("정보가 일치하지 않습니다. 다시 확인해주세요.");
		}else if("1"==data){
 			$("#pwCheck").attr("value", "Y"); 				
 			$("#mem_pw").attr("readonly", true); 
 			alert("비밀번호확인이 완료되었습니다.");
		}
	});
});

$(document).on("click","#deleteMem",function(){
	let mem_id = $("#mem_id").val();
	console.log(mem_id);
	
	if($("#pwCheck").val() == "Y"){
		let lastCheck = confirm("정말 삭제하시겠습니까?");
		if(lastCheck){
			console.log("ajax 동작");
/* 			$.ajax({
				type: "JSON",  
				url:  "/members/deleteMem", 
				method : 'POST',
				data: {"mem_id" : mem_id},
				success:function(data) {
					alert("삭제한 회원님의 ID : "+data);
					location.href = "/";
					
				}
			}); */
			ajaxAction("POST","/members/deleteMem",{"mem_id" : mem_id},function(data){
				alert("삭제한 회원님의 ID : "+data);
				location.href = "/";
			});
		}
	}else{
		alert("비밀번호를 확인해주세요.");
	}
});



</script>

<div id="memberList">
	<div class="container">
		<div> <h1>삭제하실 회원님의 ID를 선택해주세요.</h1>
			<table>
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
					     <td class="deleteMem">${item.mem_id}</td>
					     <td>${item.mem_name}</td>
					     <td>${item.mem_tel}</td>
					     <td>${item.mem_regDate}</td>
					     <td>${item.mem_uptDate}</td>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div>
	<button id = "home">메인</button>
</div>