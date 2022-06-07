<%@page import="java.util.ArrayList"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	if(searchGubun == null||searchGubun.trim().equals("")){
		searchGubun = "";
	}
	if(searchData == null||searchData.trim().equals("")){
		searchData = "";
	}
	if(searchGubun.trim().equals("")||searchData.trim().equals("")){
		searchGubun = "";
		searchData = "";
	}

	
%>
<form name="chugaTopForm">
<table border="1" align="center" style="width: 80%;">
	<tr><td colspan="2"><h2>메모장</h2></td></tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>메모</td>
		<td>
			<input type="text" name="memo" style="width: 400px;">
			<button type="button" onclick="chuga();">확인</button>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="padding: 20px;">
			<jsp:include page="list_inner.jsp"></jsp:include>
		</td>
	</tr>
</table>
</form>
<script>
	function chuga(){
		document.chugaTopForm.action="mainProc.jsp?menuGubun=memo_chugaProc"
		document.chugaTopForm.method="post";
		document.chugaTopForm.submit();
	}
</script>
