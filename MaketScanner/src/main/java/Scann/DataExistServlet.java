package Scann;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DataExistServlet
 */
@WebServlet("/DataExistServlet")
public class DataExistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataExistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Id=request.getParameter("productid");
		
		LocalDate CurrentDate = java.time.LocalDate.now();
		Date Date1 = Date.valueOf(CurrentDate);
		
		String StrQuery="select * from scandate1 where id='"+Id+"'";
		String StrQuery1="insert into scandate1 values(?,?,?)";
		try
		{
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/scannerdb?user=root&password=root");
		
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(StrQuery);
		
		if(rs.next())
		{
			PreparedStatement stmt1=con.prepareStatement(StrQuery1);
			stmt1.setString(1, Id);
			stmt1.setString(2, rs.getString(2));
			stmt1.setDate(3, Date1);
			
			int result=stmt1.executeUpdate();
			if(result==1)
			{
				response.sendRedirect("http://localhost:8081/MaketScanner/DataCheck/MaintanincePage.jsp");
			}
			else
			{
				response.sendRedirect("Error");
			}
		}
		else
		{
			response.sendRedirect("http://localhost:8081/MaketScanner/DataCheck/MaintanincePage1.jsp?aid="+Id);
		}
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
