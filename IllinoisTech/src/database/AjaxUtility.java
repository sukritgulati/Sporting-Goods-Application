package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AjaxUtility implements DatabaseConstants{
	
	private Connection conn = null;
	private Statement stmt = null;
	private String sqlQuery = "";

	public AjaxUtility() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public StringBuffer readData(String searchId) {
		
		StringBuffer sb = new StringBuffer();
		try{
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			sqlQuery = "select pid, productName from products where productName like '" + searchId + "%'";
			ResultSet rs = stmt.executeQuery(sqlQuery);
			//Fetch product data from result set.
			while(rs.next()){
				sb.append("<product>");
				sb.append("<id>" + rs.getString("pid") + "</id>");
				sb.append("<productName>" + rs.getString("productName") + "</productName>");
				sb.append("</product>");
			}

			//Close db connection.
			stmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}		
		return sb;
	}

}
