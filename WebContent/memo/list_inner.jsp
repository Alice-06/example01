<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file = "_inc_top.jsp" %>
<%
	MemoDAO dao = new MemoDAO();
	
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null||pageNumber_.trim().equals("")){
		pageNumber_ = "1";
	}
	int pageNumber = Integer.parseInt(pageNumber_);
	int pageSize = 10;
	int blockSize = 10;
	int totalRecord = dao.getTotalRecord(searchGubun, searchData);
	int block = (pageNumber - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNumber - 1);
	
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	
	int startRecord = pageSize * (pageNumber - 1) + 1;
	int lastRecord = pageSize * pageNumber;
	
	
	ArrayList<MemoDTO> list = dao.getSelectAll(searchGubun, searchData, startRecord, lastRecord);

%>
	<table border="1" style="width: 800px;">
	<input type="hidden" name="suntaekNo">
		<tr>
			<% if(searchGubun.equals("") || searchData.equals("")){ %>
				* 전체 레코드 : <%= totalRecord%>건(<b><%=pageNumber %></b>/<%=totalPage %>)
			<%	}else{ %>
				* 검색어 <font style="color: red; font-weight: bold;">"<%=searchData %>"</font>(으)로 검색된 레코드 : <%=totalRecord %>건(<b><%=pageNumber %></b>/<%=totalPage %>)
			<%	} %>
		</tr>
		<tr align="center" style="font-weight: bold;">
			<td>
				<input type="checkbox" id="checkAll" name="checkAll" >
			</td>
			<td>ID</td>
			<td>이름</td>
			<td>메모</td>
			<td>날짜</td>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			MemoDTO imsidto = list.get(i);
			String memo = imsidto.getMemo();
			memo = memo.replace("\n", "<br>");
		%>
		<tr>
			<td width="20px">
				<input type="checkbox" name="checkNo" value="<%=imsidto.getNo()%>">
			</td>
			<td><%=jj%></td>
			<td><%=imsidto.getName()%></td>
			<td><a href="#"	onclick="move('memo_view','<%=imsidto.getNo()%>');"><%=memo%></a></td>
			<td><%=imsidto.getRegiDate()%></td>
		</tr>
		<%
			jj--;
		}
		%>
		<tr>
			<td><button type="button" onclick="suntaekScript();" style="background: red; color: white; border: 0px;" align="center">X</button></td>
			<td colspan="5" style="padding: 10px 0px;" align="center">
				<select name="searchGubun">
						<option value=""<%if (searchGubun.equals("")) {	out.println("selected");}%>>--선택--</option>
						<option value="name"<%if (searchGubun.equals("name")) {	out.println("selected");}%>>이름</option>
						<option value="memo"<%if (searchGubun.equals("memo")) {	out.println("selected");}%>>메모</option>
						<option value="name_memo"<%if (searchGubun.equals("name_memo")) {out.println("selected");}%>>이름+메모</option>
				</select> &nbsp; <input type="text" name="searchData" value="<%=searchData%>">
					&nbsp;
					<button type="button" onclick="search();">검색</button>
			</td>
		</tr>
	<%	if(totalRecord > 0) {%>
	<tr>
		<td colspan="6" align="center" style="padding:10px 0px;">
			<a href="#" onclick="move('memo_list', '', '<%=searchGubun%>','<%=searchData%>','1');">[첫페이지]</a>
			&nbsp;
			<%
				if (block > 0){
					int imsiPage = (block -1) * blockSize + 10;
			%>
				<a href="#" onclick="move('memo_list','','<%=searchGubun%>','<%=searchData%>','<%=imsiPage%>');">[이전 10개]</a>
			<% } else { %>
					[이전 10개] 
			<%	} %>
			&nbsp;
			<%
				for (int goPage=1; goPage<=blockSize; goPage++){
					int imsiValue = block * blockSize + goPage;
					if(totalPage - imsiValue >= 0){
						if(imsiValue == pageNumber){
			%>
							<b>[<%=imsiValue %>]</b>
			<%
						}else {
			%>
							<a href="#" onclick="move('memo_list','','<%=searchGubun%>','<%=searchData%>','<%=imsiValue%>');"><%=imsiValue %></a>
			<%
						}
						out.println("&nbsp;");
					}
				}
			%>
			&nbsp;
			<% 
				int totalBlock = totalPage / blockSize;
				double value1 = (double)totalBlock;
				double value2 = totalPage / blockSize;
				if(value1 - value2 == 0){
					totalBlock = totalBlock - 1;
				}
				
				if(block - totalBlock <= 0){
					int yyy = (block + 1) * blockSize + 1;
					//int zzz = block + 1;
			%>
					<a href="#" onclick="move('memo_list','','<%=searchGubun%>','<%=searchData%>','<%=yyy%>');">[다음10개]</a>
			<%	}else { %>
				[다음 10개]
			<%
				}
			%>
			&nbsp;
			<a href="#" onclick="move('memo_list', '', '<%=searchGubun%>','<%=searchData%>','<%=totalPage%>');">[끝페이지]</a>
		</td>
	</tr>
<%	} %>
</table>
<script>
$(document).ready(function(){
	$("#checkAll").click(function(){
		if($("#checkAll").prop("checked")){
			$("input[name=checkNo]").prop("checked", true);
		}else{
			$("input[name=checkNo]").prop("checked", false);
		}
	});
});
function move(value1, value2, value3, value4, value5){
		var imsi = "";
		imsi += "main.jsp";
		imsi += "?menuGubun="+ value1; 
		imsi += "&no=" + value2; 
		imsi += "&searchGubun=" + value3; 
		imsi += "&searchData=" + value4; 
		imsi += "&pageNumber=" + value5; 
		location.href = imsi;
}
function search(){
	if(document.chugaTopForm.searchGubun.value == ''){
		alert('검색옵션을 선택하세요.');
		document.chugaTopForm.searchGubun.focus();
		return;
	}
 	if(document.chugaTopForm.searchData.value == ''){
		alert('검색어를 입력하세요.');
		document.searchForm.searchData.focus();
		return;
	}
	document.chugaTopForm.action = "main.jsp?menuGubun=memo_list";
	document.chugaTopForm.method = "post";
	document.chugaTopForm.submit();
}
function suntaekScript(){
	var imsiCheckNo = "";
	$('input[name="checkNo"]:checked').each(function (index){
		if(imsiCheckNo != ""){
			imsiCheckNo += ",";
		}
		imsiCheckNo += $(this).val();
		
	});
	if(confirm('정말로 체크된 메모들을 모두 삭제하시겠습니까?')){
		document.chugaTopForm.suntaekNo.value = imsiCheckNo;
		document.chugaTopForm.action = "mainProc.jsp?menuGubun=memo_sakjeScriptProc";
		document.chugaTopForm.method = "post";
		document.chugaTopForm.submit();
	}

}
</script>
