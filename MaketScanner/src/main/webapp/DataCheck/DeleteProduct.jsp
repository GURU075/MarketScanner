<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Scann.ConnectionUtility"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
			
<%
 try {
	 String id=request.getParameter("id");
	 String date=request.getParameter("date");
	 Date Date1 = Date.valueOf(date);
 
	 Connection con = ConnectionUtility.getconnection();
		Statement stmt3 = con.createStatement();
 	String strQuery = "delete from scandate1 where prodate='"+Date1+"' and id='"+id+"'";
 	
 	 int result = stmt3.executeUpdate(strQuery);
 	    if(result > 0 ) {
 	    	response.sendRedirect("http://localhost:8081/MaketScanner/DataCheck/MaintanincePage.jsp");
 	    } else {
 	    	response.sendRedirect("Error.jsp");
 	    }
 } catch(Exception e) {
	 e.printStackTrace();
 }	    
	    
%>