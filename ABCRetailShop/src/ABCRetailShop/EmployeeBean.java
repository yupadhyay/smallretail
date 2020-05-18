package ABCRetailShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Employee bean class to get property of an employee
 * @author Yogesh Upadhyay
 *
 */
public class EmployeeBean {
private int eid;
private String ename;
private String city;
private String teplephone;
private String position;
private Connection con = null;
private PreparedStatement stmt = null;
private ResultSet rs = null;
String statement;
public void setEmployee(int eid){
	this.eid=eid;
	try {
		con = DataBaseConnection.getConnection();
		statement = "select * from employees2 where eid = "+this.eid;
		stmt = con.prepareStatement(statement);
		System.out.println(statement);
		rs = stmt.executeQuery();
		
		while(rs.next()){
			this.ename=rs.getString(2);			
			this.city= rs.getString(3);
			this.teplephone=rs.getString(4);
			this.position=rs.getString(5);
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
}
/**
 * Method used to update employee.
 * @param eid
 * @param city
 * @param telephone
 */
public void updateEmployee(int eid,String city,String telephone){
	try {
		con = DataBaseConnection.getConnection();
		statement = "update employees2 set city='"+city+"',telephone#='"+telephone+"' where eid="+eid;
		stmt = con.prepareStatement(statement);
		System.out.println(statement);
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
/**
 * Method to get employee name
 * @return Name of the employee
 */
public String getName(){
	return this.ename;
}
/**
 * Method that will get employee position
 * @return employee position
 */
public String getPosition(){
	return this.position;
}
/**
 * Method to get city name
 * @return employee city
 */
public String getCity(){
	return this.city;
}
/**
 * Method to get telephone number
 * @return telephone number
 */
public String getTelephone(){
	return this.teplephone;
}
/**
 * Test method to get employee name
 * @param eid
 * @return ename
 */
public String getName(int eid){
	this.eid=eid;
try {
	con = DataBaseConnection.getConnection();
	statement = "select ename from employees2 where eid = "+this.eid;
	stmt = con.prepareStatement(statement);
	System.out.println(statement);
	rs = stmt.executeQuery();
	while(rs.next()){
		ename = rs.getString(1);
		System.out.println(ename);
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
return ename;
}
/**
 * Test method to get employee position
 * @param eid
 * @return position
 */
public String getPosition(int eid){
	this.eid=eid;
	try {
		con = DataBaseConnection.getConnection();
		statement = "select position from employees2 where eid = "+this.eid;
		stmt = con.prepareStatement(statement);
		System.out.println(statement);
		rs = stmt.executeQuery();
		while(rs.next()){
			position = rs.getString(1);
			
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
	return position;
}
}
