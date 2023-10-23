package Scann;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DataInsert
 */
@WebServlet("/DataInsert")
public class DataInsert extends HttpServlet {
	
	public Connection ConectionUtility() throws Exception
    {
    	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/scannerdb?user=root&password=root");
		return con;
    	
    }
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataInsert() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//We Are Using ScanIt to Office app as a scanner from mobile
			String Id=request.getParameter("productid");
			String Name=request.getParameter("productName");
			
			LocalDate CurrentDate = java.time.LocalDate.now();
			Date Date1 = Date.valueOf(CurrentDate);
			
			String StrQuery="Insert into scandate1 values(?,?,?)";
			try
			{
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/scannerdb?user=root&password=root");
			
			PreparedStatement stmt=con.prepareStatement(StrQuery);
			stmt.setString(1, Id);
			stmt.setString(2, Name);
			stmt.setDate(3, Date1);
			
			System.out.print("Name :-" +Name);
			int result=stmt.executeUpdate();
			
			if(result==1)
			{
				response.sendRedirect("http://localhost:8081/MaketScanner/DataCheck/MaintanincePage.jsp");
			}
			else
			{
				response.sendRedirect("Error");
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
