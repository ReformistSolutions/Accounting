package com.invoice.banking.service;


import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;


import com.invoice.banking.beans.Withdraw;
import com.invoice.company.beans.CompanyDetails;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;

import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.Element;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


public class WithdrawPdf extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		Withdraw withdraw=(Withdraw) model.get("withdraws");
		
        CompanyDetails cid=(CompanyDetails) model.get("compInfo");
		
		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] {2.0f, 2.0f, 6.0f,2.0f, 2.0f});
		tableHD.setSpacingBefore(10);
			
			Font font1 = FontFactory.getFont("Times-Roman",16,Font.UNDERLINE);
			font1.setColor(BaseColor.BLACK);
			
			PdfPCell cell1h = new PdfPCell();
			cell1h.setBorder(Rectangle.NO_BORDER);
			tableHD.addCell(cell1h);
			PdfPCell cell2 = new PdfPCell();
			cell2.setBorder(Rectangle.NO_BORDER);
			tableHD.addCell(cell2);
			
			PdfPCell cell3 = new PdfPCell();
			cell3.setBackgroundColor(BaseColor.WHITE);
			cell3.setPhrase(new Phrase("WITHDRAW RECEIPT",font1));			
			cell3.setHorizontalAlignment(Element.ALIGN_CENTER);				
			cell3.setBorder(Rectangle.NO_BORDER);
			tableHD.addCell(cell3);
			
			PdfPCell cell4 = new PdfPCell();
			cell4.setBorder(Rectangle.NO_BORDER);
			tableHD.addCell(cell4);
			PdfPCell cell5 = new PdfPCell();
			cell5.setBorder(Rectangle.NO_BORDER);
			tableHD.addCell(cell5);
			
			doc.add(tableHD);
		
		 Paragraph p = new Paragraph("\n"+cid.getCompName(), new
      		 Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(38,114,236)) );
      
		 Paragraph p2 = new Paragraph(cid.getCompDesc()+"\n\n"+cid.getCompAddress()+"\n\nContact No :  "+cid.getContactNo()+" "+"Email :  "+cid.getEmail()+"\n"+" ", new
     		 Font(FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0, 0, 0)) );
      

	        	PdfPTable tblHeaderIn = new PdfPTable(1);		    
	        	tblHeaderIn.setWidthPercentage(100.0f);
		        PdfPCell cellH1In = new PdfPCell(p);
		        cellH1In.setHorizontalAlignment(Element.ALIGN_LEFT);
		        cellH1In.setBorder(Rectangle.NO_BORDER);
		        PdfPCell cellH2In = new PdfPCell(p2);
		        cellH2In.setHorizontalAlignment(Element.ALIGN_LEFT);
		        cellH2In.setBorder(Rectangle.NO_BORDER);
		        tblHeaderIn.addCell(cellH1In);
		        tblHeaderIn.addCell(cellH2In);
		        
		        doc.add(tblHeaderIn);
		        

		    PdfPTable tblHeader = new PdfPTable(4);
			tblHeader.setWidthPercentage(100.0f);
			    
			PdfPCell cellH1 = new PdfPCell();
	        cellH1.setBorder(Rectangle.BOTTOM);	       
	        PdfPCell cellH2 = new PdfPCell();
	        cellH2.setBorder(Rectangle.BOTTOM);
	      
	        PdfPCell cellH3=new PdfPCell();
	        cellH3.setBorder(Rectangle.BOTTOM);
	        PdfPCell cellH4=new PdfPCell();
	        cellH4.setBorder(Rectangle.BOTTOM);
	       
	        
	       tblHeader.addCell(cellH1);
	       tblHeader.addCell(cellH2);
	       tblHeader.addCell(cellH3);
	       tblHeader.addCell(cellH4);
	        
	doc.add(tblHeader); 
	PdfPCell cell = new PdfPCell();
	cell.setBackgroundColor(BaseColor.WHITE);
	cell.setPadding(5);
	
	PdfPTable tableBlf = new PdfPTable(1);
	tableBlf.setWidthPercentage(70.0f);
	tableBlf.setWidths(new float[] {2.0f});
	tableBlf.setSpacingBefore(10);

	cell.setPhrase(new Phrase());
	cell.setBorder(Rectangle.NO_BORDER);
	tableBlf.addCell(cell);
	
	doc.add(tableBlf);

	
	Font font0 = FontFactory.getFont("Times-Roman");
	font0.setColor(BaseColor.BLACK);	
		
		PdfPTable tableFR = new PdfPTable(4);
		tableFR.setWidthPercentage(100.0f);
		tableFR.setWidths(new float[] {3.5f, 2.0f,3.0f, 2.0f});
		tableFR.setSpacingBefore(10);
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.BLACK);
		
		PdfPCell cell0 = new PdfPCell();
		cell0.setBackgroundColor(BaseColor.WHITE);
		cell0.setPadding(5);
		
		
		cell.setPhrase(new Phrase("Voucher Number:-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithVchrNo(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableFR.addCell(cell);
		
		
		doc.add(tableFR);
		
		PdfPTable tableSR = new PdfPTable(4);
		tableSR.setWidthPercentage(100.0f);
		tableSR.setWidths(new float[] {4.5f, 3.9f,3.0f, 2.0f});
		tableSR.setSpacingBefore(10);
		
		Font fontSR = FontFactory.getFont(FontFactory.HELVETICA);
		fontSR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Transaction Date:-", fontSR));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithdate(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableSR.addCell(cell);	
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tableSR.addCell(cell);
		
		
		doc.add(tableSR);
		
		
		PdfPTable tablePN = new PdfPTable(4);
		tablePN.setWidthPercentage(100.0f);
		tablePN.setWidths(new float[] {4.5f, 3.9f,3.0f, 2.0f});
		tablePN.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("From Account:-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithFrmAccnt(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN.addCell(cell);
		
          doc.add(tablePN);
		
		
		PdfPTable tablePN1 = new PdfPTable(4);
		tablePN1.setWidthPercentage(100.0f);
		tablePN1.setWidths(new float[] {4.5f, 3.9f,3.0f, 2.0f});
		tablePN1.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("To Account:-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN1.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithToAccnt(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN1.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN1.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN1.addCell(cell);
		
		
		doc.add(tablePN1);
		
		PdfPTable tablePN2 = new PdfPTable(4);
		tablePN2.setWidthPercentage(100.0f);
		tablePN2.setWidths(new float[] {4.5f, 3.9f,3.0f, 2.0f});
		tablePN2.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Transaction Type:-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN2.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithTransType(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN2.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN2.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN2.addCell(cell);
		
		
		
        doc.add(tablePN2);
		
		PdfPTable tablePN3 = new PdfPTable(4);
		tablePN3.setWidthPercentage(100.0f);
		tablePN3.setWidths(new float[] {3.5f, 2.0f,3.0f, 2.0f});
		tablePN3.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Amount :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN3.addCell(cell);
		
		cell.setPhrase(new Phrase(Convert.toString(withdraw.getTxtwithAmount())));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN3.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN3.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN3.addCell(cell);
		
		
        doc.add(tablePN3);
		
		PdfPTable tablePN4 = new PdfPTable(4);
		tablePN4.setWidthPercentage(100.0f);
		tablePN4.setWidths(new float[] {3.5f, 2.0f,3.0f, 2.0f});
		tablePN4.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Description :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN4.addCell(cell);
		
		cell.setPhrase(new Phrase(withdraw.getTxtwithDesc(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN4.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN4.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(40f);
		tablePN4.addCell(cell);
		
		doc.add(tablePN4);
		
	}
}