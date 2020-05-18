package ABCRetailShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * class to validate login
 * @author Yogesh Upadhyay
 *
 */
public class ValidateLogin {
private int loginName;
private String password;
private Connection con=null;
private PreparedStatement stmt;
private ResultSet rs;
private String statement;
/**
 * Method that will validate login name
 * This method is implemented twice one in the Login.java file.
 * @param loginName
 * @param Password
 * @return boolean representing status.
 */
public boolean validate(int loginName,String Password){
	this.loginName=loginName;
	this.password=Password;
	try {
		con=DataBaseConnection.getConnection();
		statement="select * from login where username = "+this.loginName+" and password = '"+this.password+"'";
		System.out.println(statement);
		stmt=con.prepareStatement(statement);
		rs = stmt.executeQuery();
		
		int i=0;
		while(rs.next()){
			i++;
		}
		if(i>0){
			return true;
		}
		System.out.println(i);
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		try {
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	return false;
}
}
