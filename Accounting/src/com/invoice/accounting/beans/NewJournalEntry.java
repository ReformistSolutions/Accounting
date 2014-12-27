package com.invoice.accounting.beans;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;


public class NewJournalEntry {

	private String txtVchrNo;
	
	private String txtDate;

	@SuppressWarnings("unchecked")
	private List<NewJournalEnterydts> newjournalentrydts = LazyList.decorate(new ArrayList<NewJournalEnterydts>(),FactoryUtils.instantiateFactory(NewJournalEnterydts.class));
	
	private String txtDescription;
	
	private String txtTag;

	public String getTxtVchrNo() {
		return txtVchrNo;
	}

	public void setTxtVchrNo(String txtVchrNo) {
		this.txtVchrNo = txtVchrNo;
	}

	public String getTxtDate() {
		return txtDate;
	}

	public void setTxtDate(String txtDate) {
		this.txtDate = txtDate;
	}

	public List<NewJournalEnterydts> getNewjournalentrydts() {
		return newjournalentrydts;
	}

	public void setNewjournalentrydts(List<NewJournalEnterydts> newjournalentrydts) {
		this.newjournalentrydts = newjournalentrydts;
	}

	public String getTxtDescription() {
		return txtDescription;
	}

	public void setTxtDescription(String txtDescription) {
		this.txtDescription = txtDescription;
	}

	public String getTxtTag() {
		return txtTag;
	}

	public void setTxtTag(String txtTag) {
		this.txtTag = txtTag;
	}

	
}