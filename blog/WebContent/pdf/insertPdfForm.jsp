<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertPdfForm</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<style>
		.container{text-align:center;}
		td{text-align:left;}
		.rightbutton{text-align:right;}
	</style>
</head>
<body>	
	<div class="container">
	<jsp:include page="/inc/upMenu.jsp"></jsp:include><br>
	<div class="text-info"><br><h1>PDF 업로드</h1></div>
	  <form method="post" action = "<%=request.getContextPath() %>/pdf/insertPdfAction.jsp"  enctype="multipart/form-data">
	      <table class="table text-info">
	        <tr>
				<td class="bg-light">pdf</td>
				<td>
					<input type="file" name="pdf">
				</td>
			</tr>
			<tr>
				<td class="bg-light">작성자</td>
				<td>
				<input type="text" name="writer" class = "form-control">
				</td>
			</tr>
			<tr>
				<td class="bg-light">비밀번호</td>
				<td>
				<input type="password" name="pdfPw" class= "form-control">
				</td>
			</tr>
			<tr>
	      </table>
	   <div class="rightbutton">
	  		 <button type="submit" class="btn btn-link text-light bg-info">업로드</button>
		     <a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-link text-info bg-light">뒤로가기</a>	     
	     </div>
	   </form>
   </div>
<br>
</body>
</html>