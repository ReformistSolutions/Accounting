package com.invoice.sales.dao;

import java.util.List;
import com.invoice.customer.beans.Customer;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.Invoice;

public interface DeliveryChallanDao {
	
	public int save(DeliveryChallan deliveryChallan);
	public List<DeliveryChallan> show();
	public List<DeliveryChallan> editChallan(String challanId);
	public int updateChallan(DeliveryChallan deliveryChallan);
	public List<CreateNewProduct> retriveProductList();
	public List<Customer> retriveCustomerList();
	public List<Invoice> retriveInvList();
	public int deleteChallan(String challanId);
	public DeliveryChallan generateChId();
	public List<Customer> retriveCustInfo(String custId,String id);
}
