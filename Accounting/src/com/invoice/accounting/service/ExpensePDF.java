/*package com.invoice.accounting.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.accounting.beans.Createnewexpense;
import com.invoice.accounting.beans.CreatenewexpenseDetails;
import com.invoice.company.beans.CompanyDetails;
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

public class ExpensePDF extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Createnewexpense createnewexpense=(Createnewexpense) model.get("Expense");
		doc.open();
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);
		
		// define table header cell
		PdfPCell cell = new PdfPCell();
		
		doc.setMarginMirroring(true);
		
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");

		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] {2.0f, 2.0f, 8.0f,2.0f, 2.0f});
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
		cell3.setPhrase(new Phrase("RECORD TRANSFER",font1));
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
		tabled.getDefaultCell().setBorderWidth(2);
		Font f1 = FontFactory.getFont("Times-Roman");
		f1.setColor(BaseColor.BLACK);
		    PdfPCell celld1,celld2;
		    
		    celld1 = new PdfPCell(new Phrase("EXP ID      :"+"   "+createnewexpense.getExpid(),f1));
		    celld1.setColspan(3);	    
		    tabled.addCell(celld1);
		    
		    celld2 = new PdfPCell(new Phrase("Expense Date  :"+"   "+createnewexpense.getExpdate(),f1));
		    celld2.setColspan(3);
		    tabled.addCell(celld2);	         
		    
		    celld3 = new PdfPCell(new Phrase("Shipping Address    :"+"   "+purchaseQuotation.getTxtAreaShipto(),f1));
		    celld3.setColspan(3);
		    tabled.addCell(celld3);	
		    
		    celld4 = new PdfPCell(new Phrase("Party VAT TIN No :"+"   "+));
		    celld4.setColspan(3);
		    tabled.addCell(celld4);
		    
		   // doc.add(tabled);
		    
			PdfPTable tab = new PdfPTable(4);
			tab.setWidthPercentage(100.0f);
			tab.setWidths(new float[] {3.0f, 3.5f,4.3f, 2.0f});
			tab.setSpacingBefore(10);		
			
			// define font for table header row
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
		    
		    celld11 = new PdfPCell(new Phrase("Paid From Account :"+"       "+createnewexpense.getPaidfrom(),f1));
		    celld11.setColspan(3);
		    tabledd.addCell(celld11);	    	   
		    
		    celld13 = new PdfPCell(new Phrase("Date            :"+"      "+purchaseQuotation.getTxtQuotationDate(),f1));
		    celld13.setColspan(3);
		    tabledd.addCell(celld13);	
		  
		    //doc.add(tabledd);
		    
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
			
			// define font for table header row
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			// define table header cell
			PdfPCell cell1 = new PdfPCell();
			//cell1.setBackgroundColor(new BaseColor(138, 170, 255));
			cell1.setPadding(5);
			
			// write table header 
			cell1.setPhrase(new Phrase("Sr No", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Product ID", font1));
			tableDetails.addCell(cell1);

			cell1.setPhrase(new Phrase("Expense Type", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Description", font11));
			tableDetails.addCell(cell1);
			
			List<CreatenewexpenseDetails> issueDetails=new ArrayList<CreatenewexpenseDetails>();		
			issueDetails.addAll(createnewexpense.getExpenseDetailsList());
			for(CreatenewexpenseDetails issueproductList : issueDetails)
			{
				Font font = FontFactory.getFont("Times-Roman");
				font11.setColor(BaseColor.BLACK);
				
				PdfPCell cell20 = new PdfPCell(); 
				cell20.setPhrase(new Phrase(Convert.toString(issueproductList.getTxtSrNo1())));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(issueproductList.getTxttype(), font));
				tableDetails.addCell(cellit);	
			
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(issueproductList.getRemark()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
				
				tableDetails.addCell(Convert.toString(issueproductList.getTxtSrNo1()));
				tableDetails.addCell(issueproductList.getItemID());
				tableDetails.addCell(issueproductList.getTxtItem1());
				tableDetails.addCell(Convert.toString(issueproductList.getTxtQuant1()));
			}
		
			doc.add(tableDetails);
		
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");
		
		 Paragraph p = new Paragraph(cid.getCompName(), new
     		 Font(FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(38,114,236)) );
     
     Paragraph p2 = new Paragraph("Contact No:-"+cid.getContactNo()+"\nEmail:-"+cid.getEmail()+"\nWebsite:-"+cid.getWebsite()+"", new
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
    tableHD.setSpacingBefore(5);

    // define font for table header row
    Font font2 = FontFactory.getFont("Times-Roman");
    font2.setColor(BaseColor.BLACK);

    // define table header cell
    PdfPCell cellh = new PdfPCell();
    cellh.setBackgroundColor(BaseColor.WHITE);
    cellh.setPadding(10);

    // write table header 
    cellh.setPhrase(new Phrase("STOCK TRANSFER",font2));
    cellh.setColspan(5);
    cellh.setHorizontalAlignment(Element.ALIGN_CENTER);
    cellh.setBorder(Rectangle.BOTTOM);
    cellh.setBorderWidthBottom(2.0f);
    tableHD.addCell(cellh);
    

    doc.add(tableHD);
		

	PdfPTable tableFR = new PdfPTable(4);
	tableFR.setWidthPercentage(100.0f);
	tableFR.setWidths(new float[] {4.0f, 4.0f,2.0f, 2.0f});
	tableFR.setSpacingBefore(10);
	
	
	// define font for table header row
	Font font = FontFactory.getFont("Times-Roman");
	font.setColor(BaseColor.BLACK);
	
	// define table header cell
	PdfPCell cell = new PdfPCell();
	cell.setBackgroundColor(BaseColor.WHITE);
	cell.setPadding(5);
	
	// write table header 
	cell.setPhrase(new Phrase("Voucher NO:", font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableFR.addCell(cell);
	
	cell.setPhrase(new Phrase(recordTransferred.getTxtVNo(),font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableFR.addCell(cell);
	
	
	cell.setPhrase(new Phrase());
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableFR.addCell(cell);
	
	
	cell.setPhrase(new Phrase());
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableFR.addCell(cell);
	
	doc.add(tableFR);
	
	PdfPTable tableGR = new PdfPTable(4);
	tableGR.setWidthPercentage(100.0f);
	tableGR.setWidths(new float[] {4.0f, 4.0f,2.0f, 2.0f});
	tableGR.setSpacingBefore(10);
	
// write table header 
	cell.setPhrase(new Phrase("Date:", font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableGR.addCell(cell);
	
	cell.setPhrase(new Phrase(recordTransferred.getDate(),font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableGR.addCell(cell);
	
	
	cell.setPhrase(new Phrase());
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableGR.addCell(cell);
	
	
	cell.setPhrase(new Phrase());
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableGR.addCell(cell);
	
	doc.add(tableGR);
	
	PdfPTable tableSR = new PdfPTable(4);
	tableSR.setWidthPercentage(100.0f);
	tableSR.setWidths(new float[] {4.0f, 4.0f,2.0f, 2.0f});
	tableSR.setSpacingBefore(10);
	// write table header 
			cell.setPhrase(new Phrase("WareHouse ID:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableSR.addCell(cell);
			
			cell.setPhrase(new Phrase(recordTransferred.getWearehouseID(),font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableSR.addCell(cell);
			
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableSR.addCell(cell);
			
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableSR.addCell(cell);
			
			doc.add(tableSR);
			
			PdfPTable tableWR = new PdfPTable(4);
			tableWR.setWidthPercentage(100.0f);
			tableWR.setWidths(new float[] {4.0f, 4.0f,2.0f, 2.0f});
			tableWR.setSpacingBefore(10);
			// write table header 
			cell.setPhrase(new Phrase("WareHouse Name:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableWR.addCell(cell);
			
			cell.setPhrase(new Phrase(recordTransferred.getSelectWarehouse(),font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableWR.addCell(cell);
			
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableWR.addCell(cell);
			
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableWR.addCell(cell);
			
			doc.add(tableWR);
	
		
		PdfPTable tableDetails = new PdfPTable(4);
		tableDetails.setWidthPercentage(100.0f);
		tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f});
		tableDetails.setSpacingBefore(10);
		
		// define font for table header row
		Font font1 = FontFactory.getFont("Times-Roman");
		font1.setColor(BaseColor.BLACK);
		
		// define table header cell
		PdfPCell cell1 = new PdfPCell();
		cell1.setBackgroundColor(new BaseColor(138, 170, 255));
		cell1.setPadding(5);
		
		// write table header 
		cell1.setPhrase(new Phrase("Sr No", font1));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Product ID", font1));
		tableDetails.addCell(cell1);

		cell1.setPhrase(new Phrase("Product Name", font1));
		tableDetails.addCell(cell1);
				
		cell1.setPhrase(new Phrase("Quantity", font1));
		tableDetails.addCell(cell1);
		
		cell1.setPhrase(new Phrase("Destination Warehouse", font1));
		tableDetails.addCell(cell1);
		
		List<RecordTransferredDetails> transfrdetails=new ArrayList<RecordTransferredDetails>();		
		transfrdetails.addAll(recordTransferred.getRecordTransferredDetailsList());
		for(RecordTransferredDetails transfrdetailsList : transfrdetails)
		{
			tableDetails.addCell(Convert.toString(transfrdetailsList.getTxtSrNo1()));
			tableDetails.addCell(transfrdetailsList.getItemID());
			tableDetails.addCell(transfrdetailsList.getTxtItem1());
			tableDetails.addCell(Convert.toString(transfrdetailsList.getTxtQuant1()));
			tableDetails.addCell(transfrdetailsList.getDestWarehouse1());
			
		}
	doc.add(tableDetails);
	
		PdfPTable tablePN = new PdfPTable(4);
		tablePN.setWidthPercentage(100.0f);
		tablePN.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tablePN.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Narration :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase(createnewexpense.getNarration(),font));
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


*/