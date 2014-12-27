package com.invoice.inventory.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.CreateNewProduct;
import com.invoice.inventory.beans.Details;
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

public class InventoryPDF extends AbstractPdfView {
 
	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		CreateNewProduct createNewProduct=(CreateNewProduct) model.get("createNewProView");
		
		doc.open();
		
		doc.setMarginMirroring(true);
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
		cell3.setPhrase(new Phrase("NEW PRODUCT",font1));
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
    
    PdfPTable tableFR = new PdfPTable(4);
	tableFR.setWidthPercentage(100.0f);
	tableFR.setWidths(new float[] {2.0f, 3.0f,2.0f, 3.0f});
	tableFR.setSpacingBefore(10);
	
	
	Font font = FontFactory.getFont("Times-Roman");
	font.setColor(BaseColor.BLACK);
	
	PdfPCell cell = new PdfPCell();
	cell.setBackgroundColor(BaseColor.WHITE);
	cell.setPadding(5);
	
	cell.setPhrase(new Phrase("Product Code:", font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableFR.addCell(cell);
	
	cell.setPhrase(new Phrase(createNewProduct.getProductCode(),font));
	cell.setBorder(Rectangle.NO_BORDER);
	tableFR.addCell(cell);
	
	
	cell.setPhrase(new Phrase("Product Name:", font));
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableFR.addCell(cell);
	
	
	cell.setPhrase(new Phrase(createNewProduct.getTxtName(),font));
	cell.setBorder(Rectangle.NO_BORDER);
	cell.setMinimumHeight(25f);
	tableFR.addCell(cell);
	
	doc.add(tableFR);
	
	
			
			PdfPTable tableWR = new PdfPTable(4);
			tableWR.setWidthPercentage(100.0f);
			tableWR.setWidths(new float[] {2.0f, 3.0f,2.0f, 3.0f});
			tableWR.setSpacingBefore(10);
			
			cell.setPhrase(new Phrase("Description:",font));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableWR.addCell(cell);
			
			
			cell.setPhrase(new Phrase(createNewProduct.getTxtDes(),font));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableWR.addCell(cell);
			
			cell.setPhrase(new Phrase("Unit Of Measure:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableWR.addCell(cell);
			
			cell.setPhrase(new Phrase(createNewProduct.getTxtUnitOfMeasure(),font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableWR.addCell(cell);
			
			doc.add(tableWR);
			
				
			PdfPTable tableHR = new PdfPTable(4);
			tableHR.setWidthPercentage(100.0f);
			tableHR.setWidths(new float[] {2.0f,3.0f,2.0f, 3.0f});
			tableHR.setSpacingBefore(10);
			
			cell.setPhrase(new Phrase("Stock:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableHR.addCell(cell);
			
			cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtOpeningStock())));
			cell.setBorder(Rectangle.NO_BORDER);
			tableHR.addCell(cell);
			
			
			cell.setPhrase(new Phrase("Reorder Level:",font));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableHR.addCell(cell);
			
			
			cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtReorderlevel())));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableHR.addCell(cell);

			doc.add(tableHR);

			String product_Type=createNewProduct.getProductType();
			
 			if(product_Type.equalsIgnoreCase("Resale Product"))
			{ 
				
			PdfPTable tableSOR = new PdfPTable(4);
			tableSOR.setWidthPercentage(100.0f);
			tableSOR.setWidths(new float[] {2.0f, 3.0f,2.0f, 3.0f});
			tableSOR.setSpacingBefore(10);
			
			cell.setPhrase(new Phrase("Sales Price:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			tableSOR.addCell(cell);
			
			cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtSalesPrice())));
			cell.setBorder(Rectangle.NO_BORDER);
			tableSOR.addCell(cell);
			
			
			cell.setPhrase(new Phrase("Purchase Price:", font));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableSOR.addCell(cell);
			
			
			cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtPurchasePrice())));
			cell.setBorder(Rectangle.NO_BORDER);
			cell.setMinimumHeight(25f);
			tableSOR.addCell(cell);

			doc.add(tableSOR);
			}
			else if(product_Type.equalsIgnoreCase("Purchase Item"))
			{
				PdfPTable tablePR = new PdfPTable(4);
				tablePR.setWidthPercentage(100.0f);
				tablePR.setWidths(new float[] {2.0f, 3.0f,2.0f, 3.0f});
				tablePR.setSpacingBefore(10);
				
				cell.setPhrase(new Phrase("Purchase Price:", font));
				cell.setBorder(Rectangle.NO_BORDER);
				tablePR.addCell(cell);
				
				cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtPurchasePrice())));
				cell.setBorder(Rectangle.NO_BORDER);
				tablePR.addCell(cell);
				
				
				cell.setPhrase(new Phrase());
				cell.setBorder(Rectangle.NO_BORDER);
				cell.setMinimumHeight(25f);
				tablePR.addCell(cell);
				
				
				cell.setPhrase(new Phrase());
				cell.setBorder(Rectangle.NO_BORDER);
				cell.setMinimumHeight(25f);
				tablePR.addCell(cell);
				
				doc.add(tablePR);
			}
			
			else if(product_Type.equalsIgnoreCase("Sale Item"))
			{
				
				PdfPTable tableSOR = new PdfPTable(4);
				tableSOR.setWidthPercentage(100.0f);
				tableSOR.setWidths(new float[] {2.0f, 3.0f,2.0f, 3.0f});
				tableSOR.setSpacingBefore(10);
				
				cell.setPhrase(new Phrase("Sales Price:", font));
				cell.setBorder(Rectangle.NO_BORDER);
				tableSOR.addCell(cell);
				
				cell.setPhrase(new Phrase(Convert.toString(createNewProduct.getTxtSalesPrice())));
				cell.setBorder(Rectangle.NO_BORDER);
				tableSOR.addCell(cell);
				
				
				cell.setPhrase(new Phrase());
				cell.setBorder(Rectangle.NO_BORDER);
				cell.setMinimumHeight(25f);
				tableSOR.addCell(cell);
				
				
				cell.setPhrase(new Phrase());
				cell.setBorder(Rectangle.NO_BORDER);
				cell.setMinimumHeight(25f);
				tableSOR.addCell(cell);

				doc.add(tableSOR);
				
				PdfPTable tableDetails = new PdfPTable(5);
				tableDetails.setWidthPercentage(100.0f);
				tableDetails.setWidths(new float[] {1.0f, 2.0f, 2.0f, 2.0f,2.0f});
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
				
				cell1.setPhrase(new Phrase("Product", font11));
				tableDetails.addCell(cell1);
				
				cell1.setPhrase(new Phrase("Unit", font11));
				tableDetails.addCell(cell1);

				cell1.setPhrase(new Phrase("Description", font11));
				tableDetails.addCell(cell1);
				
				cell1.setPhrase(new Phrase("Quantity", font11));
				tableDetails.addCell(cell1);
				
				List<Details> salesDetails=new ArrayList<Details>();		
				salesDetails.addAll(createNewProduct.getCreateNewPdetails());
				for(Details details : salesDetails)
				{
					PdfPCell cell20 = new PdfPCell();
					cell20.setPhrase(new Phrase(Convert.toString(details.getTxtSrNo1()), font));
					cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
					tableDetails.addCell(cell20);
					
					PdfPCell cellit = new PdfPCell();
					cellit.setPhrase(new Phrase(details.getTxtItem1(), font));
					tableDetails.addCell(cellit);	
					
					PdfPCell cellunt = new PdfPCell();
					cellunt.setPhrase(new Phrase(Convert.toString(details.getUnit()), font));
					tableDetails.addCell(cellunt);	
					
					PdfPCell celldes = new PdfPCell();
					celldes.setPhrase(new Phrase(details.getDecription(), font));
					tableDetails.addCell(celldes);

					PdfPCell cell21 = new PdfPCell();
					cell21.setPhrase(new Phrase(Convert.toString(details.getQuantity()), font));
					cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
					tableDetails.addCell(cell21);
				}
				doc.add(tableDetails);
			}
  
	}

	}
