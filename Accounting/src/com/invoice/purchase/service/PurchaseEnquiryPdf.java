package com.invoice.purchase.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.purchase.beans.PurchaseEnquiry;
import com.invoice.purchase.beans.PurchaseEnquiryDetails;
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


public class PurchaseEnquiryPdf extends AbstractPdfView
{	
	
	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		final String path = System.getProperty("user.dir");  
		 PdfWriter.getInstance(doc, new FileOutputStream(path+"/Purchase Enquiry.pdf"));     
	        doc.open();	
		PurchaseEnquiry purchaseEnquiry=(PurchaseEnquiry) model.get("viewenquiry");
		//doc.add(new Paragraph("PDF OF SALES ENQUIRY"));

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
cell3.setPhrase(new Phrase("PURCHASE ENQUIRY",font1));
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
				
		
		doc.setMarginMirroring(true);		
		PdfPCell cell = new PdfPCell();
		Font font = FontFactory.getFont("Times-Roman");
		font.setColor(BaseColor.BLACK);
		
		
		
		PdfPTable tabled = new PdfPTable(3);	
		tabled.setTotalWidth(new float[]{ 70, 70, 70 });
		tabled.setLockedWidth(true);
		tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
		/*tabled.getDefaultCell().setBorderWidth(2);*/
		Font f1 = FontFactory.getFont("Times-Roman");
		f1.setColor(BaseColor.BLACK);
		    PdfPCell celld1,celld2;
		    
		    celld1 = new PdfPCell(new Phrase("Enquiry ID      :"+"   "+purchaseEnquiry.getEnqID(),f1));
		    celld1.setColspan(3);	    
		    tabled.addCell(celld1);
		    
		    celld2 = new PdfPCell(new Phrase("Date  :"+"   "+purchaseEnquiry.getEnqDate(),f1));
		    celld2.setColspan(3);
		    tabled.addCell(celld2);	         
		    
		    /*celld3 = new PdfPCell(new Phrase("Shipping Address    :"+"   "+purchaseQuotation.getTxtAreaShipto(),f1));
		    celld3.setColspan(3);
		    tabled.addCell(celld3);*/	
		    
		    /*celld4 = new PdfPCell(new Phrase("Party VAT TIN No :"+"   "+));
		    celld4.setColspan(3);
		    tabled.addCell(celld4);*/
		    
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
		    
		    celld11 = new PdfPCell(new Phrase("Vender Name :"+"       "+purchaseEnquiry.getSupplierName(),f1));
		    celld11.setColspan(3);
		    tabledd.addCell(celld11);	    	   
		    
