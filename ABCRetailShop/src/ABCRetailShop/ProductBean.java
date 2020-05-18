package ABCRetailShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Product Bean
 * @author Yogesh Upadhyay
 *
 */
public class ProductBean {
private int pid;
private String pname;
private int qoh;
private int qoh_threshold;
private int original_price;
private int discount_catogory;
private int sid;
private Connection con = null;
private PreparedStatement stmt = null;
private ResultSet rs = null;
String statement;
/**
 * Constructor to set product bean on primary key
 * @param pid
 */
public ProductBean(int pid){
	this.pid=pid;	
	try {
		con = DataBaseConnection.getConnection();
		statement = "select * from products2 where pid = "+this.pid;
		stmt = con.prepareStatement(statement);
		System.out.println(statement);
		rs = stmt.executeQuery();
		while(rs.next()){
			this.pname=rs.getString(2);
			this.qoh=rs.getInt(3);
			this.qoh_threshold=rs.getInt(4);
			this.original_price=rs.getInt(5);
			this.discount_catogory=rs.getInt(6);
			this.sid = rs.getInt(7);
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
 * sets of get method to get the property of products.
 * @return
 */
public String getName(){
	return this.pname;
}
public int getSupplier(){
	return this.sid;
}
public int getQoh(){
	return this.qoh;
}
public int getQohThreshold(){
	return this.qoh_threshold;
}
public int getOriginalPrice(){
	return this.original_price;
}
public int getDiscountCategory(){
	return this.discount_catogory;
}
}
