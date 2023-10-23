<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="Scann.ConnectionUtility" %>
<%@ page import="java.sql.SQLException" %>

<%
try {
    // Get the current date
    java.util.Date currentDate = new java.util.Date();
    java.sql.Date currentSqlDate = new java.sql.Date(currentDate.getTime());

    // Calculate the previous day's date
    java.util.Calendar cal = java.util.Calendar.getInstance();
    cal.setTime(currentDate);
    cal.add(java.util.Calendar.DATE, -1);
    java.sql.Date previousSqlDate = new java.sql.Date(cal.getTimeInMillis());

    Connection con = ConnectionUtility.getconnection();
    Statement stmt = con.createStatement();

    // SQL query to copy data from the previous day to the current day
     String sql = "INSERT INTO scandate1 (id, name, prodate) " +
                 "SELECT id, name, '" + currentSqlDate + "' " +
                 "FROM scandate1 " +
                 "WHERE prodate = '" + previousSqlDate + "'";

    int rowsAffected = stmt.executeUpdate(sql);

    //out.println("Data copied from the previous day to the current day. Rows affected: " + rowsAffected);


} catch (SQLException e) {
    e.printStackTrace();
    out.println("Error copying data: " + e.getMessage());
}
%>
