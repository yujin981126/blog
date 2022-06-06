<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	// pdfList.jsp에서 pdfNo를 불러와서 저장하기
	int pdfNo = Integer.parseInt(request.getParameter("pdfNo"));	
	System.out.println("pdfNo -> "+ pdfNo);
	
	PdfDao pdfDao = new PdfDao();
	ArrayList<Pdf> list = pdfDao.selectPdfOneList(pdfNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>pdfOne</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<style>
		.container ,.imgCenter{text-align:center;}
		td{text-align:left;}
		.rightbutton{text-align:right;}
	</style>
</head>
<body>
<div class="container">
	<jsp:include page="/inc/upMenu.jsp"></jsp:include>
		<div class="text-info">
			<br><h1>PDF상세보기</h1>
		</div>
		<br>
				<% for(Pdf p : list) {%>
				<table class="table text-info">
					<tr>
						<td class="bg-light">No</td><td><%=pdfNo %></td>
						<td class="bg-light">writer</td><td><%=p.getWriter() %></td>
					</tr>
					<tr>
						<td class="bg-light">createDate </td><td><%=p.getCreateDate() %></td>
						<td class="bg-light">updateDate</td><td><%=p.getUpdateDate() %></td>
					</tr>
						</table>
						<iframe style="width:100%; height:700px;" src="<%=request.getContextPath()%>/uploadPdf/<%=p.getPdfName()%>"></iframe>
					<% } %>
			
				<div class="rightbutton">
					<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp" class="btn btn-link text-info bg-light">뒤로가기</a>&nbsp;
					<a href="<%=request.getContextPath()%>/pdf/deletePdfForm.jsp?pdfNo=<%=pdfNo%>" class="btn btn-info float-right">삭제</a>
				</div>
			</div>
<br>
</body>
</html>