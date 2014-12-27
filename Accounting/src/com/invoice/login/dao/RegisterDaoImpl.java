package com.invoice.login.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.invoice.login.beans.NewRegistration;

@Component(value="logDao")
public class RegisterDaoImpl implements RegisterDao{

	private String sql;
	private JdbcTemplate jdbcTemplate;	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public int saveDao(NewRegistration login) {

		int i=0;
		String status="Active";
		sql="insert into registration_details (fName,mName,eMail,contactNo,userName,password,gender,status) values ('"+login.getTxtFname()+"','"+login.getTxtLName()+"','"+login.getTxtEmail()+"','"+login.getTxtContactNo()+"','"+login.getTxtUname()+"','"+login.getTxtPassword()+"','"+login.getUserSex()+"','"+status+"')";		
		i= jdbcTemplate.update(sql);
		System.out.println("First Name" +login.getTxtFname());
		System.out.println("Last Name "+login.getTxtLName());
		System.out.println("Email "+login.getTxtEmail());
		System.out.println("contact no "+login.getTxtContactNo());
		System.out.println("user name "+login.getTxtUname());
		System.out.println("password "+login.getTxtPassword());
		System.out.println("gender "+login.getUserSex());
		System.out.println("status "+status);
		if(i>0)
		 {		
		return 1;
		 }
		 else
		 {
			 return 0;
		 }
	}

}
