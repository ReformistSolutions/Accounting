package com.invoice.inventory.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.inventory.beans.Production;
import com.invoice.inventory.beans.ProductionDetails;
import com.invoice.inventory.beans.RawMaterialDetails;
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



public class ProductionOrderPdf extends AbstractPdfView   {

	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		PdfWriter.getInstance(doc, new FileOutputStream(System.getProperty("user.dir")+"/Production Order.pdf"));      
        doc.open();
	
        doc.addTitle("Production Order");
        
	Production production=(Production) model.get("production");
	
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
		cell3.setPhrase(new Phrase("PRODUCTION ORDER",font1));	
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
  		 Font(FontFamily.HELVETICA, 15, Font.BOLD, new BaseColor(38,114,236)) );
  
	 Paragraph p2 = new Paragraph(cid.getCompDesc()+"\n\n"+cid.getCompAddress()+"\n\nContact No :  "+cid.getContactNo()+"                                                                                            "+"Email :  "+cid.getEmail()+"\n"+" ", new
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
tabled.setTotalWidth(new float[]{ 70, 70, 70 });
tabled.setLockedWidth(true);
tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
PdfPCell celld1,celld2,celld3;

celld1 = new PdfPCell(new Phrase("Production No    :"+"   "+production.getProductionID(),font));
celld1.setColspan(3);
tabled.addCell(celld1);

if(production.getProductionstatus().equalsIgnoreCase("P"))
{
	celld2 = new PdfPCell(new Phrase("Order Status       :"+"   "+"Pending",font));
	celld2.setColspan(3);
	tabled.addCell(celld2);	
}
else
{
	celld2 = new PdfPCell(new Phrase("Order Status       :"+"   "+"Completed",font));
	celld2.setColspan(3);
	tabled.addCell(celld2);	
}	        
if(production.getSorderId().length() > 1)
{
	celld3 = new PdfPCell(new Phrase("Sales Order No  :"+"   "+production.getSorderId(),font));
	celld3.setColspan(3);
	tabled.addCell(celld3);	
}
else
{
	celld3 = new PdfPCell(new Phrase("Sales Order No  :"+"   "+"Direct Order",font));
	celld3.setColspan(3);
	tabled.addCell(celld3);
}


PdfPTable tabledd = new PdfPTable(3);
tabledd.setTotalWidth(new float[]{ 70, 70, 70 });
tabledd.setLockedWidth(true);
tabledd.setHorizontalAlignment(Element.ALIGN_RIGHT);		        
PdfPCell celld11,celld12;

celld11 = new PdfPCell(new Phrase("Date            :"+"      "+production.getProdDate(),font));
celld11.setColspan(3);
tabledd.addCell(celld11);	

if(production.getProductionstatus().equalsIgnoreCase("C"))
{
	celld12 = new PdfPCell(new Phrase("Completed Date    :"+"      "+production.getCompletedDate(),font));
	celld12.setColspan(3);
	tabledd.addCell(celld12);
}


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
tableBlf1.addCell(cell);

doc.add(tableBlf1);

//define font for table header row
	Font font11 = FontFactory.getFont("Times-Roman",12,Font.BOLD);
	font11.setColor(BaseColor.BLACK);

	PdfPTable tableDetails = new PdfPTable(5);
	tableDetails.setWidthPercentage(100.0f);
	tableDetails.setHeaderRows(1);
	tableDetails.setWidths(new float[] {1.2f, 3.0f, 3.5f, 1.8f, 1.8f});
	tableDetails.setSpacingBefore(10);
	
	
	
	// define table header cell
	PdfPCell cell1 = new PdfPCell();
	cell1.setBackgroundColor(new BaseColor(204, 204, 255));
	cell1.setPadding(5);
	
	// write table header 
	cell1.setPhrase(new Phrase("Sr No", font11));		
	tableDetails.addCell(cell1);
	
	cell1.setPhrase(new Phrase("Product Name", font11));
	tableDetails.addCell(cell1);

	cell1.setPhrase(new Phrase("Description", font11));
	tableDetails.addCell(cell1);
	
	cell1.setPhrase(new Phrase("Unit", font11));
	tableDetails.addCell(cell1);
	
	cell1.setPhrase(new Phrase("Quantity", font11));
	tableDetails.addCell(cell1);
	
	List<ProductionDetails> productionList=new ArrayList<ProductionDetails>();		
	productionList.addAll(production.getProductList());
	for(ProductionDetails productList : productionList)
	{
		
		PdfPCell cell20 = new PdfPCell();
		cell20.setBackgroundColor(new BaseColor(204, 255, 229));
		cell20.setPhrase(new Phrase(Convert.toString(productList.getSrNo()), font));
		cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
		tableDetails.addCell(cell20);
		
		PdfPCell cellit = new PdfPCell();
		cellit.setBackgroundColor(new BaseColor(204, 255, 229));
		cellit.setPhrase(new Phrase(productList.getProductName(), font));
		tableDetails.addCell(cellit);	
		
		PdfPCell celldes = new PdfPCell();
		celldes.setBackgroundColor(new BaseColor(204, 255, 229));
		celldes.setPhrase(new Phrase(productList.getDesc(), font));
		tableDetails.addCell(celldes);		
		

		PdfPCell cellmunit = new PdfPCell();
		cellmunit.setBackgroundColor(new BaseColor(204, 255, 229));
		cellmunit.setPhrase(new Phrase(productList.getUnit(), font));
		tableDetails.addCell(cellmunit);

		PdfPCell cell21 = new PdfPCell();
		cell21.setBackgroundColor(new BaseColor(204, 255, 229));
		cell21.setPhrase(new Phrase(Convert.toString(productList.getQuantity()), font));
		cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
		tableDetails.addCell(cell21);

		PdfPCell cellRawM = new PdfPCell();
		cellRawM.setColspan(6);
		
		//Raw Material Table
		PdfPTable rawMaterialTable = new PdfPTable(6);
		rawMaterialTable.setWidthPercentage(100.0f);
		rawMaterialTable.setHeaderRows(1);
		rawMaterialTable.setWidths(new float[] {1.5f, 3.8f, 3.5f, 1.8f, 1.8f, 1.8f});
		//rawMaterialTable.setSpacingBefore(10);

		// define font for table header row
		/*Font font11 = FontFactory.getFont("Times-Roman");
		font11.setColor(BaseColor.BLACK);*/

		// define table header cell
		PdfPCell cell11 = new PdfPCell();
		cell11.setPadding(5);

		// write table header 
		cell11.setPhrase(new Phrase("Sr No", font11));		
		rawMaterialTable.addCell(cell11);

		cell11.setPhrase(new Phrase("Product Name", font11));
		rawMaterialTable.addCell(cell11);

		cell11.setPhrase(new Phrase("Description", font11));
		rawMaterialTable.addCell(cell11);
		
		cell11.setPhrase(new Phrase("Unit", font11));
		rawMaterialTable.addCell(cell11);

		cell11.setPhrase(new Phrase("Re.Qty", font11));
		rawMaterialTable.addCell(cell11);

		cell11.setPhrase(new Phrase("Total Qty", font11));
		rawMaterialTable.addCell(cell11);

		List<RawMaterialDetails> rawMaterialList=new ArrayList<RawMaterialDetails>();		
		rawMaterialList.addAll(production.getRawMaterialList());
		for(RawMaterialDetails rMList : rawMaterialList)
		{
			if(rMList.getProductId().equals(productList.getProductId()))
			{				
				PdfPCell cell201 = new PdfPCell();
				cell201.setPhrase(new Phrase(Convert.toString(rMList.getSrno()), font));
				cell201.setHorizontalAlignment(Element.ALIGN_RIGHT);
				rawMaterialTable.addCell(cell201);
				
				PdfPCell cellit1 = new PdfPCell();
				cellit1.setPhrase(new Phrase(rMList.getProductName(), font));
				rawMaterialTable.addCell(cellit1);	
				
				PdfPCell celldes1 = new PdfPCell();
				celldes1.setPhrase(new Phrase(rMList.getDesc(), font));
				rawMaterialTable.addCell(celldes1);	
				
				PdfPCell cellunit = new PdfPCell();
				cellunit.setPhrase(new Phrase(rMList.getUnitm(), font));
				rawMaterialTable.addCell(cellunit);	
	
				PdfPCell cell211 = new PdfPCell();
				cell211.setPhrase(new Phrase(Convert.toString(rMList.getReqty()), font));
				cell211.setHorizontalAlignment(Element.ALIGN_RIGHT);
				rawMaterialTable.addCell(cell211);				
	
				PdfPCell cellQty = new PdfPCell();
				cellQty.setPhrase(new Phrase(Convert.toString(rMList.getQuantity()), font));
				cellQty.setHorizontalAlignment(Element.ALIGN_RIGHT);
				rawMaterialTable.addCell(cellQty);
			}
		}

		
		cellRawM.addElement(rawMaterialTable);
			
		tableDetails.addCell(cellRawM);
		
	}
	doc.add(tableDetails);
	/*int x=1,y=1;
	 PdfPTable table = new PdfPTable(2);
     table.setTotalWidth(527);
     table.setLockedWidth(true);
     table.getDefaultCell().setFixedHeight(20);
     table.getDefaultCell().setBorder(Rectangle.BOTTOM);
     table.addCell("Reformist Solutions");
     table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
     table.addCell(String.format("Page %d of %d", x, y));
     table.setHorizontalAlignment(Element.ALIGN_BASELINE);
     doc.add(table);
     x++;y++;*/
	

doc.close();
}
}