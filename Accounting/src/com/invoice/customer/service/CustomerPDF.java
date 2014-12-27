package com.invoice.customer.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.customer.beans.Customer;
import com.invoice.customer.beans.CustomerDetails;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class CustomerPDF extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		Customer addCustomer=(Customer) model.get("viewCustomerDetails");
		//doc.add(new Paragraph("PDF OF SALES ENQUIRY"));
		
		
		//doc=new Document(PageSize.A4,10.0F, 20.0F,50.0F, 50.0F);
		doc.open();
		
		doc.addHeader("Reformist Solutions", "Customer");
		doc.addAuthor("ROSHNI");
		doc.addTitle("CUSTOMER PDF");

		doc.setMarginMirroring(true);
		   

		PdfPTable tblHeader = new PdfPTable(2);
		        PdfPTable tblHeaderIn = new PdfPTable(1);
		      
		        Paragraph p = new Paragraph("Reformist", new
		        	  Font(FontFamily.HELVETICA, 18, Font.BOLDITALIC, new BaseColor(0, 0, 255))) ;
		        
		        Paragraph p2 = new Paragraph("Contact No:-02065008620\nEmail:-info@reformist.in", new
		       	  Font(FontFamily.HELVETICA, 8, Font.NORMAL, new BaseColor(0, 0, 0))) ;
		        
		        Paragraph pAdd = new Paragraph("\n\n19/1, Sonigara Homes,Ravet Road, Dange Chouk. Pune-411033\n\n", new
		          	  Font(FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0, 0, 0))) ;
		        
		        
		        PdfPCell cellH1 = new PdfPCell(tblHeaderIn);
		        PdfPCell cellH1In = new PdfPCell(p);
		        cellH1In.setBorder(Rectangle.NO_BORDER);
		        PdfPCell cellH2In = new PdfPCell(p2);
		        cellH2In.setBorder(Rectangle.NO_BORDER);
		        tblHeaderIn.addCell(cellH1In);
		        tblHeaderIn.addCell(cellH2In);
		        
		        cellH1.setBorder(Rectangle.BOTTOM);
		       
		        PdfPCell cellH2 = new PdfPCell(pAdd);
		        cellH2.setBorder(Rectangle.BOTTOM);
		        //cellH2.setRowspan(2);
		     //   cellH1.add(tblHeaderIn);
		        tblHeader.addCell(cellH1);
		       tblHeader.addCell(cellH2);
		        
		    doc.add(tblHeader);

		    PdfPTable tableFR = new PdfPTable(4);
		    tableFR.setWidthPercentage(80.0f);
		    tableFR.setWidths(new float[] {3.5f, 2.0f,3.0f, 2.0f});
		    tableFR.setSpacingBefore(10);


		    // define font for table header row
		    Font font = FontFactory.getFont(FontFactory.HELVETICA);
		    font.setColor(BaseColor.BLACK);

		    // define table header cell
		    PdfPCell cell = new PdfPCell();
		    cell.setBackgroundColor(BaseColor.WHITE);
		    cell.setPadding(5);

		
		// write table header 
		cell.setPhrase(new Phrase("Customer ID :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		//PdfPTable tableF;
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getTxtCustID(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase("Customer Name :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase(addCustomer.getTxtCustName(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Region :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getSlctRegion(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Date :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getTxtDate(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Billing address :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getBillingAddress(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Billing city :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getBillingcity(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Billing State :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getBillingstate(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Country :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getBillingcountry(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Pincode :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getBillingppincode(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Shiping address :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getShippingAddrLine(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Shiping city :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getShippingstate(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Shiping Country :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getShippingcountry(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase("Pincode :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getShippingpincode(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		doc.add(tableFR);
		
		PdfPTable tableSR = new PdfPTable(4);
		tableSR.setWidthPercentage(100.0f);
		tableSR.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tableSR.setSpacingBefore(10);
		
		
		// define font for table header row
		/*Font fontSR = FontFactory.getFont(FontFactory.HELVETICA);
		fontSR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Date :-", fontSR));
		cell.setBorder(Rectangle.NO_BORDER);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase(addCustomer.getTxtDate(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tableSR.addCell(cell);	
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tableSR.addCell(cell);
		
		
		doc.add(tableSR);*/
		
		/*table.addCell(saleEnquiry.getTxtCutName());
		table.addCell(saleEnquiry.getTxtDate());
		table.addCell(saleEnquiry.getTxtPubNotes());*/
		
		
		
		
		PdfPTable tableDetails = new PdfPTable(5);
		tableDetails.setWidthPercentage(70.0f);
		tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f,2.0f});
		tableDetails.setSpacingBefore(10);
		
		// define font for table header row
		Font font1 = FontFactory.getFont(FontFactory.HELVETICA);
		font1.setColor(BaseColor.BLACK);
		
		// define table header cell
		PdfPCell cell1 = new PdfPCell();
		cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell1.setPadding(5);
		
		// write table header 
		cell1.setPhrase(new Phrase("Sr No", font1));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Person Name", font1));
		tableDetails.addCell(cell1);

		cell1.setPhrase(new Phrase("Contact No", font1));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Email", font1));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Designation", font1));
		tableDetails.addCell(cell1);
		
		List<CustomerDetails> customerDetails=new ArrayList<CustomerDetails>();		
		customerDetails.addAll(addCustomer.getCustomerDetails());
		for(CustomerDetails customerList : customerDetails)
		{
			tableDetails.addCell(Convert.toString(customerList.getTxtSrNo()));
			tableDetails.addCell(customerList.getTxtName());
			tableDetails.addCell(customerList.getTxtCon());
			tableDetails.addCell(customerList.getTxtMail());
			tableDetails.addCell(customerList.getTxtDes());
		}
		
	
		
		doc.add(tableDetails);
		
	

		
		
	
		
	}
	
	

}
