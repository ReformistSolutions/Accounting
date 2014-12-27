package com.invoice.banking.beans;




public class ComposeMail {
	
	private String mailTo;
	private String mailCC;
	private String mailBCC;
	private String subject;
	private String body;
	private String mailId;
	private String custId;
	private String custName;
	private String attachment;
	private String id;
	
	public String getMailTo() {
		return mailTo;
	}
	public void setMailTo(String mailTo) {
		this.mailTo = mailTo;
	}
	public String getMailCC() {
		return mailCC;
	}
	public void setMailCC(String mailCC) {
		this.mailCC = mailCC;
	}
	public String getMailBCC() {
		return mailBCC;
	}
	public void setMailBCC(String mailBCC) {
		this.mailBCC = mailBCC;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	

}
