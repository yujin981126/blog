package dao;

import java.sql.*;
import java.util.*;
import vo.Pdf;
import vo.Photo;

public class PdfDao {
	
	public PdfDao() {}
	
	public void insertPdf(Pdf pdf) throws Exception {
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("드라이버 로딩 성공");
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
				
		String dburl = "jdbc:mariadb://3.39.153.13:3306/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		
		String sql = "INSERT INTO pdf(pdf_name, pdf_original_name, pdf_type, pdf_pw, writer, create_date, update_date) values(?,?,?,?,?,now(),now())";
		
		conn = DriverManager.getConnection(dburl,dbuser,dbpw);
		System.out.println("conn : " + conn);
		
		stmt = conn.prepareStatement(sql);
		stmt.setString(1,pdf.getPdfName());
		stmt.setString(2,pdf.getPdfOriginalName());
		stmt.setString(3,pdf.getPdfType());
		stmt.setString(4,pdf.getPdfPw());
		stmt.setString(5,pdf.getWriter());

		int row = stmt.executeUpdate();
		
		if(row == 1) { 
			System.out.println(row + "행 입력성공");
		} else {
			System.out.println("행 입력실패");
		}
		stmt.close();
		conn.close();
	}
	
	//pdf 삭제
	public int deletePdf(int pdfNo, String pdfPw) throws Exception {
		int row = 0;
		
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("드라이버 로딩 성공");
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		String dburl = "jdbc:mariadb://3.39.153.13:3306/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		String sql = "DELETE FROM pdf WHERE pdf_no=? AND pdf_pw=?";
		
		conn = DriverManager.getConnection(dburl,dbuser,dbpw);
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, pdfNo);
		stmt.setString(2, pdfPw);
		System.out.println("stmt : " + stmt);
		
		row = stmt.executeUpdate();
		
		stmt.close();
		conn.close();
		
		return row;
		
	}
	public int selectPhotoTotalRow() throws Exception {
		int total = 0;
		
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("드라이버 로딩 성공");
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String dburl = "jdbc:mariadb://3.39.153.13:3306/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		
		String sql = "SELECT COUNT(*) cnt FROM pdf";
		
		conn = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		stmt = conn.prepareStatement(sql);
		
		rs = stmt.executeQuery();
		if(rs.next()) {
			total = rs.getInt("cnt");
		}
		
		return total;
	}
	
	//pdf 리스트 출력
	public ArrayList<Pdf> selectPdfListByPage(int beginRow,int rowPerPage) throws Exception {
		ArrayList<Pdf> list = new ArrayList<Pdf> ();
		Class.forName("org.mariadb.jdbc.Driver");
		System.out.println("드라이버 로딩 성공");
		// 데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
			
		String dburl = "jdbc:mariadb://3.39.153.13:3306/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		
		String sql = "SELECT pdf_no pdfNo,pdf_name pdfName, writer,create_date createDate FROM pdf ORDER BY create_date DESC LIMIT ?,?";
		
		conn = DriverManager.getConnection(dburl,dbuser,dbpw);
		
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		
		rs= stmt.executeQuery();
		while(rs.next()) {
			Pdf pdf = new Pdf();
			pdf.setPdfNo(rs.getInt("pdfNo"));
			pdf.setPdfName(rs.getString("pdfName"));
			pdf.setWriter(rs.getString("writer"));
			pdf.setCreateDate(rs.getString("createDate"));
			list.add(pdf);
		}
		return list;
	}
	
	public ArrayList<Pdf> selectPdfOneList(int pdfNo) throws Exception {
		ArrayList<Pdf> list = new ArrayList<Pdf>();
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String dburl = "jdbc:mariadb://3.39.153.13:3306/blog";
		String dbuser = "root";
		String dbpw = "mariadb1234";
		conn = DriverManager.getConnection(dburl, dbuser, dbpw); 
		
		String sql = "select pdf_name pdfName,writer,create_date createDate,update_date updateDate from pdf where pdf_no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, pdfNo);
		rs = stmt.executeQuery();
		
		while(rs.next()) {
			Pdf p = new Pdf();
			p.setPdfName(rs.getString("pdfName"));
			p.setWriter(rs.getString("writer"));
			p.setCreateDate(rs.getString("createDate")); 
			p.setUpdateDate(rs.getString("updateDate")); 
			list.add(p);
		}
		stmt.close();
		conn.close();
		return list;
	}
}
