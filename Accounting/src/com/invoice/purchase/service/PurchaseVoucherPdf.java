package com.invoice.purchase.service;

import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseVoucher;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PurchaseVoucherPdf extends AbstractPdfView
{
	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		

		final String path = System.getProperty("user.dir");  
		 PdfWriter.getInstance(doc, new FileOutputStream(path+"/Purchase Voucher.pdf"));      
	        doc.open();	
		PurchaseVoucher purchaseVoucher=(PurchaseVoucher) model.get("viewvoucher");
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");

		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] {2.0f, 2.0f, 5.0f,2.0f, 2.0f});
		tableHD.setSpacingBefore(10);

		// define font for table header row
		Font font1 = FontFactory.getFont("Times-Roman",16,Font.UNDERLINE);
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
		//cell3.setPadding(5);
		cell3.setPhrase(new Phrase("PURCHASE VOUCHER",font1));
		//cell3.setColspan(5);
		cell3.setHorizontalAlignment(Element.ALIGN_CENTER);	
		cell3.setBorder(Rectangle.NO_BORDER);
		//cell3.setBorderWidthBottom(1);
		tableHD.addCell(cell3);

		PdfPCell cell4 = new PdfPCell();
		cell4.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell4);
		PdfPCell cell5 = new PdfPCell();
		cell5.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell5);

		doc.add(tableHD);

		 Paragraph p = new Paragraph("\n"+cid.getCompName(), new
		      	  Font(FontFamily.HELVETICA, 15, Font.BOLD, new BaseColor(38,114,236))) ;
		      
		 Paragraph p2 = new Paragraph(cid.getCompDesc()+"\n\n"+cid.getCompAddress()+"\n\nContact No :  "+cid.getContactNo()+"\n\nEmail : "+cid.getEmail()+"\n"+" ", new
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
		
		
		/*CompanyDetails cid=(CompanyDetails) model.get("compInfo");
		
		 Paragraph p = new Paragraph(cid.getCompName(), new
      		 Font(FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(38,114,236)) );
      
      Paragraph p2 = new Paragraph("Contact No:"+cid.getContactNo()+"\nEmail:"+cid.getEmail()+"\nWebsite:"+cid.getWebsite()+"", new
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
			
				PdfPTable tableHD = new PdfPTable(5);
				tableHD.setWidthPercentage(100.0f);
				tableHD.setWidths(new float[] {2.0f, 2.0f, 2.0f,2.0f, 2.0f});
				tableHD.setSpacingBefore(10);
					
					// define font for table header row
					Font font1 = FontFactory.getFont("Times-Roman");
					font1.setColor(BaseColor.BLACK);
					
					// define table header cell
					PdfPCell cellh = new PdfPCell();
					cellh.setBackgroundColor(BaseColor.WHITE);
					cellh.setPadding(5);
					
					// write table header 
					
					cellh.setPhrase(new Phrase("PURCHASE VOUCHER",font1));
					cellh.setColspan(5);
					cellh.setHorizontalAlignment(Element.ALIGN_CENTER);
					cellh.setBorder(Rectangle.NO_BORDER);
					tableHD.addCell(cellh);
					
					doc.add(tableHD);
		        
		        
		        
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
	        
	doc.add(tblHeader); */
		
		
		
		PdfPTable tableFR = new PdfPTable(4);
		tableFR.setWidthPercentage(100.0f);
		tableFR.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tableFR.setSpacingBefore(10);
		
		
		// define font for table header row
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		cell.setBackgroundColor(BaseColor.WHITE);
		cell.setPadding(5);
		
		// write table header 
		cell.setPhrase(new Phrase("Voucher No :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFR.addCell(cell);
		
		cell.setPhrase(new Phrase(purchaseVoucher.getVoucherNo(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase("Order Id :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		
		cell.setPhrase(new Phrase(purchaseVoucher.getOrderId(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFR.addCell(cell);
		
		doc.add(tableFR);
		
		PdfPTable tableSR = new PdfPTable(4);
		tableSR.setWidthPercentage(100.0f);
		tableSR.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tableSR.setSpacingBefore(10);
				
		// define font for table header row
		Font fontSR = FontFactory.getFont("Times-Roman");
		fontSR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("From Account :", fontSR));
		cell.setBorder(Rectangle.NO_BORDER);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase(purchaseVoucher.getAccName(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);	
		
		cell.setPhrase(new Phrase("Date :"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);
		
		cell.setPhrase(new Phrase(purchaseVoucher.getDate()));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);		
		
		doc.add(tableSR);

		
		PdfPTable tableTR = new PdfPTable(4);
		tableTR.setWidthPercentage(100.0f);
		tableTR.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tableTR.setSpacingBefore(10);
				
		// define font for table header row
		Font fontTR = FontFactory.getFont("Times-Roman");
		fontTR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Amount :", fontTR));
		cell.setBorder(Rectangle.NO_BORDER);
		tableTR.addCell(cell);
		
		cell.setPhrase(new Phrase(Convert.toString(purchaseVoucher.getAmount())));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableTR.addCell(cell);	
		
		cell.setPhrase(new Phrase("Tds :"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableTR.addCell(cell);
		
		cell.setPhrase(new Phrase(Convert.toString(purchaseVoucher.getTds())));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableTR.addCell(cell);		
		
		doc.add(tableTR);
		
		
		PdfPTable tableFOR = new PdfPTable(4);
		tableFOR.setWidthPercentage(100.0f);
		tableFOR.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tableFOR.setSpacingBefore(10);
				
		// define font for table header row
		Font fontFOR = FontFactory.getFont("Times-Roman");
		fontFOR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Payment Mode :", fontFOR));
		cell.setBorder(Rectangle.NO_BORDER);
		tableFOR.addCell(cell);
		
		cell.setPhrase(new Phrase(purchaseVoucher.getPayMode()));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFOR.addCell(cell);	
		
		cell.setPhrase(new Phrase("Description :"));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFOR.addCell(cell);
		
		cell.setPhrase(new Phrase(purchaseVoucher.getDescription()));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableFOR.addCell(cell);		
		
		doc.add(tableFOR);

		
		PdfPTable tableBl1 = new PdfPTable(1);
		tableBl1.setWidthPercentage(70.0f);
		tableBl1.setWidths(new float[] {2.0f});
		tableBl1.setSpacingBefore(10);				
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(20);
		tableBl1.addCell(cell);
		
		doc.add(tableBl1);
		
		PdfPTable table = new PdfPTable(2);
		   table.setWidthPercentage(100.0f);
		
		Font font11 = FontFactory.getFont("Times-Roman");
		font11.setColor(BaseColor.BLACK);
		
		 PdfPCell celln1 = new PdfPCell(new Phrase("\n\n\n\n\nReceiver's Signature & Stamp",font11));
	        celln1.setHorizontalAlignment(Element.ALIGN_CENTER);
	        celln1.setRowspan(4);
	       // celln1.setBorderWidthBottom(0.5f);
	        celln1.setMinimumHeight(100);
	        table.addCell(celln1);
	        
	        PdfPCell celln12 = new PdfPCell(new Phrase("For "+cid.getCompName(),font11));
	        celln12.setHorizontalAlignment(Element.ALIGN_CENTER);
	        celln12.setRowspan(5);
	        celln12.setColspan(2);
	       // celln12.setBorderWidthBottom(0.5f);
	        celln12.setMinimumHeight(100);
	        table.addCell(celln12);
	        
	        /*PdfPCell celln13 = new PdfPCell();	
	        celln13.setHorizontalAlignment(Element.ALIGN_CENTER);
	        celln13.setRowspan(5);	
	        celln13.setColspan(2);
	      //  celln13.setBorderWidthBottom(0.5f);
	        celln13.setMinimumHeight(100);
	        table.addCell(celln13);
	        */
	        
	        doc.add(table);
	        
					PdfPTable tableBl22 = new PdfPTable(1);
					tableBl22.setWidthPercentage(70.0f);
					tableBl22.setWidths(new float[] {2.0f});
					tableBl22.setSpacingBefore(10);				
					
					cell.setPhrase(new Phrase());
					cell.setBorder(Rectangle.NO_BORDER);
					cell.setMinimumHeight(50);
					tableBl22.addCell(cell);
					
					doc.add(tableBl22);
					
					doc.close();
		
	}
}
