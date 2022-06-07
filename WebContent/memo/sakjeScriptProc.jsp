<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "_inc_top.jsp" %>
    
<%
	String suntaekNo = request.getParameter("suntaekNo");
	int result = 0;


	if(suntaekNo == null){
		
	}else{
		String[] imsiArray = suntaekNo.split(",");
		
		MemoDAO dao = new MemoDAO();
		result = dao.setDeleteBatch(imsiArray);
	}

	out.println("<script>");
	out.println("alert('" + result + "건이 삭제 되었습니다.');");
	out.println("location.href = 'main.jsp?menuGubun=memo_list';");
	out.println("</script>"); 
	


%>