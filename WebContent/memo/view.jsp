<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>


<table border="1" align="center" style="width: 80%;">

	<tr><td colspan="2"><h2>메모 상세보기</h2></td></tr>
	<tr>
		<td>순번</td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>메모</td>
		<td><%=dto.getMemo() %></td>
	</tr>
	<tr>
		<td>날짜</td>
		<td><%=dto.getRegiDate()%></td>
	</tr>
	<tr>
		<td colspan="2" >
			<div align="center" style="padding: 20px 0px;">
			|
			<a href="#" onclick="move('memo_list','');">목록으로</a>
			|
			<a href="#" onclick="move('memo_sakjeProc','<%=dto.getNo()%>');">메모삭제</a>
			|
			</div>
		</td>
	</tr>
</table>
</body>
<script>
function move(value1, value2){
	if(confirm('정말 삭제할까요?')){
		location.href = "main.jsp?menuGubun=" + value1 + "&no=" + value2
	}
}
</script>