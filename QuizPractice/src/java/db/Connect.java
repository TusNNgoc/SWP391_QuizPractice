package db;
import java.sql.*;

public class Connect
{
public static Connection createConnection()
{
	Connection con=null;
	try
	{
		try 
		{
		   Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(ClassNotFoundException ex)
		{
		   System.out.println("Error: unable to load driver class!");
		   System.exit(1);
		}			
	     con = DriverManager.getConnection("jdbc:mysql://localhost:3310/quizpracticedb1","root","123456@bC");
	}
	catch(SQLException sqe)
	{
	  sqe.printStackTrace();
	}
	return con;
}
}