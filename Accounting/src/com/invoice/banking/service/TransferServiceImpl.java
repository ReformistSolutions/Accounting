package com.invoice.banking.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.invoice.accounting.beans.JournalHeader;
import com.invoice.banking.beans.Transfer;

import com.invoice.banking.dao.TransferDao;
import com.invoice.company.beans.CompanyDetails;


@Component(value="transferService")
public class TransferServiceImpl implements TransferService {
	
	TransferDao transferDao;

	public TransferDao getTransferDao() {
		return transferDao;
	}
@Autowired
	public void setTransferDao(TransferDao transferDao) {
		this.transferDao = transferDao;
	}
@Override
public int save(Transfer transfer,JournalHeader journalHeader) {
	
		int i=transferDao.save(transfer,journalHeader);
		if(i>=1)
		{
		return 1;
		}
		else
		{
			return 0;
		
		}
	}
@Override
public List<Transfer> show() {
	List<Transfer> transList=new ArrayList<Transfer>();
	transList= transferDao.show();
	return transList;
	
}
@Override
public List<Transfer> editTransfer(String voucherNo) {
	return transferDao.editTransfer(voucherNo);
}
@Override
public int updateTransfer(Transfer transfer) {
	
	return transferDao.updateTransfer(transfer);
}
@Override
public Transfer autoId() {
	
	return transferDao.autoId();
}
@Override
public int delete(String voucherNo) {
	
	return transferDao.delete(voucherNo);
}
@Override
public List<CompanyDetails> getInfo(CompanyDetails companyDetails) {
	
	return transferDao.getInfo(companyDetails);
}

}


