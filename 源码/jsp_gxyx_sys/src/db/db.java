package db;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class db
{
	private String dbDriver = "com.mysql.cj.jdbc.Driver";

	private String sConnStr = "jdbc:mysql://www.icodedock.com:3306/gxyx_sys?useSSL=false&serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf-8";
	public Connection connect = null;
	public ResultSet rs = null;
	public String username = "gxyx_sys";
	public String password = "gxyx_sys";

	public db() {
		try {
			Class.forName(this.dbDriver).newInstance();

			this.connect = DriverManager.getConnection(this.sConnStr, username, password);
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			System.out.println("12121");
		}
	}

	public ResultSet executeQuery(String sql)
	{
		try {
			this.connect = DriverManager.getConnection(this.sConnStr, username, password);
			Statement stmt = this.connect.createStatement();
			this.rs = stmt.executeQuery(sql);
		}
		catch (SQLException ex) {
			System.err.println(ex.getMessage());
		}

		return this.rs;
	}

	public void executeUpdate(String sql)
	{
		Statement stmt = null;
		this.rs = null;
		try {
			this.connect = DriverManager.getConnection(this.sConnStr, username, password);
			stmt = this.connect.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			this.connect.close();
		}
		catch (SQLException ex)
		{
			System.err.println(ex.getMessage());
		}
	}
}