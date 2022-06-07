<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/inc_header.jsp"%>
<%
	String linkAddr = path + "/main/main.jsp";
%>
<table border="0" width="90%" align="center">
	<tr>
		<td align="center" style="padding: 0px 10px 0px 10px;" id="dashBoard"><a
			href="<%=linkAddr%>?menuGubun=dashBoard_index">Home</a></td>
		<td align="center" style="padding: 0px 10px 0px 10px;" id="memo"><a
			href="<%=linkAddr%>?menuGubun=memo_list">메모장</a></td>
	</tr>
</table>
<script>
function applyStyle(){
	document.getElementById('<%=folderName%>').style.backgroundColor = "gray";
}
applyStyle();
</script>
