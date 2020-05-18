package ABCRetailShop;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
/**
 * Class that will handle data base connectivity.
 * @author Yogesh Upadhyay
 *
 */
public class DataBaseConnection {
	/**
	 * Main file used for data base connectivity
	 */

	/**
	 * Static function that will return connection object
	 */
	
	public static Connection   getConnection() throws SQLException,ClassNotFoundException{
	Connection con = null;
	try{
		
		String service= "";
		String userid = "";
		String pwd = "";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		service = "jdbc:oracle:thin:@groucho.cc.binghamton.edu:1521:ACAD92";
		userid = "nmehta1";
		pwd = "nikhil";
	
		con = DriverManager.getConnection(service,userid,pwd);
		
	}catch (SQLException e){
	      throw e;
	}catch (ClassNotFoundException e){
	      throw e;
	}
	return con;
	}
	
	
	/**
	 * Method to get DBMS property
	 * @return
	 */
	
	public static Properties getDBProps(){
		java.util.Properties props = new java.util.Properties();

        props.put("user","nmehta1");

        props.put("password","nikhil");

	    return props;	
		
	}
	/**
	 * Method to return connection object
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	
	public static Connection   getConnectionObject() throws SQLException,ClassNotFoundException	{
	 Connection con = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@groucho.cc.binghamton.edu:1521:ACAD92",getDBProps());
	
	}catch (SQLException e){
	  throw e;
	}catch (ClassNotFoundException e){
	  throw e;
	}
	return con;
	}
	
	/**
	 * Main method for testing
	 */
	/*public static void main(String args[]) {
		
		try {
			Connection con = getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Connection Suceed");
				
	}*/
	
  }
