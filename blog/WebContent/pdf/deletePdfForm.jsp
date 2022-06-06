<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청값 받아오기
	int pdfNo = Integer.parseInt(request.getParameter("pdfNo"));
	System.out.println("pdfNo : " + pdfNo);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletPdfForm</title>
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
	<br>
	<h1>pdf삭제</h1>
	</div>
	<br>
	<form method = "post" action="<%=request.getContextPath() %>/pdf/deletePdfAction.jsp">
		<table class="table text-info">
			<tr class="bg-light">
				<td>pdfNo</td>
				<td><input type="text" name="pdfNo" value="<%=pdfNo%>"readonly="readonly" class="form-control"></td>
			</tr>
			<tr class="bg-light">
				<td>비밀번호</td>
				<td>
				<input type="password" name="pdfPw" class="form-control">
				</td>
			</tr>
		</table>
	<div class="rightbutton">
		<a href="<%=request.getContextPath()%>/pdf/pdfList.jsp?pdfNo=<%=pdfNo%>" class="btn btn-link text-info bg-light"> 뒤로가기</a>&nbsp;
		<button type="submit" class="btn btn-link text-light bg-info">삭제</button>
	</div>
	</form>
</div>
<br>
</body>
</html>