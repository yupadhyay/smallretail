package ABCRetailShop;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 * Class to handle purchase issue.
 * @author Yogesh Upadhyay
 *
 */
public class MakePurchase {
private Connection con=null;
private PreparedStatement stmt = null;
private ResultSet rs = null;
private double totalPrice;
private String statement;
/**
 * Test method to make purchase based on parameter
 * @param eid
 * @param pid
 * @param cid
 * @param qty
 */
public void makePurchase(int eid,int pid,int cid,int qty){
	try {
		con=DataBaseConnection.getConnection();
		String procedure = "begin add_tuple.add_purchase(:1,:2,:3,:4); end;";
		CallableStatement cs = con.prepareCall(procedure);
		cs.setInt(1, eid);
		cs.setInt(2, pid);
		cs.setInt(3, cid);
		cs.setInt(4, qty);
		cs.executeQuery();
		
		
	} catch (SQLException e) {
		if(e.getErrorCode()==20001){
			System.out.println("Insufficient Quantity in stock Please refer Manager");	
		}
	
		if(e.getErrorCode()==2291){
			System.out.println("Customer Does Not Exists Create New Customer");
		}
		if(e.getErrorCode()==20002){
		System.out.println("current quantity on hand a new order need to be placed");
		}
		
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		try {
			
			con.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		}
	}
	
}
/**
 * Method that will calculate total price of the product.
 * @param pid
 * @param qty
 * @return Total price
 */
public double getTotalPrice(int pid,int qty){
try {
	con=DataBaseConnection.getConnection();
	double discount_rate=0;
	double original_price=0;
	statement="select p1.disc_rate,p2.orig_price from product_discount2 p1,products2 p2" +
			" where p1.disc_category = p2.disc_category and p2.pid = "+pid;
	stmt = con.prepareStatement(statement);
	rs = stmt.executeQuery();
	while(rs.next()){
	discount_rate=rs.getDouble(1);
	original_price=rs.getDouble(2);
	}
	totalPrice=qty*(original_price*(1-discount_rate));
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
return totalPrice;
}
}