		    /*celld13 = new PdfPCell(new Phrase("Date            :"+"      "+purchaseQuotation.getTxtQuotationDate(),f1));
		    celld13.setColspan(3);
		    tabledd.addCell(celld13);	*/
		  
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

		    
		/*    PdfPTable tableB = new PdfPTable(1);
			tableB.setWidthPercentage(70.0f);
			tableB.setWidths(new float[] {2.0f});
			tableB.setSpacingBefore(10);
		
			//PdfPCell cell = new PdfPCell();
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(30);
			tableB.addCell(cell);
			
			doc.add(tableB);*/
		    
			
			PdfPTable tableDetails = new PdfPTable(5);
			tableDetails.setWidthPercentage(100.0f);
			tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f, 2.0f});		
			tableDetails.setSpacingBefore(10);
			
			// define font for table header row
			Font fo = FontFactory.getFont("Times-Roman");
			font1.setColor(BaseColor.BLACK);
			
			// define table header cell
			PdfPCell cell1 = new PdfPCell();
			//cell1.setBackgroundColor(new BaseColor(138, 170, 255));
			cell1.setPadding(5);
			
			// write table header 
			cell1.setPhrase(new Phrase("Sr No", fo));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Product Name", fo));
			tableDetails.addCell(cell1);

			cell1.setPhrase(new Phrase("Description", fo));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Unit of Measure", fo));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Quantity", fo));
			tableDetails.addCell(cell1);
			
			List<PurchaseEnquiryDetails> enqDetails=new ArrayList<PurchaseEnquiryDetails>();		
			enqDetails.addAll(purchaseEnquiry.getPurchasenquiryDetails());
			for(PurchaseEnquiryDetails productList : enqDetails)
			{
				/*tableDetails.addCell(Convert.toString(productList.getSrNo()));
				tableDetails.addCell(productList.getItemCode());
				tableDetails.addCell(productList.getDes());
				tableDetails.addCell(productList.getQuantity());*/
				Font font11 = FontFactory.getFont("Times-Roman");
				font11.setColor(BaseColor.BLACK);
				
				PdfPCell cell20 = new PdfPCell(); 
				cell20.setPhrase(new Phrase(Convert.toString(productList.getSrNo())));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(productList.getItemCode(), font11));
				tableDetails.addCell(cellit);	
				
				PdfPCell celldes = new PdfPCell();
				celldes.setPhrase(new Phrase(productList.getDes(), font11));
				tableDetails.addCell(celldes);
				
				PdfPCell cellunit = new PdfPCell();
				cellunit.setPhrase(new Phrase(productList.getUnit(), font11));
				tableDetails.addCell(cellunit);

				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(productList.getQuantity()), font11));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
			}
			
			doc.add(tableDetails);
			
			
			PdfPTable tableBl2 = new PdfPTable(1);
			tableBl2.setWidthPercentage(70.0f);
			tableBl2.setWidths(new float[] {2.0f});
			tableBl2.setSpacingBefore(10);				
			
			cell.setPhrase(new Phrase());
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(20);
			tableBl2.addCell(cell);
			
			doc.add(tableBl2);
			
			
			/*PdfPTable table = new PdfPTable(2);
			   table.setWidthPercentage(100.0f);
			
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			 PdfPCell celln1 = new PdfPCell(new Phrase("\n\n\n\n\nReceiver's Signature & Stamp",font11));
		        celln1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln1.setRowspan(4);
		       // celln1.setBorderWidthBottom(0.5f);
		        celln1.setMinimumHeight(100);
		        table.addCell(celln1);
		        
		        PdfPCell celln12 = new PdfPCell(new Phrase("For "+cid.getCompName()+"\n\n\n\n\nProprietor",font11));
		        celln12.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln12.setRowspan(5);
		        celln12.setColspan(2);
		       // celln12.setBorderWidthBottom(0.5f);
		        celln12.setMinimumHeight(100);
		        table.addCell(celln12);
		        */
		        /*PdfPCell celln13 = new PdfPCell();	
		        celln13.setHorizontalAlignment(Element.ALIGN_CENTER);
		        celln13.setRowspan(5);	
		        celln13.setColspan(2);
		      //  celln13.setBorderWidthBottom(0.5f);
		        celln13.setMinimumHeight(100);
		        table.addCell(celln13);
		        */
		        
		      //  doc.add(table);
			
						PdfPTable tableBl1 = new PdfPTable(1);
						tableBl1.setWidthPercentage(70.0f);
						tableBl1.setWidths(new float[] {2.0f});
						tableBl1.setSpacingBefore(10);				
						
						cell.setPhrase(new Phrase());
						cell.setBorder(Rectangle.NO_BORDER);
						cell.setMinimumHeight(50);
						tableBl1.addCell(cell);
						
						doc.add(tableBl1);
				        
				        
				       /* PdfPTable tablePN = new PdfPTable(4);
						tablePN.setWidthPercentage(100.0f);
						tablePN.setWidths(new float[] {3.0f, 3.0f,3.0f, 2.0f});
						tablePN.setSpacingBefore(10);
				
							PdfPCell cellPS = new PdfPCell();
							cellPS.setBackgroundColor(BaseColor.WHITE);
							cellPS.setPadding(5);
							
							
							cellPS.setPhrase(new Phrase("Public Notes :", font11));
							cellPS.setBorder(Rectangle.NO_BORDER);
							tablePN.addCell(cellPS);
							
							cellPS.setPhrase(new Phrase(purchaseEnquiry.getPubNotes(),font11));
							cellPS.setBorder(Rectangle.NO_BORDER);
							tablePN.addCell(cellPS);
							
							
							cellPS.setPhrase(new Phrase());
							cellPS.setBorder(Rectangle.NO_BORDER);			
							tablePN.addCell(cellPS);
							
							
							cellPS.setPhrase(new Phrase());
							cellPS.setBorder(Rectangle.NO_BORDER);			
							tablePN.addCell(cellPS);
							
							doc.add(tablePN);
					*/
			        
					doc.close();
	}
}
/*class TableHeader extends PdfPageEventHelper 
{
    String header;

    PdfTemplate total;
    public void setHeader(String header) {
        this.header = header;
    }
    public void onOpenDocument(PdfWriter writer, Document document) {
        total = writer.getDirectContent().createTemplate(30, 16);
    }
    public void onEndPage(PdfWriter writer, Document document) {
        PdfPTable table = new PdfPTable(3);
        try {
            table.setWidths(new int[]{24, 24, 2});
            table.setTotalWidth(527);
            table.setLockedWidth(true);
            table.getDefaultCell().setFixedHeight(20);
            table.getDefaultCell().setBorder(Rectangle.BOTTOM);
            table.addCell(header);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(String.format("Page %d of", writer.getPageNumber()));
            PdfPCell cell = new PdfPCell(Image.getInstance(total));
            cell.setBorder(Rectangle.BOTTOM);
            table.addCell(cell);
            table.writeSelectedRows(0, -1, 34, 803, writer.getDirectContent());
        }
        catch(DocumentException de) {
            throw new ExceptionConverter(de);
        }
    }
    public void onCloseDocument(PdfWriter writer, Document document) {
        ColumnText.showTextAligned(total, Element.ALIGN_LEFT,
                new Phrase(String.valueOf(writer.getPageNumber() - 1)),
                2, 2, 0);
    }
}



*/