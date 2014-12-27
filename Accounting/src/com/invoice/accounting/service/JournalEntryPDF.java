package com.invoice.accounting.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.taglibs.standard.lang.jpath.adapter.Convert;
import com.invoice.accounting.beans.JournalDetails;
import com.invoice.accounting.beans.JournalHeader;
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
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

public class JournalEntryPDF extends AbstractPdfView {

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		

		JournalHeader journalHeader=(JournalHeader) model.get("viewJournal");
		
		CompanyDetails cid=(CompanyDetails) model.get("compInfo");

		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] {2.0f, 2.0f, 5.0f,2.0f, 2.0f});
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
		cell3.setPhrase(new Phrase("JOURNAL ENTRY",font1));
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
		      
		 Paragraph p2 = new Paragraph(cid.getCompAddress()+"\n\nContact No : "+cid.getContactNo()+" \n\n "+"Email : "+cid.getEmail()+"\n"+" ", new Font(FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0, 0, 0))) ;
		      

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
		
		
		
		PdfPTable tabled = new PdfPTable(3);	
		tabled.setTotalWidth(new float[]{ 70, 70, 70 });
		tabled.setLockedWidth(true);
		tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
		Font f1 = FontFactory.getFont("Times-Roman");
		f1.setColor(BaseColor.BLACK);
		    PdfPCell celld1,celld2;
		    
		    celld1 = new PdfPCell(new Phrase("Enquiry ID      :"+"   "+journalHeader.getTxtjourid(),f1));
		    celld1.setColspan(3);	    
		    tabled.addCell(celld1);
		    
		    celld2 = new PdfPCell(new Phrase("Date  :"+"   "+journalHeader.getTxtDate(),f1));
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
		    
		    celld11 = new PdfPCell(new Phrase("Source :"+"       "+journalHeader.getTxtSource(),f1));
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
			
		    PdfPTable tableDetails = new PdfPTable(4);
			tableDetails.setWidthPercentage(100.0f);
			tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f});		
			tableDetails.setSpacingBefore(10);
			
			Font fo = FontFactory.getFont("Times-Roman");
			font1.setColor(BaseColor.BLACK);
			
			PdfPCell cell1 = new PdfPCell();
						cell1.setPadding(5);
			
			cell1.setPhrase(new Phrase("Sr No", fo));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Product Name", fo));
			tableDetails.addCell(cell1);

			cell1.setPhrase(new Phrase("Description", fo));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Quantity", fo));
			tableDetails.addCell(cell1);
			
			List<JournalDetails> journalDetails=new ArrayList<JournalDetails>();		
			journalDetails.addAll(journalHeader.getJournalDetails());
			for(JournalDetails journalList : journalDetails)
			{
				
				Font font11 = FontFactory.getFont("Times-Roman");
				font11.setColor(BaseColor.BLACK);
				
				PdfPCell cell20 = new PdfPCell(); 
				cell20.setPhrase(new Phrase(Convert.toString(journalList.getTxtSrNo())));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(journalList.getTxtAccountName(), font11));
				tableDetails.addCell(cellit);	
				
				PdfPCell celldes = new PdfPCell();
				celldes.setPhrase(new Phrase(journalList.getTxtType(), font11));
				tableDetails.addCell(celldes);

				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(journalList.getTxtAmount()), font11));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
			}
			
			doc.add(tableDetails);
			
		
		PdfPTable tableBl = new PdfPTable(2);
		tableBl.setWidthPercentage(70.0f);
		tableBl.setWidths(new float[] {2.0f, 2.0f});
		tableBl.setSpacingBefore(8);
	
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(25f);
		tableBl.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(25f);
		tableBl.addCell(cell);
		
		doc.add(tableBl);

		PdfPTable tablePN = new PdfPTable(4);
		tablePN.setWidthPercentage(100.0f);
		tablePN.setWidths(new float[] {2.0f, 2.0f,2.0f, 2.0f});
		tablePN.setSpacingBefore(10);
		
		cell.setPhrase(new Phrase("Description :-", font));
		cell.setBorder(Rectangle.NO_BORDER);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase(journalHeader.getTxtDescription()));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(25f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(25f);
		tablePN.addCell(cell);
		
		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(25f);
		tablePN.addCell(cell);
		
		
		doc.add(tablePN);
		
	}
	
	 static class HeaderFooter extends PdfPageEventHelper{
		 public void onEndPage (PdfWriter writer, Document doc) {
	            Rectangle rect = writer.getBoxSize("arfffffffffffft");
	            switch(writer.getPageNumber() % 2) {
	                case 0:
	                    ColumnText.showTextAligned(writer.getDirectContent(),
	                        Element.ALIGN_RIGHT, new Phrase("even header"),
	                        rect.getRight(), rect.getTop(), 0);
	                  break;
	                case 1:
	                    ColumnText.showTextAligned(writer.getDirectContent(),
	                        Element.ALIGN_LEFT, new Phrase("odd header"),
	                        rect.getLeft(), rect.getTop(), 0);
	                    break;
	            }
	            ColumnText.showTextAligned(writer.getDirectContent(),
	                    Element.ALIGN_CENTER, new Phrase(String.format("page %d", writer.getPageNumber())),
	                    (rect.getLeft() + rect.getRight()) / 2, rect.getBottom() - 18, 0);
	        } 
	 }
}
