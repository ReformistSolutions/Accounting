package com.invoice.purchase.dao;

import java.util.List;

import com.invoice.accounting.beans.NewAccount;
import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.invoice.purchase.beans.Purchases;
import com.invoice.purchase.beans.Vender;

public interface VoucherDao {

	public int saveVoucher(PurchaseVoucher purchaseVoucher);
	public List<PurchaseVoucher> showVoucher();
	public List<PurchaseVoucher> viewVoucher(String voucherNo);
	public List<NewAccount> showAccountNo();
	public PurchaseVoucher autoId();
	public int updateVoucher(PurchaseVoucher purchaseVoucher);
	public List<Purchases> showPurchaseId();
	public List<CompanyDetails> getInfo(CompanyDetails companyDetails);
	public int delete(String voucherId,float amt);
	public List<Vender> retrriveVenderInfo(String vendId,String id);
	public List<NewAccount> retriveAccount(String paymode);
	public String avlBalance(String orderId);
}
