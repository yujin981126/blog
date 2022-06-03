<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	BoardDao boardDao = new BoardDao();
	ArrayList<Board> boardList = boardDao.selectLastBoard();
	
	PhotoDao photoDao = new PhotoDao();
	ArrayList<Photo> photoList = photoDao.selectLastPhoto();
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
	</style>
</head>
<body>

<div class="container">
<jsp:include page="/inc/upMenu.jsp"></jsp:include>
<div class="container p-4 my-4">
  <h3> 😍 Welcome My Blog Page 😍</h3>
  <p>Free Style(프리스타일) - Y<p>
  <audio autoplay controls loop>
    <source src="<%=request.getContextPath()%>/audio/Freestyle.mp3" type="audio/mp3">
</audio>
  <div class="row">
	  <div class="col-sm-3"></div>
	 	 <div class="col-sm-6">
	 	 <a href="<%=request.getContextPath()%>/guestBook/guestList.jsp" class="btn ws-btn btn-block btn-outline-info">방명록 작성하기</a>
	 	 </div>
	  <div class="col-sm-3"></div>
	</div>
</div>
<div class="container">
		<div class="row">
			<div class="col-sm-6 text-left">
			<h5 class="text-info"><b> ㆍ게시글</b><a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-link text-info bg-light btn-sm float-right">더보기</a></h5>
			 
				<table class="table table-hover">	
					<% for(Board b : boardList){ %>
						<tr>
							<td>
								<a href="<%=request.getContextPath()%>/board/boardOne.jsp?boardNo=<%=b.getBoardNo()%>" class="text-secondary">
									<b><%=b.getBoardTitle()%></b>
								</a>
							</td>
							<td class="text-right"><%=b.getCreateDate()%>
							</td>
						</tr>
					<% } %>
				</table>
			</div>
			<div class="col-sm-6 text-left">
			<h5 class="text-info"><b>ㆍ갤러리</b><a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-link text-info bg-light btn-sm float-right">더보기</a></h5>
				<table class="table">	
				<tr>
					<%for(Photo p : photoList){%>
					<td>
					<br>
						<a href="<%=request.getContextPath()%>/photo/photoOne.jsp?photoNo=<%=p.getPhotoNo()%>">
							<img src="<%=request.getContextPath()%>/upload/<%=p.getPhotoName()%>" width = "150" height="150">
						</a>
					</td>
					<% } %>
				<tr>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>