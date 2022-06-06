<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	int beginRow = 0;
	int rowPerPage = 10; 
	int currentPage = 1; 
	
	if((request.getParameter("currentPage")) != null)  {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	beginRow = (currentPage-1)*rowPerPage; 
	
	PdfDao pdfDao = new PdfDao();
	ArrayList<Pdf> list = pdfDao.selectPdfListByPage(beginRow,rowPerPage);
	

	int lastPage = 0;
	
	int total = pdfDao.selectPhotoTotalRow();
	lastPage = total/ rowPerPage;
	if(total % rowPerPage != 0) {
		lastPage++;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdfList</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<style>
		.container{text-align:center;}
		td{text-align:left;}
		.right{text-align:right;}
	</style>
</head>
<div class="container">
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="text-info">
	<br><h1>PDF 자료실</h1>
	</div>
	<br>
	<table class="table text-info">
		<tr class="bg-info text-light">
			<td>PDF</td>
			<td>Writer</td>
			<td>createDate</td>
		</tr>
		<%
			for(Pdf p : list) {
		%>
			<tr>
				<td>
					<a href="<%=request.getContextPath()%>/pdf/pdfOne.jsp?pdfNo=<%=p.getPdfNo()%>"><%=p.getPdfName()%></a>
				</td>
				<td><%=p.getWriter()%></td>
				<td><%=p.getCreateDate()%>
				</td>
			</tr>
		<%
			}
		%>
	</table>
	<!-- 페이지 부분 -->
	
	<!-- 현재페이지가 1이면 이전페이지가 존재해서는 안된다. -->
	<%if(currentPage > 1) {%>
			<a href = "<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-link text-info bg-light">이전</a>	
	<% } %>
	<!-- 마지막 페이지라면 다음페이지가 존재해서는 안된다. -->
	<% if(currentPage < lastPage) { %>
			<a href = "<%=request.getContextPath()%>/pdf/pdfList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-link text-info bg-light">다음</a>
	<% } %>	

	<div class="text-right">
		<a href="<%=request.getContextPath()%>/pdf/insertPdfForm.jsp" class="btn btn-link text-light bg-info">업로드</a>	
	</div>
</div>
</body>
</html>