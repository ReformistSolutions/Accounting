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
import com.invoice.sales.beans.Details;
import com.invoice.sales.beans.LinkedTaxDetails;
import com.invoice.sales.beans.Order;
import com.invoice.sales.beans.TaxDetailsList;
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

public class SalesOrderPdf extends AbstractPdfView {

	@Override
	public void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		 PdfWriter.getInstance(doc, new FileOutputStream(System.getProperty("user.dir")+"/Sales Order.pdf"));      
	        doc.open();
	        
			Order salesOrder=(Order) model.get("salesOrder");

			CompanyDetails cid=(CompanyDetails) model.get("compInfo");
			
			PdfPTable tableHD = new PdfPTable(5);
			tableHD.setWidthPercentage(100.0f);
			tableHD.setWidths(new float[] {2.0f, 2.0f, 3.0f,2.0f, 2.0f});
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
				cell3.setPhrase(new Phrase("SALES  ORDER",font1));			
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
	    PdfPCell celld1,celld2,celld3,celld4;
	    
	    celld1 = new PdfPCell(new Phrase("Customer Name      : "+"   "+salesOrder.getTxtCName(),font));
	    celld1.setColspan(3);
	    tabled.addCell(celld1);
	    
	    celld2 = new PdfPCell(new Phrase("Billing Address       : "+"   "+salesOrder.getTxtBillAddr(),font));
	    celld2.setColspan(3);
	    tabled.addCell(celld2);		        
	    
	    celld3 = new PdfPCell(new Phrase("Shipping Address    : "+"   "+salesOrder.getTxtShipAddr(),font));
	    celld3.setColspan(3);
	    tabled.addCell(celld3);		
	    
	    celld4 = new PdfPCell(new Phrase("Party VAT TIN No : "+"   "+salesOrder.getCustVatNo(),font));
	    celld4.setColspan(3);
	    tabled.addCell(celld4);
	  
	    
	   // doc.add(tabled);
	    
	    
	    PdfPTable tabledd = new PdfPTable(3);
	    tabledd.setTotalWidth(new float[]{ 70, 70, 70 });
	    tabledd.setLockedWidth(true);
	    tabledd.setHorizontalAlignment(Element.ALIGN_RIGHT);		        
	    PdfPCell celld12,celld13,celld14;
	    
	   /* celld11 = new PdfPCell(new Phrase("Invoice No :-"+"       "+salesOrder.getTxtInvID(),font));
	    celld11.setColspan(3);
	    tabledd.addCell(celld11);*/
	    
	    celld12 = new PdfPCell(new Phrase("Order No    : "+"      "+salesOrder.getTxtSOID(),font));
	    celld12.setColspan(3);
	    tabledd.addCell(celld12);
	     
	    celld12 = new PdfPCell(new Phrase("P.O. No      : "+"      "+salesOrder.getTxtCPONo(),font));
	    celld12.setColspan(3);
	    tabledd.addCell(celld12);
	    
	    celld13 = new PdfPCell(new Phrase("Date            : "+"      "+salesOrder.getTxtDate(),font));
	    celld13.setColspan(3);
	    tabledd.addCell(celld13);		
	    
	    celld14 = new PdfPCell(new Phrase("Due Date    : "+"      "+salesOrder.getTxtDueDate(),font));
	    celld14.setColspan(3);
	    tabledd.addCell(celld14);
	  
	    
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

	    PdfPTable tableBlf1 = new PdfPTable(1);
		tableBlf1.setWidthPercentage(70.0f);
		tableBlf1.setWidths(new float[] {2.0f});
		tableBlf1.setSpacingBefore(10);

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		//cell.setMinimumHeight(30);
		tableBlf1.addCell(cell);
		
		doc.add(tableBlf1);
	    
			
			PdfPTable tableDetails = new PdfPTable(7);
			tableDetails.setWidthPercentage(100.0f);
			tableDetails.setHeaderRows(1);
			tableDetails.setWidths(new float[] {1.5f, 3.0f, 3.5f, 1.8f, 1.8f,2.2f, 2.5f});
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

