package com.invoice.accounting.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invoice.accounting.beans.AddNewAuditor;
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


public class AuditorPdf extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		
		 
		AddNewAuditor addnewAuditor=(AddNewAuditor) model.get("viewAuditdata");
		
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");

		 Paragraph p = new Paragraph(cid.getCompName(), new
		      	  Font(FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(38,114,236)));
		      
		      Paragraph p2 = new Paragraph("Contact No:-"+cid.getContactNo()+"\nEmail:-"+cid.getEmail()+"\nWebsite:-"+cid.getWebsite()+"", new
		     	  Font(FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0, 0, 0)));
		      
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
        
        PdfPTable tableHD = new PdfPTable(5);
        tableHD.setWidthPercentage(100.0f);
        tableHD.setWidths(new float[] {2.0f, 2.0f, 2.0f,2.0f, 2.0f});
        tableHD.setSpacingBefore(2);

        Font font1 = FontFactory.getFont(FontFactory.HELVETICA);
        font1.setColor(BaseColor.BLACK);

        PdfPCell cellh = new PdfPCell();
        cellh.setBackgroundColor(BaseColor.WHITE);
        cellh.setPadding(10);

       
        cellh.setPhrase(new Phrase("Auditors Details",font1));
        cellh.setColspan(5);
        cellh.setHorizontalAlignment(Element.ALIGN_CENTER);
        cellh.setBorder(Rectangle.BOTTOM);
        cellh.setBorderWidthBottom(2.0f);
        tableHD.addCell(cellh);
        
        doc.add(tableHD);
		
		PdfPTable tableFR = new PdfPTable(4);
		tableFR.setWidthPercentage(100.0f);
		tableFR.setWidths(new float[] {5.0f, 5.0f,4.0f, 4.0f});
		tableFR.setSpacingBefore(10);
		
		
		
		Font font = FontFactory.getFont(FontFactory.HELVETICA);
		font.setColor(BaseColor.BLACK);
		
		
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.WHITE);
		cell.setPadding(5);
		
		
		cell.setPhrase(new Phrase("Auditor ID :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(addnewAuditor.getTxtAuditNo(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		doc.add(tableFR);
		
		PdfPTable tableSR = new PdfPTable(4);
		tableSR.setWidthPercentage(100.0f);
		tableSR.setWidths(new float[] {5.0f, 5.0f,4.0f, 4.0f});
		tableSR.setSpacingBefore(10);
		
		
		
		Font fontSR = FontFactory.getFont(FontFactory.HELVETICA);
		fontSR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Auditor Name :-", fontSR));
		cell.setBorder(Rectangle.NO_BORDER);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase(addnewAuditor.getTxtName(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);	
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);
		
		
		doc.add(tableSR);
		
		PdfPTable tableDetails = new PdfPTable(4);
		tableDetails.setWidthPercentage(100.0f);
		tableDetails.setWidths(new float[] {5.0f, 5.0f, 5.0f, 4.0f});
		tableDetails.setSpacingBefore(10);
		
		
		Font font11 = FontFactory.getFont(FontFactory.HELVETICA);
		font11.setColor(BaseColor.BLACK);
		
		
		PdfPCell cell1 = new PdfPCell();
		cell1.setBackgroundColor(BaseColor.LIGHT_GRAY);
		cell1.setPadding(5);
			
		doc.add(tableDetails);
		
		PdfPTable tablePN = new PdfPTable(4);
		tablePN.setWidthPercentage(100.0f);
		tablePN.setWidths(new float[] {6.0f, 7.0f,5.0f, 4.0f});
		tablePN.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("E-mail :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase(addnewAuditor.getTxtEmail(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN.addCell(cell);
		
		doc.add(tablePN);
		
		
	}
}
