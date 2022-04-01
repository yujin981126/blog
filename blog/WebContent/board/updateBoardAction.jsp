<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");	

	Board board = new Board();
	board.boardNo = Integer.parseInt(request.getParameter("boardNo"));
	board.categoryName = request.getParameter("categoryName");	
	board.boardTitle = request.getParameter("boardTitle");	
	board.boardContent = request.getParameter("boardContent");	
	board.boardPw = request.getParameter("boardPw");
	
	// 디버그 
	System.out.println("boardNo->" +board.boardNo);
	System.out.println("categoryName->" +board.categoryName);
	System.out.println("boardTitle->" +board.boardTitle);
	System.out.println("boardContent->" +board.boardContent);
	System.out.println("boardPw->" +board.boardPw);

	BoardDao boardDao = new BoardDao();
	boardDao.updateBoard(board);
	
	// 리스트 페이지로 이동 
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>