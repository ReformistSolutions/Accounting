package com.invoice.purchase.service;

import java.util.List;

import com.invoice.purchase.beans.Vender;



public interface venderService {

	public List<Vender> showCustomer();
	public int saveVender(Vender vender);
	public Vender auto();
	public List<Vender> viewVender(String venderId);
	public int updateVender(Vender vender);
	public int delete(String venderId);
	public int activeDelete(String venderId);
}
