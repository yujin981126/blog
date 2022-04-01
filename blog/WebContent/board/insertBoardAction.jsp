<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="vo.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");	
	//넘겨온 문자들 저장해주기
	Board board = new Board();
	board.categoryName = request.getParameter("categoryName");	
	board.boardTitle = request.getParameter("boardTitle");	
	board.boardContent = request.getParameter("boardContent");	
	board.boardPw = request.getParameter("boardPw");
	
	// 디버그 
	System.out.println("categoryName->" +board.categoryName);
	System.out.println("boardTitle->" +board.boardTitle);
	System.out.println("boardContent->" +board.boardContent);
	System.out.println("boardPw->" +board.boardPw);

	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	response.sendRedirect(request.getContextPath()+"/board/boardList.jsp");
%>