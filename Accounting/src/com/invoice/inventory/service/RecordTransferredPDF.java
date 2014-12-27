package com.invoice.inventory.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.taglibs.standard.lang.jpath.adapter.Convert;


import com.invoice.company.beans.CompanyDetails;

import com.invoice.inventory.beans.RecordTransferred;
import com.invoice.inventory.beans.RecordTransferredDetails;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
//import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.Font.FontFamily;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class RecordTransferredPDF extends AbstractPdfView {

	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		RecordTransferred recordTransferred=(RecordTransferred) model.get("recordTransferredView");
		
		doc.open();
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);
		
		PdfPCell cell = new PdfPCell();
		
		doc.setMarginMirroring(true);
		
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");

		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] {2.0f, 2.0f, 8.0f,2.0f, 2.0f});
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
		cell3.setPhrase(new Phrase("RECORD TRANSFER",font1));
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
		      	  Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(38,114,236))) ;
		      
		 Paragraph p2 = new Paragraph(cid.getCompDesc()+"\n\n"+cid.getCompAddress()+"\n\nContact No : "+cid.getContactNo()+"  "+"Email : "+cid.getEmail()+"\n"+" ", new
		     	  Font(FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0, 0, 0))) ;
		      

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
		
		PdfPTable tabled = new PdfPTable(3);	
		tabled.setTotalWidth(new float[]{ 70, 70, 70 });
		tabled.setLockedWidth(true);
		tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
		Font f1 = FontFactory.getFont("Times-Roman");
		f1.setColor(BaseColor.BLACK);
		    PdfPCell celld1,celld2;
		    
		    celld1 = new PdfPCell(new Phrase("Voucher No      :"+"   "+recordTransferred.getTxtVNo(),f1));
		    celld1.setColspan(3);	    
		    tabled.addCell(celld1);
		    
		    celld2 = new PdfPCell(new Phrase("Date  :"+"   "+recordTransferred.getDate(),f1));
		    celld2.setColspan(3);
		    tabled.addCell(celld2);	         
		    
			PdfPTable tab = new PdfPTable(4);
			tab.setWidthPercentage(100.0f);
			tab.setWidths(new float[] {3.0f, 3.5f,4.3f, 2.0f});
			tab.setSpacingBefore(10);		
			
			Font fontEL = FontFactory.getFont("Times-Roman");
			fontEL.setColor(BaseColor.BLACK);

			PdfPCell ceell = new PdfPCell();
			
			ceell.setPhrase(new Phrase());
			ceell.setBorder(Rectangle.NO_BORDER);
			tab.addCell(ceell);
			
			ceell.setPhrase(new Phrase());
			ceell.setBorder(Rectangle.NO_BORDER);
			ceell.setMinimumHeight(5f);
			tab.addCell(ceell);	
			
			ceell.setBorder(Rectangle.NO_BORDER);
			ceell.setMinimumHeight(5f);
			tab.addCell(ceell);
			
			
			ceell.setBorder(Rectangle.NO_BORDER); 
			ceell.setMinimumHeight(5f);
			tab.addCell(ceell);
					
			doc.add(tab);
		    
		    
		    PdfPTable tabledd = new PdfPTable(3);
		    tabledd.setTotalWidth(new float[]{ 70, 70, 70 });
		    tabledd.setLockedWidth(true);
		    tabledd.setHorizontalAlignment(Element.ALIGN_RIGHT);	         
		    PdfPCell celld11;
		    
		    celld11 = new PdfPCell(new Phrase("Warehouse Name :"+"       "+recordTransferred.getSelectWarehouse(),f1));
		    celld11.setColspan(3);
		    tabledd.addCell(celld11);	    	   
		   
		    PdfPTable tablemain = new PdfPTable(2);
		    tablemain.setWidthPercentage(100.0f);	       
		    tablemain.setWidths(new float[] {100,100});
		 
		    PdfPCell firstcell = new PdfPCell();
		    firstcell.addElement(tabled);
		    firstcell.setBorder(Rectangle.NO_BORDER);
		    tablemain.addCell(firstcell);
		    
		    PdfPCell secondcell = new PdfPCell();
		    secondcell.addElement(tabledd);
		    secondcell.setBorder(Rectangle.NO_BORDER);
		    tablemain.addCell(secondcell);
		    
		    doc.add(tablemain);	
		
		    
		    PdfPTable tableDetails = new PdfPTable(3);
			tableDetails.setWidthPercentage(100.0f);
			tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f});
			tableDetails.setSpacingBefore(10);
			
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			PdfPCell cell1 = new PdfPCell();
			cell1.setPadding(5);
			
			cell1.setPhrase(new Phrase("Sr No", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Product Name", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Quantity", font11));
			tableDetails.addCell(cell1);
			
			List<RecordTransferredDetails> issueDetails=new ArrayList<RecordTransferredDetails>();		
			issueDetails.addAll(recordTransferred.getRecordTransferredDetailsList());
			for(RecordTransferredDetails issueproductList : issueDetails)
			{
				
				PdfPCell cell20 = new PdfPCell(); 
				cell20.setPhrase(new Phrase(Convert.toString(issueproductList.getTxtSrNo1())));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(issueproductList.getTxtItem1(), font));
				tableDetails.addCell(cellit);	
			
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(issueproductList.getTxtQuant1()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
				
			}
		
			doc.add(tableDetails);
		

	
		PdfPTable tablePN = new PdfPTable(4);
		tablePN.setWidthPercentage(100.0f);
		tablePN.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tablePN.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Desctiption :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase(recordTransferred.getTxtDetails(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tablePN.addCell(cell);
		

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(60f);
		tablePN.addCell(cell);
		
		
		doc.add(tablePN);
		
	}

	}

