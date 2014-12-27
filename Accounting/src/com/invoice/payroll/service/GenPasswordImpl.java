package com.invoice.payroll.service;

import java.util.Random;

public class GenPasswordImpl implements GenPassword
{

	@Override
	public String getPasword(String emId) {
		char ch=(char)rndChar();
	    char ch1=(char)rndChar();
	    char ch2=(char)rndChar();
	    char ch3=(char)rndChar();
	    int i=rndChar();
	    String genPass = ch+(int)rndChar()+ch1+""+ch2+(int)rndChar()+(char)rndChar()+ch3+(char)rndChar()+i;
	    return genPass;
	}

	private char rndChar() {
		Random r = new Random();
		char c = (char)(r.nextInt(26) + 'a');
		return c;
	}

	@Override
	public String sendLoginDetails(String uName, String pass) {
		// TODO Auto-generated method stub
		return null;
	}

}
