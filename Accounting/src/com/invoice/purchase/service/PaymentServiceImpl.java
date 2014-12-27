package com.invoice.purchase.service;

import java.util.List;

import com.invoice.purchase.beans.ApplyPayment;
import com.invoice.purchase.dao.PaymentDao;
import com.invoice.purchase.dao.PaymentDaoImpl;

public class PaymentServiceImpl implements PaymentService{

	private PaymentDao PD;
	@Override
	public List<ApplyPayment> showPaymentService() {
		PD = new PaymentDaoImpl();
		return PD.showPaymentDao();
	}

}
