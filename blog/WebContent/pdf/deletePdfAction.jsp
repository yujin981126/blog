<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.*"%>
<% 
	int pdfNo = Integer.parseInt(request.getParameter("pdfNo"));
	String pdfPw = request.getParameter("pdfPw");
	
	PdfDao pdfDao = new PdfDao();
	
	int row = pdfDao.deletePdf(pdfNo,pdfPw);
	
	if(row  == 0) { // 삭제 실패
		System.out.println("삭제 실패");
		response.sendRedirect(request.getContextPath()+"/pdf/deletePdfForm.jsp?pdfNo=" + pdfNo);
	} else if (row == 1) { // 삭제 성공
		System.out.println("삭제 성공");
		response.sendRedirect(request.getContextPath()+"/pdf/pdfList.jsp");
	}else { 
		System.out.println("에러");
	}
	
%>
