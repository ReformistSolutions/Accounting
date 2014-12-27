package com.invoice.sales.dao;

import java.util.List;

import com.invoice.sales.beans.Payment;

public interface PaymentDao {
	
	public List<Payment> show();
	public int save(Payment payment);
	
}
