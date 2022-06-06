<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.io.File" %>
<%
	request.setCharacterEncoding("utf-8");

	String path = application.getRealPath("uploadPdf");
	System.out.println(path);
	MultipartRequest multiReq = new MultipartRequest(request, path,1024*1024*100,"utf-8",new DefaultFileRenamePolicy());
	
	String pdfPw = multiReq.getParameter("pdfPw");
	String writer = multiReq.getParameter("writer");
	
	String pdfOriginalName = multiReq.getOriginalFileName("pdf");
	String pdfName = multiReq.getFilesystemName("pdf"); 
	String pdfType = multiReq.getContentType("pdf");
	
	//디버깅
	System.out.println(pdfPw + "<--pdfPw");
	System.out.println(writer + "<--writer");
	System.out.println(pdfOriginalName + "<--pdfOriginalName");
	System.out.println(pdfName + "<--pdfName");
	System.out.println(pdfType + "<--pdfType");
	
	if(pdfType.equals("application/pdf")) {
		PdfDao pdfDao = new PdfDao();
		Pdf pdf = new Pdf();
		pdf.setPdfName(pdfName);
		pdf.setPdfOriginalName(pdfOriginalName);
		pdf.setPdfType(pdfType);
		pdf.setPdfPw(pdfPw);
		pdf.setWriter(writer);
		
		pdfDao.insertPdf(pdf);
	
		response.sendRedirect(request.getContextPath() + "/pdf/pdfList.jsp");

	} else {
		File file = new File(path+"\\"+pdfName);
		file.delete();
		response.sendRedirect(request.getContextPath()+"/pdf/insertPdfForm.jsp");

	}
%>
