package config;

import java.sql.*;

public class DB {
	
	public static Connection dbConn() {
		String dbDrv ="oracle.jdbc.driver.OracleDriver";
		String dbUrl ="jdbc:oracle:thin:@localhost:1521:xe";
		String dbUsr ="example01";
		String dbPwd ="1234";
		
		Connection conn = null;
		try {
			Class.forName(dbDrv);
		}catch(Exception e) {
			System.out.println("-- Error01 --");
		}
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbUsr, dbPwd);
		}catch(Exception e) {
			System.out.println("-- Error02 --");
		}
		return conn;
	}
	
	public static void DBConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) {rs.close();}
		}catch(Exception e) {
			System.out.println("-- Error03 --");
		}
		try {
			if(pstmt != null) {pstmt.close();}
		}catch(Exception e) {
			System.out.println("-- Error04 --");
		}
		try {
			if(conn != null) {conn.close();}
		}catch(Exception e) {
			System.out.println("-- Error05 --");
		}
	}
	
}
