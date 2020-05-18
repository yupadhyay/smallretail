package ABCRetailShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Class that will handle login issue
 * @author Yogesh Upadhyay
 *
 */
public class Login {
private Connection con=null;
private PreparedStatement stmt = null;
private String statement;
private ResultSet rs;
/**
 * Method to check if the supplied password is correct
 * @param username
 * @param password
 * @return true if correct else false
 */
public boolean checkPassword(int username,String password){
try {
	con = DataBaseConnection.getConnection();
	statement = "select * from login where username="+username+"and password = '"+password+"'";
	stmt = con.prepareStatement(statement);
	rs = stmt.executeQuery();
	int i=0;
	while(rs.next()){
		i++;
	}
	
if(i==0){
	return false;
}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally{
	try {
		rs.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}
return true;	
}
/**
 * Method to change password of the user.
 * @param username
 * @param newPassword
 */
public void changePassword(int username,String newPassword){
	try {
		con = DataBaseConnection.getConnection();
		statement = "update login set password = '"+newPassword+"' where username='"+username+"'";
		System.out.println(statement);
		stmt = con.prepareStatement(statement);
		stmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		try {
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}	
}
}
