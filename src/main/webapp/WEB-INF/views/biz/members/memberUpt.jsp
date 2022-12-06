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
$(".editMemInfo").on("click",function(){

	var confirmCheck = confirm(this.textContent+" 님의 회원 정보를 수정하시겠습니까?")
	if(confirmCheck){
		var mem_id = this.textContent;
		$.ajax({
			type: "JSON",  
			url:  "/members/editMemInfoForm", 
			method : 'POST',
			data: {"mem_id" : mem_id}, 
			success:function(data) {
				console.log("###data : "+data.mem_id);
				//$("#memberList").html(data);
				let html = "";
				html += 'ID 		: <input type="text" id="mem_id" value='+data.mem_id+' readonly><br>';
				html += '현재 PW		: <input type="text" id="mem_cPw" placeholder="비밀번호를 입력해 주세요"><button id="pwCheck" value="N">비밀번호확인</button><br>';
				html += '변경할 PW	: <input type="text" id="mem_ePw" placeholder="비밀번호를 입력해 주세요"><br>';
				html += '이름			:<input type="text" id="mem_name" value='+data.mem_name+'><br>';
				html += '번호 		: <input	 type="text" id="mem_tel" value='+data.mem_tel+'><br>';
				html += '<button id="memberUpt">수정하기</button>'
				//$("#memberList").html(html);
				
			}
		});
	};	
});

$("#pwCheck").on("click",function(){
	let mem_id = $("#mem_id").val();
	let mem_cPw = $("#mem_cPw").val();
	$.ajax({
		type: "JSON",  
		url:  "/members/pwCheck", 
		method : 'POST',
		data: {"mem_id" : mem_id,
			   "mem_cPw" : mem_cPw},
		success:function(data) {
			
			$("#pwCheck").attr({
				"value" : "Y",
				"readonly" : "true"
			});
			
		}
	});
})

$("#memberUpt").on("click",function(){
	
	var editCheck = confirm("회원 정보를 수정하시겠습니까?");
	if(editCheck){
		$.ajax({
			type: "JSON",  
			url:  "/members/editMemInfo", 
			method : 'POST',
			data: {"mem_id" : mem_id,
				   "mem_pw" : mem_pw,
				   "mem_name" : mem_name,
				   "mem_tel" : mem_tel}, 
			success:function(data) {
				alert("success");
				
			}
		});
	}
})

</script>

<div id="memberList">
	<div class="container">
		<div> 리스트
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
	</div>
</div>