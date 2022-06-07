<%@page import="config.MyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file = "_inc_top.jsp" %>
<%
	String name =  request.getParameter("name");
	String memo = request.getParameter("memo");
	
	if(name == null || name.trim().equals("")||memo == null || memo.trim().equals("")){
		out.println("<script>");
		out.println("alert('반드시 이름칸과 메모칸을 모두 작성해야 합니다!')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
		return;
	}
	
	MemoDTO imsiDto = new MemoDTO();
	imsiDto.setName(name);
	imsiDto.setMemo(memo);	
	
 	MemoDAO dao = new MemoDAO();
	int result = dao.setInsert(imsiDto);
	 
	if(result > 0){
		out.println("<script>");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('등록 중 오류가 발생했습니다.')");
		out.println("location.href = 'main.jsp?menuGubun=memo_list';");
		out.println("</script>");
	} 

%>