package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnection {
	
	public static Connection getConnection() {
		try {
			//  MySql JDBC 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver"); 
			// Connection 객체 생성
			// Mysql 8.0 이후 부터는 allowPublicKeyRetrieval=true& 설정 추가
			// -> local DB open 하지않아도 connection 허용
			 String url="jdbc:mysql://localhost:3306/mydb?allowPublicKeyRetrieval=true&characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false"; // DB에 접근?
	         System.out.println("===> JDBC Connection 성공  <===");
	         return DriverManager.getConnection(url,"root","mysql"); 
		} catch (Exception e) {
			System.out.println("** DB Connection 실패 => "+e.toString());
			return null;
		}
	}//getConnection
	
	// ** Close 주의사항
	// => 생성과 반대 순서로 close
	public static void dbClose(ResultSet rs, PreparedStatement pst, Statement st, Connection cn) {
		try {
			if (rs != null) rs.close();
			if (pst != null) pst.close();
			if (st != null) st.close();
			if (cn != null) cn.close();
		} catch (Exception e) {
			System.out.println("** DB Close 실패 => "+e.toString());
		}
		
		
	}//dbClose
	
	
	
} //class
