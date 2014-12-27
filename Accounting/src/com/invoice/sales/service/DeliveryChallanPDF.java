package com.invoice.sales.service;

//import java.io.FileOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.sales.beans.DeliveryChallan;
import com.invoice.sales.beans.DeliveryChallanDetails;
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

public class DeliveryChallanPDF extends AbstractPdfView {

	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
			
		PdfWriter.getInstance(doc, new FileOutputStream(System.getProperty("user.dir")+"/Delivery Challan.pdf"));       
	        doc.open();
		
			DeliveryChallan deliveryChallan=(DeliveryChallan) model.get("deliveryChallan");
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
				cell3.setPhrase(new Phrase("DELIVERY  CHALLAN",font1));			
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
	      		 Font(FontFamily.HELVETICA, 15, Font.BOLD, new BaseColor(38,114,236)) );
	      
			 Paragraph p2 = new Paragraph(cid.getCompDesc()+"\n\n"+cid.getCompAddress()+"\n\nContact No :  "+cid.getContactNo()+"                     "+"Email :  "+cid.getEmail()+"\n"+" ", new
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
		//cell.setMinimumHeight(4.0f);
		tableBlf.addCell(cell);
		
		doc.add(tableBlf);

		
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);	
		
		
		PdfPTable tabled = new PdfPTable(3);
		tabled.setTotalWidth(new float[]{ 80, 80, 80 });
		tabled.setLockedWidth(true);
		tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
	    PdfPCell celld1,celld4;
	    
	    celld1 = new PdfPCell(new Phrase("Customer Name      : "+"   "+deliveryChallan.getCustomerName(),font));
	    celld1.setColspan(3);
	    tabled.addCell(celld1);    
	  
	    
	    celld4 = new PdfPCell(new Phrase("Party VAT TIN No : "+"   "+deliveryChallan.getCustVatNo(),font));
	    celld4.setColspan(3);
	    tabled.addCell(celld4);
	  
	   
	    
	    
	    PdfPTable tabledd = new PdfPTable(3);
	    tabledd.setTotalWidth(new float[]{ 70, 70, 70 });
	    tabledd.setLockedWidth(true);
	    tabledd.setHorizontalAlignment(Element.ALIGN_RIGHT);		        
	    PdfPCell celld12,celld13;
	    
	   
	    celld12 = new PdfPCell(new Phrase("Challan No    : "+"      "+deliveryChallan.getChallanID(),font));
	    celld12.setColspan(3);
	    tabledd.addCell(celld12);
	     
	  
	    celld13 = new PdfPCell(new Phrase("Date               : "+"      "+deliveryChallan.getDate(),font));
	    celld13.setColspan(3);
	    tabledd.addCell(celld13);		
	    
	  
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

	    PdfPTable tableBlf1 = new PdfPTable(1);
		tableBlf1.setWidthPercentage(70.0f);
		tableBlf1.setWidths(new float[] {2.0f});
		tableBlf1.setSpacingBefore(10);

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(20);
		tableBlf1.addCell(cell);
		
		doc.add(tableBlf1);
			
			
			PdfPTable tableDetails = new PdfPTable(4);
			tableDetails.setWidthPercentage(100.0f);
			tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f});
			tableDetails.setSpacingBefore(10);
			
			// define font for table header row
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			// define table header cell
			PdfPCell cell1 = new PdfPCell();
			cell1.setBackgroundColor(BaseColor.WHITE);
			cell1.setPadding(5);
			
			// write table header 
			cell1.setPhrase(new Phrase("Sr No", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Product Name", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Unit", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Quantity", font11));
			tableDetails.addCell(cell1);
			
		
			
			List<DeliveryChallanDetails> chProductList=new ArrayList<DeliveryChallanDetails>();		
			chProductList.addAll(deliveryChallan.getDeliveryChallandetails());
			for(DeliveryChallanDetails productList : chProductList)
			{
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(productList.getSrNo()), font));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(productList.getItemCode(), font));
				tableDetails.addCell(cellit);	
				
				PdfPCell cellunit = new PdfPCell();
				cellunit.setPhrase(new Phrase(productList.getUnit(), font));
				tableDetails.addCell(cellunit);	
				
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(productList.getQuantity()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
			
			}
			
			doc.add(tableDetails);
			

			PdfPTable tableBl11 = new PdfPTable(1);
			tableBl11.setWidthPercentage(70.0f);
			tableBl11.setWidths(new float[] {2.0f});
			tableBl11.setSpacingBefore(10);
		
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(20);
			tableBl11.addCell(cell);
			
			doc.add(tableBl11);
	        
		
			
			 PdfPTable tablel = new PdfPTable(3);
		        tablel.setWidthPercentage(100.0f);
		        tablel.setWidths(new float[]{3, 2, 1});
		        
		        PdfPCell celln1 = new PdfPCell(new Phrase("\n\n\n\n\n\nReceiver's Signature & Stamp",font));
		        celln1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln1.setRowspan(4);
		       // celln1.setBorderWidthBottom(0.5f);
		        celln1.setMinimumHeight(100);
		        tablel.addCell(celln1);
		        
		        PdfPCell celln12 = new PdfPCell(new Phrase("For "+cid.getCompName(),font));
		        celln12.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln12.setRowspan(5);
		        celln12.setColspan(2);
		       // celln12.setBorderWidthBottom(0.5f);
		        celln12.setMinimumHeight(100);
		        tablel.addCell(celln12);
		        
		        PdfPCell celln13 = new PdfPCell();	
		        celln13.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln13.setRowspan(5);	
		        celln13.setColspan(2);
		      //  celln13.setBorderWidthBottom(0.5f);
		        celln13.setMinimumHeight(100);
		        tablel.addCell(celln13);
		        
		        
		       doc.add(tablel);
		        
		      
		        
		       
		
					
			
					/*
					PdfPTable tableBl12 = new PdfPTable(1);
					tableBl12.setWidthPercentage(70.0f);
					tableBl12.setWidths(new float[] {2.0f});
					tableBl12.setSpacingBefore(10);
				
					cell.setPhrase(new Phrase());
					cell.setBorder(Rectangle.NO_BORDER);
					cell.setMinimumHeight(300);
					tableBl12.addCell(cell);
					
					doc.add(tableBl12);
					
					 PdfPTable tblFooter = new PdfPTable(4);
					 tblFooter.setWidthPercentage(100.0f);
						    
						PdfPCell cellF1 = new PdfPCell();
				        cellF1.setBorder(Rectangle.BOTTOM);	       
				        PdfPCell cellF2 = new PdfPCell();
				        cellF2.setBorder(Rectangle.BOTTOM);
				      
				        PdfPCell cellF3=new PdfPCell();
				        cellF3.setBorder(Rectangle.BOTTOM);
				        PdfPCell cellF4=new PdfPCell();
				        cellF4.setBorder(Rectangle.BOTTOM);
				       
				        
				        tblFooter.addCell(cellF1);
				        tblFooter.addCell(cellF2);
				        tblFooter.addCell(cellF3);
				        tblFooter.addCell(cellF4);
				        
				doc.add(tblFooter); 
				
				
				PdfPTable tblFooterdt = new PdfPTable(4);
				tblFooterdt.setWidthPercentage(100.0f);
					    
					PdfPCell cellFdt1 = new PdfPCell(new Phrase(cid.getWebsite(),font));
			        cellFdt1.setBorder(Rectangle.NO_BORDER);	       
			        PdfPCell cellFdt2 = new PdfPCell();
			        cellFdt2.setBorder(Rectangle.NO_BORDER);
			      
			        PdfPCell cellFdt3=new PdfPCell();
			        cellFdt3.setBorder(Rectangle.NO_BORDER);
			        PdfPCell cellFdt4=new PdfPCell(new Phrase(doc.getPageNumber()));
			        cellFdt4.setBorder(Rectangle.NO_BORDER);
			       
			        
			        tblFooterdt.addCell(cellFdt1);
			        tblFooterdt.addCell(cellFdt2);
			        tblFooterdt.addCell(cellFdt3);
			        tblFooterdt.addCell(cellFdt4);
			        
			doc.add(tblFooterdt); */
		
			doc.close();

	/*class HeaderFooter extends PdfPageEventHelper
	{
	Phrase[] header=new Phrase[2];
	int pageno;
	public void onOpenDocument(PdfWriter writer,Document doc)
	{
	header[0]=new Phrase("Reformist Solutions");

	}
	public void onChapter(PdfWriter writer,Document doc,float paraPos,Paragraph title)
	{
	header[1]=new Phrase(title.getContent());
	pageno=1;
	}
	public void onStartPage(PdfWriter writer,Document doc)
	{
	pageno++;
	}
	public void onEndPage(PdfWriter writer,Document doc)
	{
	Rectangle rect=writer.getBoxSize("art");
	switch (writer.getPageNumber()%2) {
	case 0:
		ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_RIGHT,header[0],rect.getRight(), rect.getTop(), 0);
		break;
		
	case 1:
		ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_RIGHT,header[1],rect.getRight(), rect.getTop(), 0);

		break;
	}
	ColumnText.showTextAligned(writer.getDirectContent(),Element.ALIGN_CENTER, new Phrase(String.format("page %d",pageno)),(rect.getLeft()+rect.getRight())/2,rect.getBottom()-18,0);
	}

	}*/
	}
	}