			cell1.setPhrase(new Phrase("Description", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("M.Unit", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Quantity", font11));
			tableDetails.addCell(cell1);
			
			cell1.setPhrase(new Phrase("Unit Price", font11));
			tableDetails.addCell(cell1);		
			
			
			cell1.setPhrase(new Phrase("Total", font11));
			tableDetails.addCell(cell1);
			
			List<Details> ordProductList=new ArrayList<Details>();		
			ordProductList.addAll(salesOrder.getProductList());
			//int flag=0;
			for(Details productList : ordProductList)
			{
				
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(productList.getSrNo()), font));
				cell20.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell20);
				
				PdfPCell cellit = new PdfPCell();
				cellit.setPhrase(new Phrase(productList.getItemCode(), font));
				tableDetails.addCell(cellit);	
				
				PdfPCell celldes = new PdfPCell();
				celldes.setPhrase(new Phrase(productList.getDes(), font));
				tableDetails.addCell(celldes);
				
				PdfPCell cellum = new PdfPCell();
				cellum.setPhrase(new Phrase(productList.getUnit(), font));
				tableDetails.addCell(cellum);


				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(productList.getQuantity()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell21);
				
				PdfPCell cell22 = new PdfPCell();
				cell22.setPhrase(new Phrase(Convert.toString(productList.getUnitPrice()), font));
				cell22.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell22);
			
				
				PdfPCell cell25 = new PdfPCell();
				cell25.setPhrase(new Phrase(Convert.toString(productList.getItemTotal()), font));
				cell25.setHorizontalAlignment(Element.ALIGN_RIGHT);
				tableDetails.addCell(cell25);
			}
			
			doc.add(tableDetails);
			
			/*PdfPTable tableTaxDetails = new PdfPTable(2);
			tableTaxDetails.setWidthPercentage(100.0f);		
			tableTaxDetails.setWidths(new float[] {5.0f, 2.5f});		
			
			
			List<TaxDetailsList> ordTaxList=new ArrayList<TaxDetailsList>();		
			ordTaxList.addAll(salesOrder.getTaxList());		
			for(TaxDetailsList tList : ordTaxList)
			{
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(tList.getTaxType()+" @ "+tList.getTaxRate()+"%"), font));			
				
				tableTaxDetails.addCell(cell20);			
				
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(tList.getTxtTaxValue()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);			
				tableTaxDetails.addCell(cell21);
			}
			
			PdfPTable tableLinkedTaxDetails = new PdfPTable(2);
			tableLinkedTaxDetails.setWidthPercentage(100.0f);		
			tableLinkedTaxDetails.setWidths(new float[] {5.0f, 2.5f});
			
			
			List<LinkedTaxDetails> ordLinkedTaxList=new ArrayList<LinkedTaxDetails>();		
			ordLinkedTaxList.addAll(salesOrder.getLinkedTaxList());	
			for(LinkedTaxDetails lTList : ordLinkedTaxList)
			{
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(lTList.getLinkedTaxName()+" @ "+lTList.getLinkedTaxRate()+"%"), font));
				cell20.setBorderWidthLeft(0);			
				cell20.setBorderWidthTop(0);
				tableLinkedTaxDetails.addCell(cell20);			
				
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(lTList.getSerLinkedTax()), font));
				cell21.setBorderWidthLeft(0);			
				cell21.setBorderWidthTop(0);
				cell21.setBorderWidthRight(0);
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);			
				tableLinkedTaxDetails.addCell(cell21);
			}
			
			
			
					 PdfPTable table = new PdfPTable(2);
				        table.setWidthPercentage(50.0f);
				        table.setWidths(new float[]{5.0f, 2.5f});
				        
				        //table.addCell(new Phrase());
				        table.addCell(new Phrase("Sub Total",font));
				        PdfPCell stCell=new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtSubTotal()),font));
				        stCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        table.addCell(stCell);
				       // table.addCell(new Phrase());
				        table.addCell(new Phrase("Discount Type",font));
				        String rd=Convert.toString(salesOrder.getRadio());
				        if(rd.equals("per")){
					        PdfPCell vtCell=new PdfPCell(new Phrase("Percentage(%)",font));			       
					        vtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					        table.addCell(vtCell);
				        }
				        else
				        {
				        	PdfPCell vtCell=new PdfPCell(new Phrase("Amount",font));			       
					        vtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					        table.addCell(vtCell);
				        }
				       // PdfPCell celln = new PdfPCell(new Phrase());
				        //celln.setHorizontalAlignment(Element.ALIGN_JUSTIFIED_ALL);
				       // celln.setRowspan(7);	
				       // celln.setBorderWidthBottom(0.5f);
				       // table.addCell(celln);
				      
				        table.addCell(new Phrase("Dicount Value",font));	
				        PdfPCell serCell = new PdfPCell(new Phrase(new Phrase(Convert.toString(salesOrder.getTxtDiscount()),font)));
				        serCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        table.addCell(serCell);
				       
				        table.addCell(new Phrase("Charges",font));
				        PdfPCell chrCell =new PdfPCell(new Phrase(Convert.toString(salesEstimate.getTxtTransCost()),font));
				        chrCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        table.addCell(chrCell);
				        
				        table.addCell(new Phrase("Discounted Total",font));	
				        PdfPCell disCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtDisTotal()),font));
				        disCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        table.addCell(disCell);			        
				       
				        PdfPCell taxCell =new PdfPCell();			        
				        taxCell.setColspan(2);			       
				        taxCell.addElement(tableTaxDetails);
				        table.addCell(taxCell);
				        
				        PdfPCell linkedTaxCell =new PdfPCell();			        
				        linkedTaxCell.setColspan(2);
				        linkedTaxCell.addElement(tableLinkedTaxDetails);
				        table.addCell(linkedTaxCell);
				      
				        PdfPCell gtlCell =new PdfPCell(new Phrase("Amount Payable",font));			      
				        //gtlCell.setBorder(1);
				        table.addCell(gtlCell);
				        PdfPCell gtCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtAmtPayble()),font));
				        gtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);			        
				       // gtCell.setBorder(1);
				        table.addCell(gtCell);
				        
				        table.setHorizontalAlignment(Element.ALIGN_RIGHT);
				        doc.add(table);*/
				      
			

			PdfPTable tableTaxDetails = new PdfPTable(2);
			tableTaxDetails.setWidthPercentage(100.0f);		
			tableTaxDetails.setWidths(new float[] {2.1f, 1.2f});		
			
			
			List<TaxDetailsList> estTaxList=new ArrayList<TaxDetailsList>();		
			estTaxList.addAll(salesOrder.getTaxList());		
			for(TaxDetailsList tList : estTaxList)
			{
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(tList.getTaxType()+" @ "+tList.getTaxRate()+"%"), font));			
				
				tableTaxDetails.addCell(cell20);			
				
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(tList.getTxtTaxValue()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);			
				tableTaxDetails.addCell(cell21);
			}
			
			PdfPTable tableLinkedTaxDetails = new PdfPTable(2);
			tableLinkedTaxDetails.setWidthPercentage(100.0f);		
			tableLinkedTaxDetails.setWidths(new float[] {2.1f, 1.2f});
			
			
			List<LinkedTaxDetails> estLinkedTaxList=new ArrayList<LinkedTaxDetails>();		
			estLinkedTaxList.addAll(salesOrder.getLinkedTaxList());	
			for(LinkedTaxDetails lTList : estLinkedTaxList)
			{
				PdfPCell cell20 = new PdfPCell();
				cell20.setPhrase(new Phrase(Convert.toString(lTList.getLinkedTaxName()+" @ "+lTList.getLinkedTaxRate()+"%"), font));
				tableLinkedTaxDetails.addCell(cell20);			
				
				PdfPCell cell21 = new PdfPCell();
				cell21.setPhrase(new Phrase(Convert.toString(lTList.getSerLinkedTax()), font));
				cell21.setHorizontalAlignment(Element.ALIGN_RIGHT);			
				tableLinkedTaxDetails.addCell(cell21);
			}
					
			PdfPTable table = new PdfPTable(3);
	        table.setWidthPercentage(100.0f);
	        table.setWidths(new float[]{5.0f, 2.1f, 1.2f});
	        
	        PdfPCell celln = new PdfPCell(new Phrase("Notes :\n\n"+"\t"+salesOrder.getTxtpubNotes()));	     
	        celln.setRowspan(9);		      
	        table.addCell(celln);
	        table.addCell(new Phrase("Sub Total",font));
	        PdfPCell stCell=new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtSubTotal()),font));
	        stCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	        table.addCell(stCell);	      
	        String rd=Convert.toString(salesOrder.getRadio());
	        if(rd.equals("per"))
	        {
	        	 table.addCell(new Phrase("Discount",font));
		        PdfPCell vtCell=new PdfPCell(new Phrase("@"+salesOrder.getTxtDiscount() +"%",font));			       
		        vtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(vtCell);
		        
		        table.addCell(new Phrase("Charges",font));
		        PdfPCell chrCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtTransCost()),font));
		        chrCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(chrCell);
		        
		        table.addCell(new Phrase("Discounted Total",font));	
		        PdfPCell disCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtDisTotal()),font));
		        disCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(disCell);			        
		       
		        PdfPCell taxCell =new PdfPCell();			        
		        taxCell.setColspan(2);
		        taxCell.addElement(tableTaxDetails);
		        table.addCell(taxCell);
		        
		        PdfPCell linkedTaxCell =new PdfPCell();			        
		        linkedTaxCell.setColspan(2);
		        linkedTaxCell.addElement(tableLinkedTaxDetails);
		        table.addCell(linkedTaxCell);
		      
		        PdfPCell gtlCell =new PdfPCell(new Phrase("Amount Payable",font));			      
		        //gtlCell.setBorder(1);
		        table.addCell(gtlCell);
		        PdfPCell gtCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtAmtPayble()),font));
		        gtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);			        
		       // gtCell.setBorder(1);
		        table.addCell(gtCell);
		        
	        }
	        else if(rd.equals("amt"))
	        {
	        	table.addCell(new Phrase("Discount",font));
	        	PdfPCell vtCell=new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtDiscount()),font));			       
		        vtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(vtCell);
		        
		        table.addCell(new Phrase("Charges",font));
		        PdfPCell chrCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtTransCost()),font));
		        chrCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(chrCell);
		        
		        table.addCell(new Phrase("Total",font));	
		        PdfPCell disCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtDisTotal()),font));
		        disCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
		        table.addCell(disCell);			        
		       
		        PdfPCell taxCell =new PdfPCell();			        
		        taxCell.setColspan(2);
		        taxCell.addElement(tableTaxDetails);
		        table.addCell(taxCell);
		        
		        PdfPCell linkedTaxCell =new PdfPCell();			        
		        linkedTaxCell.setColspan(2);
		        linkedTaxCell.addElement(tableLinkedTaxDetails);
		        table.addCell(linkedTaxCell);
		      
		        PdfPCell gtlCell =new PdfPCell(new Phrase("Amount Payable",font));			      
		        //gtlCell.setBorder(1);
		        table.addCell(gtlCell);
		        PdfPCell gtCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtAmtPayble()),font));
		        gtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);			        
		       // gtCell.setBorder(1);
		        table.addCell(gtCell);
		        
	        }
	        else
	        {
	        	table.addCell(new Phrase("Charges",font));
	 	        PdfPCell chrCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtTransCost()),font));
	 	        chrCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	 	        table.addCell(chrCell);
	 	        
	 	       PdfPCell dtCell =new PdfPCell(new Phrase("Total",font));	
	 	       dtCell.setRowspan(2);
	 	        table.addCell(dtCell);
	 	        PdfPCell disCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtDisTotal()),font));
	 	       disCell.setRowspan(2);
	 	        disCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	 	        table.addCell(disCell);			        
	 	       
	 	        PdfPCell taxCell =new PdfPCell();			        
	 	        taxCell.setColspan(2);
	 	        taxCell.addElement(tableTaxDetails);
	 	        table.addCell(taxCell);
	 	        
	 	        PdfPCell linkedTaxCell =new PdfPCell();			        
	 	        linkedTaxCell.setColspan(2);
	 	        linkedTaxCell.addElement(tableLinkedTaxDetails);
	 	        table.addCell(linkedTaxCell);
	 	      
	 	        PdfPCell gtlCell =new PdfPCell(new Phrase("Amount Payable",font));			      
	 	        //gtlCell.setBorder(1);
	 	        table.addCell(gtlCell);
	 	        PdfPCell gtCell =new PdfPCell(new Phrase(Convert.toString(salesOrder.getTxtAmtPayble()),font));
	 	        gtCell.setHorizontalAlignment(Element.ALIGN_RIGHT);			        
	 	       // gtCell.setBorder(1);
	 	        table.addCell(gtCell);
	        }
	        
	        doc.add(table);
				      
				      /*  PdfPTable tablel = new PdfPTable(3);
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
				        
				        
				       doc.add(tablel);*/
				        
				        

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
							
							
							cellPS.setPhrase(new Phrase("Public Notes :-", font));
							cellPS.setBorder(Rectangle.NO_BORDER);
							tablePN.addCell(cellPS);
							
							cellPS.setPhrase(new Phrase(salesOrder.getTxtpubNotes(),font));
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
							/*PdfPTable tableBl12 = new PdfPTable(1);
							tableBl12.setWidthPercentage(70.0f);
							tableBl12.setWidths(new float[] {2.0f});
							tableBl12.setSpacingBefore(10);
						
							cell.setPhrase(new Phrase());
							cell.setBorder(Rectangle.NO_BORDER);
							cell.setMinimumHeight(140);
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
					        
					doc.add(tblFooterdt); 
				*/
				
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