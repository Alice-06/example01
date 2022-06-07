<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>

<%
	MemoDAO dao = new MemoDAO();
	int result = dao.setDelete(dto);
	 
	if(result > 0){
		out.println("<script>");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun==memo_view&no=" + no + "';");
		out.println("</script>");
	}
%>