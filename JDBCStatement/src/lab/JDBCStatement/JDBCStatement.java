package lab.JDBCStatement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCStatement {
	private static String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String url="jdbc:sqlserver://localhost;Database=Java;";
	private static String user="sa";
	private static String pass="123";

	public static void main(String[] args) {
		demo1();//Insert into database
		//demo2();//Select from database
	}

	private static void demo2() {
		try {
			//1. Download driver
			Class.forName(driver);
			//2. Open connection to database
			Connection conn = DriverManager.getConnection(url,user,pass);
			//3. Execute SQL Query
			Statement stmt = conn.createStatement();
			String sql="SELECT * FROM Courses";
			ResultSet resultSet = stmt.executeQuery(sql);
			//3.1 Read data from resultSet
			while(resultSet.next()){
				String name = resultSet.getString("Name");
				double schoolfee = resultSet.getDouble("SchoolFee");
				int learnercount = resultSet.getInt("LearnerCount");
				boolean status = resultSet.getBoolean("Status");
				Date date = resultSet.getDate("StartDate");
				
				System.out.println("> Name: "+name);
				System.out.println("> SchoolFee: "+schoolfee);
				System.out.println("> LearnerCount: "+learnercount);
				System.out.println("> Status: "+status);
				System.out.println("> Date: "+date);
				System.out.println();
			}
			//4. Close connection
			conn.close();
			System.out.println("Select data successfully!");
		} catch (ClassNotFoundException e) {
			System.out.println("Select failed!");
		} catch (SQLException e) {
			System.out.println("Select failed!");
		}
	}

	private static void demo1() {
		try {
			//1. Download driver
			Class.forName(driver);
			//2. Open connection to database
			Connection conn = DriverManager.getConnection(url,user,pass);
			//3. Execute SQL Query
			Statement stmt = conn.createStatement();
			String sql="INSERT INTO Categories(Id,Name) VALUES('ABC',N'Tên Loại')";
			stmt.executeUpdate(sql);
			//4. Close connection
			conn.close();
			System.out.println("Insert successfully!");
		} catch (ClassNotFoundException e) {
			System.out.println("Insert failed!");
		} catch (SQLException e) {
			System.out.println("Insert failed!");
		}
	}

}
