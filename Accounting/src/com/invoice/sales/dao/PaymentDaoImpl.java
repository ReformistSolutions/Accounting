package com.invoice.sales.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import com.invoice.sales.beans.Payment;

@Component(value="paymentDao")
public class PaymentDaoImpl implements PaymentDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	@Override
	public List<Payment> show() {
		
		String sql="select * from sales_invoice_payment";		
		final List<Payment> paymentList=getJdbcTemplate().query(sql, new RowMapper<Payment>() {
		private List<Payment> paymentsList=new ArrayList<Payment>();
		public Payment mapRow(ResultSet rs,int rowNo)throws SQLException
		{
			Payment payment=new Payment();
			payment.setTxtPayId(rs.getString("payment_Id"));
			payment.setTxtInvId(rs.getString("sales_Invoice_Id"));
			payment.setTxtDate(rs.getString("payment_Date"));
			payment.setTxtInvAmt(rs.getFloat("invoice_Amount"));
			payment.setTxtBal(rs.getFloat("balance"));
			paymentsList.add(payment);
			return payment;
		}	
	});		
		return paymentList; 
	}

	@Override
	public int save(Payment payment) {
		
		 String sql="insert into sales_Invoice_Payment value('"+payment.getTxtPayId()+"','"+payment.getTxtInvId()+"','"+payment.getTxtDate()+"','"+payment.getSelMethod()+"','"+payment.getTxtAmt()+"','"+payment.getTxtInvAmt()+"','"+payment.getTxtPaidAmt()+"','"+payment.getTxtBal()+"')";
		 int i=jdbcTemplate.update(sql); 
		 if(i>=1)
	       {
			return 1;
	      }
	       else
	       {
	    	return 0;
	       }
	}

}
