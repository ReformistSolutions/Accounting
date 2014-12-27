package com.invoice.purchase.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.invoice.purchase.beans.Vender;
import com.invoice.purchase.dao.venderDao;

@Component("pVenderService")
public class venderServiceImpl implements venderService{

	venderDao venderDao;
	
	public venderDao getVenderDao() {
		return venderDao;
	}
	@Autowired
	public void setVenderDao(venderDao venderDao) {
		this.venderDao = venderDao;
	}
	@Override
	public List<Vender> showCustomer() {
		
		return venderDao.shwoDao();
	}
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int saveVender(Vender vender) {
				
		return venderDao.saveVender(vender);
	}
	@Override
	public Vender auto() {
		
		return venderDao.auto();
	}
	@Override
	public List<Vender> viewVender(String venderId) {
		
		return venderDao.viewVender(venderId); 
	}
	@Override
	public int updateVender(Vender vender) {
		
		return venderDao.updateVender(vender);
	}
	@Override
	public int delete(String venderId) {

		return venderDao.delete(venderId);
	}
	@Override
	public int activeDelete(String venderId) 
	{
		return venderDao.activeDelete(venderId);
	}
}
