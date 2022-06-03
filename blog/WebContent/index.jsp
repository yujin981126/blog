<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.time.LocalDate" %>
<%
	LocalDate now = LocalDate.now();
	BoardDao boardDao = new BoardDao();
	ArrayList<Board> list= boardDao.selectLastBoard();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<style>
		.container{
		text-align:center;
		
		}
		.bg_img img{
		 position: relative;
		 top:0;
		 right:0;
		 filter: brightness(65%); 
		 width:100%;
		 z-index: -1;

		 }
		 .text_box{
		 position: absolute;
		 margin-top: -150px;
		 margin-left: 40px;
		 
		 }
	</style>
</head>
<body>

<div class="container">
<jsp:include page="/inc/upMenu.jsp"></jsp:include>
	<div class="bg_img">
		<img src="img/bgimg.jpg">
		<div class="text-white text-left text_box">
			<h4><%=now%></h4>
			<h1>yujin981126 님의 블로그</h1>
			<h6><a href="https://github.com/yujin981126" class="text-light">https://github.com/yujin981126</a></h6>
		</div>
		전체글보기
		<hr>
		<div class="row">
			<div class="col-sm-6 text-left">
			 <p class="bg-info text-white"> 게시글
			 <a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-link text-info bg-light btn-sm float-right">더보기</a></p>
				
				<table class="table">	
					<%for(Board b : list) {%>
					<tr height="30">
						<td><a href="<%=request.getContextPath()%>/board/boardOne.jsp?boardNo=<%=b.getBoardNo()%>" class="text-info"><b><%=b.getBoardTitle()%></b></a></td>
						<td class="text-right"><%=b.getCreateDate()%></td>
					</tr>
					<%}%>
				</table>
			</div>
			<div class="col-sm-6 text-left">
			 <p class="bg-info text-white"> 갤러리
			 				<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-link text-info bg-light btn-sm float-right">더보기</a></p>

				<table class="table">	
					<%for(Board b : list) {%>
					<tr height="30">
						<td><a href="<%=request.getContextPath()%>/board/boardOne.jsp?boardNo=<%=b.getBoardNo()%>" class="text-info"><b><%=b.getBoardTitle()%></b></a></td>
						<td class="text-right"><%=b.getCreateDate()%></td>
					</tr>
					<%}%>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>