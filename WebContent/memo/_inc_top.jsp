<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<% request.setCharacterEncoding("UTF-8"); %>

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

	int no = 0;
	String no_ = request.getParameter("no");
	MemoDTO dto = null;
	if (!(no_ == null || no_.trim().equals(""))) {
		no = Integer.parseInt(no_);
		
		MemoDTO arguDto = new MemoDTO();
		arguDto.setNo(no);
		
		MemoDAO dao = new MemoDAO();
		dto = dao.getSelectOne(arguDto);
	}
	
%>