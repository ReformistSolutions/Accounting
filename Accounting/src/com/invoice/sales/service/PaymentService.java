package com.invoice.sales.service;

import java.util.List;

import com.invoice.sales.beans.Payment;

public interface PaymentService {
	
	public List<Payment> show();
	public int save(Payment payment);

}
