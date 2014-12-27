package com.invoice.sales.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import com.invoice.sales.beans.Payment;
import com.invoice.sales.dao.PaymentDao;

@Component(value="paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	private PaymentDao paymentDao;
	private JdbcTemplate jdbcTemplate;
	
	public PaymentDao getPaymentDao() {
		return paymentDao;
	}
	@Autowired
	public void setPaymentDao(PaymentDao paymentDao) {
		this.paymentDao = paymentDao;
	}
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	@Override
	public List<Payment> show() {
		List<Payment> paymentList=new ArrayList<Payment>();
		paymentList=paymentDao.show();
		return paymentList;
	}

	@Override
	public int save(Payment payment) {
		int i=paymentDao.save(payment);
		return i;
	}

}
