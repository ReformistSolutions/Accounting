package com.invoice.payroll.dao;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.invoice.company.beans.CompanyDetails;


@Component(value="salaryDao")
public class SalaryDaoImpl  implements SalaryDao
{

	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	
        @Autowired
		public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	private JdbcTemplate jdbcTemplate;

	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
		   
		    String sql="select comp_Name,comp_Address,comp_Contact,comp_Mail,comp_Website,comp_desc from comp_details";		
			final List<CompanyDetails> comList=getJdbcTemplate().query(sql, new RowMapper<CompanyDetails>() {
			private List<CompanyDetails> companyList=new ArrayList<CompanyDetails>();
			@Override
			public CompanyDetails mapRow(java.sql.ResultSet rs, int arg1)
					throws SQLException {
				CompanyDetails enq=new CompanyDetails();
				enq.setCompName(rs.getString("comp_Name"));
				enq.setCompDesc(rs.getString("comp_desc"));
				enq.setCompAddress(rs.getString("comp_Address"));
				enq.setContactNo(rs.getString("comp_Contact"));
				enq.setEmail(rs.getString("comp_Mail"));
				enq.setWebsite(rs.getString("comp_Website"));
				
					companyList.add(enq);				
				return enq;
			}
		
		
		});		
			return comList;
	}

	
	

}
