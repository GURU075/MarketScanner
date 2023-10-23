package Scann;
import java.sql.Connection;
import java.sql.DriverManager;  
public class ConnectionUtility   
{ 	 
	
	public static Connection getconnection() throws Exception
	{
		Connection con=null;
		Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		con=DriverManager.getConnection("jdbc:mysql://localhost/scannerdb?user=root&password=root");
		return con;
		
		
	}
	
	public static void main(String args[]) throws Exception  
	{  
		
		
	}  
}  