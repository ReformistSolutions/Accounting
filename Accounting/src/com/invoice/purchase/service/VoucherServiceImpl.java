package com.invoice.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.dao.VoucherDao;

@Component(value="voucherService")
public class VoucherServiceImpl implements VoucherService{

	VoucherDao voucherDoa;
	
	public VoucherDao getVoucherDoa() {
		return voucherDoa;
	}
	@Autowired
	public void setVoucherDoa(VoucherDao voucherDoa) {
		this.voucherDoa = voucherDoa;
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveVoucher(PurchaseVoucher purchaseVoucher) {
		
		int i = voucherDoa.saveVoucher(purchaseVoucher);
		return i;
	}
	@Override
	public List<PurchaseVoucher> showVoucher() {
		
		return voucherDoa.showVoucher();
	}
	@Override
	public List<PurchaseVoucher> viewEnquiry(String voucherNo) {

		return voucherDoa.viewVoucher(voucherNo); 
	}
	@Override
	public List<NewAccount> showAccountNo() {

		return voucherDoa.showAccountNo();
	}
	@Override
	public PurchaseVoucher autoId() {
		
		return voucherDoa.autoId();
	}
	@Override
	public int updateVoucher(PurchaseVoucher purchaseVoucher) {
				
		return voucherDoa.updateVoucher(purchaseVoucher); 
	}
	@Override
	public List<Purchases> showPurchaseId() {
		
		return voucherDoa.showPurchaseId();
	}
	@Override
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {

		return voucherDoa.getInfo(companyDetails);
	}
	@Override
	public int delete(String voucherId,float amt) {

		return voucherDoa.delete(voucherId,amt);
	}
	@Override
	public List<Vender> retrriveVenderInfo(String vendId, String id) {
		
		return voucherDoa.retrriveVenderInfo(vendId, id);
	}
	@Override
	public List<NewAccount> retriveAccount(String paymode) 
	{
		return voucherDoa.retriveAccount(paymode);
	}
	@Override
	public String avlBalance(String orderId) 
	{
		return voucherDoa.avlBalance(orderId);
	}
}
