package com.invoice.accounting.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;




public class Createnewexpense {
	
	private String expid;
	
	private String paidfrom;
	
	private String expdate;

	private float txttotal;

	private String file;

	private String narration;
	
	private String paidfrmaccno;
	
	
	
	

	

	public String getPaidfrmaccno() {
		return paidfrmaccno;
	}

	public void setPaidfrmaccno(String paidfrmaccno) {
		this.paidfrmaccno = paidfrmaccno;
	}

	@SuppressWarnings("unchecked")
	private List<CreatenewexpenseDetails> expenseDetailsList = LazyList.decorate(new ArrayList<CreatenewexpenseDetails>(),FactoryUtils.instantiateFactory(CreatenewexpenseDetails.class));

	
	public String getExpid() {
		return expid;
	}

	public void setExpid(String expid) {
		this.expid = expid;
	}

	public String getPaidfrom() {
		return paidfrom;
	}

	public void setPaidfrom(String paidfrom) {
		this.paidfrom = paidfrom;
	}

	

	
	public String getExpdate() {
		return expdate;
	}

	public void setExpdate(String expdate) {
		this.expdate = expdate;
	}

	public float getTxttotal() {
		return txttotal;
	}

	public void setTxttotal(float txttotal) {
		this.txttotal = txttotal;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public String getNarration() {
		return narration;
	}

	public void setNarration(String narration) {
		this.narration = narration;
	}

	public List<CreatenewexpenseDetails> getExpenseDetailsList() {
		return expenseDetailsList;
	}

	public void setExpenseDetailsList(
			List<CreatenewexpenseDetails> expenseDetailsList) {
		this.expenseDetailsList = expenseDetailsList;
	}

	

}