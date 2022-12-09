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
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<button id = "home">메인</button>
		</div>
	</div>
</div>