package com.invoice.reports.service;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.service.AbstractPdfView;
import com.invoice.reports.beans.PaymentAdvice;
import com.invoice.reports.beans.PaymentAdviceDetails;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PaymentAdvicePDF extends AbstractPdfView {

	@Override
	public void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		final String path = System.getProperty("user.dir");  
		 PdfWriter.getInstance(doc, new FileOutputStream(path+"/Payment Advice.pdf"));
	        doc.open();	
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String month = new SimpleDateFormat("MMMMMMM").format(cal.getTime()); 

		CompanyDetails cid = (CompanyDetails) model.get("compInfo");
		PaymentAdvice payment = (PaymentAdvice) model.get("paymentAdvice");
		Object bankName = model.get("bankName");
		Object total = model.get("total");
		 
		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] { 2.0f, 2.0f, 5.0f, 2.0f, 2.0f });
		tableHD.setSpacingBefore(10);

		// define font for table header row
		Font font1 = FontFactory.getFont("Times-Roman", 16, Font.UNDERLINE);
		font1.setColor(BaseColor.BLACK);

		// define table header cell
		PdfPCell cell1h = new PdfPCell();
		cell1h.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell1h);
		PdfPCell cell2 = new PdfPCell();
		cell2.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell2);

		PdfPCell cell3 = new PdfPCell();
		cell3.setBackgroundColor(BaseColor.WHITE);
		// cell3.setPadding(5);
		cell3.setPhrase(new Phrase("PAYMENT ADVICE", font1));
		// cell3.setColspan(5);
		cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell3.setBorder(Rectangle.NO_BORDER);
		// cell3.setBorderWidthBottom(1);
		tableHD.addCell(cell3);

		PdfPCell cell4 = new PdfPCell();
		cell4.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell4);
		PdfPCell cell5 = new PdfPCell();
		cell5.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell5);

		doc.add(tableHD);

		Paragraph p = new Paragraph("\n" + cid.getCompName(), new Font(
				FontFamily.HELVETICA, 15, Font.BOLD,
				new BaseColor(38, 114, 236)));

		Paragraph p2 = new Paragraph(
				cid.getCompDesc()
						+ "\n\n"
						+ cid.getCompAddress()
						+ "\n\nContact No :  "
						+ cid.getContactNo()
						+ "                                                                                            "
						+ "Email :  " + cid.getEmail() + "\n" + " ", new Font(
						FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0,
								0, 0)));

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

		PdfPCell cellH3 = new PdfPCell();
		cellH3.setBorder(Rectangle.BOTTOM);
		PdfPCell cellH4 = new PdfPCell();
		cellH4.setBorder(Rectangle.BOTTOM);

		tblHeader.addCell(cellH1);
		tblHeader.addCell(cellH2);
		tblHeader.addCell(cellH3);
		tblHeader.addCell(cellH4);

		doc.add(tblHeader);

		doc.setMarginMirroring(true);
		PdfPCell cell = new PdfPCell();
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);

		
		
		Paragraph p3 = new Paragraph("\n\n\n" + "The Manager", new Font(
				FontFamily.TIMES_ROMAN, 11, Font.BOLD,BaseColor.BLACK));
			
		
		PdfPTable tblsal = new PdfPTable(1);
		tblsal.setWidthPercentage(100.0f);
		PdfPCell cellsal1 = new PdfPCell(p3);
		cellsal1.setHorizontalAlignment(Element.ALIGN_LEFT);
		cellsal1.setBorder(Rectangle.NO_BORDER);
		tblsal.addCell(cellsal1);
		
		doc.add(tblsal);
		
		Paragraph p4 = new Paragraph("\n"+"Dear Sir,"+"\n" + "\nPayment Advice From "+cid.getCompName()+" A/C From "+bankName+" for "+month+" "+year+"\n"+"\nPlease make the payroll transfer from above account to the below mentioned account numbers towards employee salary", new Font(
				FontFamily.TIMES_ROMAN, 11, Font.NORMAL,BaseColor.BLACK));
		
		PdfPTable tblsub = new PdfPTable(1);
		tblsub.setWidthPercentage(100.0f);
		PdfPCell cellsub = new PdfPCell(p4);
		cellsub.setHorizontalAlignment(Element.ALIGN_LEFT);
		cellsub.setBorder(Rectangle.NO_BORDER);
		tblsub.addCell(cellsub);

		doc.add(tblsub);
		
		PdfPTable tableBl2 = new PdfPTable(1);
		tableBl2.setWidthPercentage(70.0f);
		tableBl2.setWidths(new float[] {2.0f});
		tableBl2.setSpacingBefore(10);				
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(20);
		tableBl2.addCell(cell);
		
		doc.add(tableBl2);
		
		PdfPTable tableDetails = new PdfPTable(5);
		tableDetails.setWidthPercentage(100.0f);
		tableDetails.setWidths(new float[] {2.0f, 2.5f, 2.0f, 2.0f, 2.0f});		
		tableDetails.setSpacingBefore(10);
		
		Font fo = FontFactory.getFont("Times-Roman");
		font1.setColor(BaseColor.BLACK);
		
		PdfPCell cell1 = new PdfPCell();
		cell1.setPadding(5);
		
		cell1.setPhrase(new Phrase("Employee ID", fo));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Employee Name", fo));
		tableDetails.addCell(cell1);

		cell1.setPhrase(new Phrase("Account No.", fo));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Bank Name", fo));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Amount(INR)", fo));
		tableDetails.addCell(cell1);
		
		List<PaymentAdviceDetails> payDetails = new ArrayList<PaymentAdviceDetails>();
		payDetails.addAll(payment.getAdviceList());
		for(PaymentAdviceDetails adviceList : payDetails)
		{
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			PdfPCell cellid = new PdfPCell();
			cellid.setPhrase(new Phrase(adviceList.getEmp_Id(), font11));
			cellid.setPadding(5);
			tableDetails.addCell(cellid);
			
			PdfPCell cellit = new PdfPCell();
			cellit.setPhrase(new Phrase(adviceList.getF_Name()+" "+adviceList.getM_Name()+" "+adviceList.getlName(), font11));
			tableDetails.addCell(cellit);	
			
			PdfPCell celldes = new PdfPCell();
			celldes.setPhrase(new Phrase(adviceList.getAccNo(), font11));
			celldes.setHorizontalAlignment(Element.ALIGN_CENTER);
			tableDetails.addCell(celldes);
			
			PdfPCell cellunit = new PdfPCell();
			cellunit.setPhrase(new Phrase(adviceList.getBank_name(), font11));
			tableDetails.addCell(cellunit);
			
			PdfPCell cellAmt = new PdfPCell();
			cellAmt.setPhrase(new Phrase(Convert.toString(adviceList.getAmount()), font11));
			cellAmt.setHorizontalAlignment(Element.ALIGN_RIGHT);
			tableDetails.addCell(cellAmt);
						
		}
		
		PdfPCell cellDD;			    	    
		cellDD = new PdfPCell(new Phrase("Total Deduction",font));			    	    		    	   
 	    tableDetails.addCell(cellDD);
		
		PdfPCell cellDD1;			    	    
    	cellDD1 = new PdfPCell(new Phrase(Convert.toString(total),font));	
    	cellDD1.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    tableDetails.addCell(cellDD1);
		
		doc.add(tableDetails);
		
		PdfPTable tabletotal = new PdfPTable(5);
		tabletotal.setWidthPercentage(100.0f);
		tabletotal.setWidths(new float[] {2.0f, 2.5f, 2.0f, 2.0f, 2.0f});		
		//tabletotal.setSpacingBefore(10);
		
		Font fo1 = FontFactory.getFont("Times-Roman");
		fo1.setColor(BaseColor.BLACK);
		
		PdfPCell celltotal = new PdfPCell();
		celltotal.setPadding(5);
		
		celltotal.setPhrase(new Phrase("", fo1));
		tabletotal.addCell(celltotal);
		
		celltotal.setPhrase(new Phrase("", fo1));
		tabletotal.addCell(celltotal);

		celltotal.setPhrase(new Phrase("", fo1));
		tabletotal.addCell(celltotal);
		
		celltotal.setPhrase(new Phrase("Total(INR)", fo1));
		tabletotal.addCell(celltotal);
		
		celltotal.setPhrase(new Phrase(Convert.toString(total), fo1));
		celltotal.setHorizontalAlignment(Element.ALIGN_RIGHT);
		tabletotal.addCell(celltotal);
		
		doc.add(tabletotal);
		
		Paragraph p5 = new Paragraph("\n\n\n" + "Your Sincerely"+"\nFor "+cid.getCompName()+"\n\n\n\n\nAuthorised Signatory", new Font(FontFamily.TIMES_ROMAN, 11, Font.NORMAL,BaseColor.BLACK));
		
		PdfPTable tblreg1 = new PdfPTable(1);
		tblreg1.setWidthPercentage(100.0f);
		PdfPCell cellreg1 = new PdfPCell(p5);
		cellreg1.setHorizontalAlignment(Element.ALIGN_LEFT);
		cellreg1.setBorder(Rectangle.NO_BORDER);
		tblreg1.addCell(cellreg1);
		
		doc.add(tblreg1);
		doc.close();
	}
}