package com.invoice.payroll.dao;

import java.sql.DriverManager;
import java.sql.SQLException;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseConnetction 
{
	private Connection con=null;
	private Statement st;
	private ResultSet rs;
	
	private void OpenConeection()
	{
		try {
				Class.forName("com.mysql.jdbc.Driver");
				//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice", "root", "scott");
				//st=con.createStatement();
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/invoice", "root", "scott");
				st=con.createStatement();
			} catch (Exception e)
			{
			
				e.printStackTrace();
			}
	   
		
	}
	
	public int updateQuery(String sql)
	{
		int i=0;
		try {
			OpenConeection();
			i=st.executeUpdate(sql);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
			return i;
		
		
	}
		
	public ResultSet queryRs(String sql)
	{
		try {
			OpenConeection();
			rs=st.executeQuery(sql);
			System.out.print("in rs="+rs);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return rs;
	}
}
