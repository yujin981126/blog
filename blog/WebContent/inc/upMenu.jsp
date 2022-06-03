<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%
	LocalDate now = LocalDate.now();
%>
<style>
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
.img_box{
	display: block;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<div class="bg_img">
		<div>
		<a href="<%=request.getContextPath()%>/index.jsp" class="img_box"> 
			<img src="<%=request.getContextPath()%>/img/bgimg.jpg">
		</a>
		</div>
		<div class="text-white text-left text_box">
			<h4><%=now%></h4>
			<h1>yujin981126 님의 블로그</h1>
			<h6><a href="https://github.com/yujin981126" class="text-light">https://github.com/yujin981126</a></h6>
		</div>
	</div>
		<div class="btn-group" style=" width:100%;">
		<a href="<%=request.getContextPath()%>/board/boardList.jsp" class="btn btn-info">게시판</a>
		<a href="<%=request.getContextPath()%>/guestBook/guestList.jsp" class="btn btn-info">방명록</a>
		<a href="<%=request.getContextPath()%>/photo/photoList.jsp" class="btn btn-info">갤러리</a>
	</div>

