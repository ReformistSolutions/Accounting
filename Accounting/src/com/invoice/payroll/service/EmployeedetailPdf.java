package com.invoice.payroll.service;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jpath.adapter.Convert;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.payroll.beans.EmployeeBeans;
import com.invoice.payroll.beans.SalaryBeans;
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

public class EmployeedetailPdf extends AbstractPdfView 
{
		
	@SuppressWarnings("unused")
	@Override
	public void buildPdfDocument(Map<String, Object> model, Document doc,
			PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception 
			{
			
			final String path = System.getProperty("user.dir");
			PdfWriter.getInstance(doc, new FileOutputStream(path+"/Salary Slip.pdf"));
			doc.open();
			
			EmployeeBeans employeeBeans=(EmployeeBeans) model.get("employeedetail");
			Object eAmt =  model.get("eAmt");
			Object dAmt =  model.get("dAmt");
			Object nList = model.get("nList");
			
			//SalaryBeans salaryBeans = (SalaryBeans) model.get("eList");
			
			//SalaryBeans salaryBeans1 = (SalaryBeans) model.get("dList");  
			CompanyDetails cid=(CompanyDetails) model.get("compInfo");
			
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
		    //int month = cal.get(Calendar.MONTH)+1;
			
			/*salList.add(salaryBeans);
				for(int i=0;i<=salList.size();i++)
				{ 					
					for (SalaryBeans eList : salList)
					{	
						System.out.println(eList.getPayamt());
						System.out.println(eList.getPayheadname());
					}
				}*/
				
			 Paragraph p = new Paragraph("\n"+cid.getCompName(), new
	      		 Font(FontFamily.HELVETICA, 12, Font.BOLD, new BaseColor(38,114,236)) );
	      
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
			        
			    	PdfPTable tableHD = new PdfPTable(5);
					tableHD.setWidthPercentage(100.0f);
					tableHD.setWidths(new float[] {2.0f, 2.0f, 6.0f,2.0f, 2.0f});
					tableHD.setSpacingBefore(10);
						
					// define font for table header row
						Font font1 = FontFactory.getFont("Times-Roman",11,Font.UNDERLINE);
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
						cell3.setPhrase(new Phrase("Salary Slip for the period of"+" "+new SimpleDateFormat("MMMMMMM").format(cal.getTime())+" "+year,font1));			
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
					
			        
						PdfPTable tableBlf11 = new PdfPTable(1);
						tableBlf11.setWidthPercentage(100f);
						tableBlf11.setWidths(new float[] {2.0f});
						tableBlf11.setSpacingBefore(10);

						PdfPCell cellb=new PdfPCell();
						cellb.setPhrase(new Phrase());
						cellb.setBackgroundColor(BaseColor.WHITE);
						cellb.setBorder(com.itextpdf.text.Rectangle.NO_BORDER);
						cellb.setMinimumHeight(20);
						tableBlf11.addCell(cellb);
						
						doc.add(tableBlf11);
						
			        
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

		
		PdfPTable tableBlf112 = new PdfPTable(1);
		tableBlf112.setWidthPercentage(100f);
		tableBlf112.setWidths(new float[] {2.0f});
		tableBlf112.setSpacingBefore(10);

		PdfPCell cellb2=new PdfPCell();
		cellb2.setPhrase(new Phrase());
		cellb2.setBackgroundColor(BaseColor.WHITE);
		cellb2.setBorder(com.itextpdf.text.Rectangle.NO_BORDER);
		cellb2.setMinimumHeight(20);
		tableBlf112.addCell(cellb2);
		
		doc.add(tableBlf112);
		
			          
			        Font font = FontFactory.getFont("Times-Roman");
			    	font.setColor(BaseColor.BLACK);	
			    	
			    	PdfPTable tabled = new PdfPTable(3);	
			    	tabled.setTotalWidth(new float[]{ 60, 60, 60 });
			    	tabled.setLockedWidth(true);
			    	
			    	tabled.setHorizontalAlignment(Element.ALIGN_LEFT);
			    	/*tabled.getDefaultCell().setBorderWidth(2);*/
			    	Font f1 = FontFactory.getFont("Times-Roman");
			    	f1.setColor(BaseColor.BLACK);
			    	    PdfPCell celld1,celld2,celld3,celld4;
			    	    
			    	    celld1 = new PdfPCell(new Phrase("Employee ID:"+""+employeeBeans.getEmpId(),f1));
			    	    celld1.setColspan(3);	
			    	    celld1.setBorder(0);
			    	    tabled.addCell(celld1);
			    	    
			    	    celld2 = new PdfPCell(new Phrase("Department:"+""+employeeBeans.getDept(),f1));
			    	    celld2.setColspan(3);
			    	    celld2.setBorder(0);
			    	    tabled.addCell(celld2);	         
			    	    
			    	    celld3 = new PdfPCell(new Phrase("PF Account Number:"+""+employeeBeans.getTxtPFNo(),f1));
			    	    celld3.setColspan(3);
			    	    celld3.setBorder(0);
			    	    tabled.addCell(celld3);
			    	    
			    	    celld4 = new PdfPCell(new Phrase("ESI Account Number:"+""+employeeBeans.getTxtEsi(),f1));
			    	    celld4.setColspan(3);
			    	    celld4.setBorder(0);
			    	    tabled.addCell(celld4);
			    	    
			    	   // doc.add(tabled);
			    	    
			    	    PdfPTable tabledd = new PdfPTable(3);
			    	    tabledd.setTotalWidth(new float[]{ 60, 60, 60 });
			    	    tabledd.setLockedWidth(true);
			    	    tabledd.setHorizontalAlignment(Element.ALIGN_RIGHT);	         
			    	    PdfPCell celld11,celld13,celld14,celld15;
			    	    
			    	    celld11 = new PdfPCell(new Phrase("Name:"+""+employeeBeans.getTxtfname()+" "+employeeBeans.getTxtmname()+" "+employeeBeans.getTxtlname(),f1));
			    	    celld11.setColspan(3);
			    	    celld11.setBorder(0);
			    	    tabledd.addCell(celld11);	    	   
			    	    
			    	    celld13 = new PdfPCell(new Phrase("Designation:"+""+employeeBeans.getDesignation(),f1));
			    	    celld13.setColspan(3);
			    	    celld13.setBorder(0);
			    	    tabledd.addCell(celld13);
			    	    
			    	    celld14 = new PdfPCell(new Phrase("Date of Joining:"+""+employeeBeans.getJDdt(),f1));
			    	    celld14.setColspan(3);
			    	    celld14.setBorder(0);
			    	    tabledd.addCell(celld14);
			    	    
			    	    celld15 = new PdfPCell(new Phrase("Bank Account Number:"+""+employeeBeans.getTxtBankNo(),f1));
			    	    celld15.setColspan(3);
			    	    celld15.setBorder(0);
			    	    tabledd.addCell(celld15);			    	    			    	    
			    	    
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
				    
				    PdfPTable tableBl1 = new PdfPTable(1);
					tableBl1.setWidthPercentage(70.0f);
					tableBl1.setWidths(new float[] {2.0f});
					tableBl1.setSpacingBefore(10);
				
					PdfPCell pcell = new PdfPCell(); 
					pcell.setPhrase(new Phrase());
					pcell.setBorder(Rectangle.NO_BORDER);
					pcell.setMinimumHeight(50);
					tableBl1.addCell(pcell);
					
					doc.add(tableBl1);
				    
				    List<SalaryBeans> salaryList = new ArrayList<SalaryBeans>();
		            List<SalaryBeans> salaryListE = new ArrayList<SalaryBeans>();
		            List<SalaryBeans> salaryListD = new ArrayList<SalaryBeans>();	            
		            salaryList.addAll(employeeBeans.getSalaryBeans());
		            for(SalaryBeans salaryBeans11 : salaryList)
					{
		            	if(salaryBeans11.getApplicable_type().equalsIgnoreCase("S"))
		            	{
		            		if(salaryBeans11.getPayheadtype().equalsIgnoreCase("Indirect Expenses"))
			            	{
			            		salaryListE.add(salaryBeans11);
			            	}
			            	else if(salaryBeans11.getPayheadtype().equalsIgnoreCase("Duties and Taxes"))
			            	{
			            		salaryListD.add(salaryBeans11);
			            	}
		            	}
		            	else if(salaryBeans11.getApplicable_type().equalsIgnoreCase("W"))
		            	{
		            		if(salaryBeans11.getPayheadtype().equalsIgnoreCase("Direct Expenses"))
			            	{
			            		salaryListE.add(salaryBeans11);
			            	}
			            	else if(salaryBeans11.getPayheadtype().equalsIgnoreCase("Duties and Taxes"))
			            	{
			            		salaryListD.add(salaryBeans11);
			            	}
		            	}
					}
		            int countE=salaryListE.size();
		            int countD=salaryListD.size();	            
		            int d=0;
		            int e=0;
				    
		            PdfPTable table11 = new PdfPTable(2);	
			    	table11.setHorizontalAlignment(Element.ALIGN_LEFT);
			    	Font ff = FontFactory.getFont("Times-Roman");
			    	ff.setColor(BaseColor.BLACK);
			    	    
			    	PdfPCell celldh;			    	    
			    	celldh = new PdfPCell(new Phrase("Earninig",ff));			    	    		    	   
		    	    table11.addCell(celldh);
			    	
		    	    PdfPCell cellh;			    	    
			    	cellh = new PdfPCell(new Phrase("Amount",ff));			    	    
		    	    table11.addCell(cellh);			    	
		            for(SalaryBeans salaryBeans11 : salaryList)
					{				       
		            	if(e < countE)
						{
						    	PdfPCell celld;			    	    
						    	celld = new PdfPCell(new Phrase(salaryListE.get(e).getPayheadname(),ff));			    	    		    	   
					    	    table11.addCell(celld);
						    	
					    	    PdfPCell cell;			    	    
						    	cell = new PdfPCell(new Phrase(Convert.toString(salaryListE.get(e).getPayamt()),ff));
						    	cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
					    	    table11.addCell(cell);
					    	    
					    	    e++;
						}		            	
					}
		            if(countE < countD)
		    	    {
		    	    	int temp = countD - countE;		    	    	
		    	    	for(int i =1; i<temp;i++)
		    	    	{
			    	    PdfPCell cellDD;			    	    
				    	cellDD = new PdfPCell(new Phrase("\n"));			    	    		    	   
				    	table11.addCell(cellDD);
				    	    
			    	    PdfPCell cellDD1;			    	    
				    	cellDD1 = new PdfPCell(new Phrase("\n"));			    	    
				    	table11.addCell(cellDD1);
		    	    	}
			    	}
		            PdfPCell cellEE;			    	    
			    	cellEE = new PdfPCell(new Phrase("Total Earnning",font));			    	    		    	   
			    	table11.addCell(cellEE);
			    	    
		    	    PdfPCell cellEE1;			    	    
			    	cellEE1 = new PdfPCell(new Phrase(Convert.toString(eAmt),font));	
			    	cellEE1.setHorizontalAlignment(Element.ALIGN_RIGHT);
			    	table11.addCell(cellEE1);
			    	
			    	PdfPTable table1D = new PdfPTable(2);	
			    	table1D.setHorizontalAlignment(Element.ALIGN_LEFT);
			    	Font f2 = FontFactory.getFont("Times-Roman");
			    	f2.setColor(BaseColor.BLACK);
			    	    
			    	PdfPCell cellDH;			    	    
			    	cellDH = new PdfPCell(new Phrase("Deduction",f2));			    	    		    	   
		    	    table1D.addCell(cellDH);
			    	    
		    	    PdfPCell cellD1H;			    	    
			    	cellD1H = new PdfPCell(new Phrase("Amount",ff));			    	    
		    	    table1D.addCell(cellD1H);
		    	    
		    	    for(SalaryBeans salaryBeans11 : salaryList)
					{				       
		            	if(d < countD)
						{
				    	    PdfPCell cellD;			    	    
					    	cellD = new PdfPCell(new Phrase(salaryListD.get(d).getPayheadname(),f2));			    	    		    	   
				    	    table1D.addCell(cellD);
					    	    
				    	    PdfPCell cellD1;			    	    
					    	cellD1 = new PdfPCell(new Phrase(Convert.toString(salaryListD.get(d).getPayamt()),ff));	
					    	cellD1.setHorizontalAlignment(Element.ALIGN_RIGHT);
				    	    table1D.addCell(cellD1);
				    	    
				    	    PdfPCell cellDD;			    	    
					    	cellDD = new PdfPCell(new Phrase(salaryListD.get(d).getDaysname(),f2));			    	    		    	   
				    	    table1D.addCell(cellDD);
					    	    
				    	    PdfPCell cellDD1;			    	    
					    	cellDD1 = new PdfPCell(new Phrase(Convert.toString(salaryListD.get(d).getDaysamt()),ff));
					    	cellDD1.setHorizontalAlignment(Element.ALIGN_RIGHT);
				    	    table1D.addCell(cellDD1);
				    	    
				    	    d++;
						}
					}
		    	    if(countD < countE)
		    	    {
		    	    	int temp = countE - countD;
		    	    	for(int i =1; i<temp;i++)
		    	    	{
			    	    PdfPCell cellDD;			    	    
				    	cellDD = new PdfPCell(new Phrase("\n"));			    	    		    	   
			    	    table1D.addCell(cellDD);
				    	    
			    	    PdfPCell cellDD1;			    	    
				    	cellDD1 = new PdfPCell(new Phrase("\n"));			    	    
			    	    table1D.addCell(cellDD1);
		    	    	}		    	    	
			    	}
		    	    PdfPCell cellDD;			    	    
			    	cellDD = new PdfPCell(new Phrase("Total Deduction",font));			    	    		    	   
		    	    table1D.addCell(cellDD);
			    	    
		    	    PdfPCell cellDD1;			    	    
			    	cellDD1 = new PdfPCell(new Phrase(Convert.toString(dAmt),font));	
			    	cellDD1.setHorizontalAlignment(Element.ALIGN_RIGHT);
		    	    table1D.addCell(cellDD1);
		    	    		    	  		    	   
		    	    
		    	    PdfPTable tableED = new PdfPTable(2);
		    	    tableED.setWidthPercentage(100.0f);	
		    	    PdfPCell cellED1,cellED2;		    	    
		    	    cellED1 = new PdfPCell(table11);
		    	    
		    	    cellED2 = new PdfPCell(table1D);		    	    
		    	    tableED.addCell(cellED1);
		    	    tableED.addCell(cellED2);	    	        	   		    	    
			    	cellED1.setBorderWidthBottom(0);
		    	    doc.add(tableED);   
				    
		    	    
		    	    PdfPTable tableN = new PdfPTable(4);
		    	    tableN.setWidthPercentage(100.0f);
		    	    
		    	    PdfPCell cellN1;			    	    
			    	cellN1 = new PdfPCell(new Phrase(""));
			    	cellN1.setBorder(0);
		    	    tableN.addCell(cellN1);
			    	    
		    	    PdfPCell cellNN2;			    	    
			    	cellNN2 = new PdfPCell(new Phrase(""));
			    	cellNN2.setBorder(0); 
		    	    tableN.addCell(cellNN2);
		    	    
		    	    PdfPCell cellN;			    	    
			    	cellN = new PdfPCell(new Phrase("Net Pay",font));			    	    		    	   
		    	    tableN.addCell(cellN);
			    	    
		    	    PdfPCell cellNN;			    	    
			    	cellNN = new PdfPCell(new Phrase(Convert.toString(nList),font));
			    	cellNN.setHorizontalAlignment(Element.ALIGN_RIGHT);
		    	    tableN.addCell(cellNN);
			    	
		    	    doc.add(tableN);
		    	    
		    	    
			    PdfPTable tab = new PdfPTable(1);
			    PdfPCell c = new PdfPCell();
			    c.setMinimumHeight(30);
			    c.setBorder(0);			    
			    tab.addCell(c);
			    doc.add(tab);
			    
			    PdfPTable table = new PdfPTable(2);
			    table.setWidthPercentage(100f);			    
			    table.setWidths(new float[] {60,60});
			    PdfPCell celln1 = new PdfPCell(new Phrase("\n\n\n\n\nEmployer's Signature",font));
		        celln1.setHorizontalAlignment(Element.ALIGN_CENTER);
		        //celln1.setRowspan(4);
		        celln1.setBorder(0);
		       // celln1.setBorderWidthBottom(0.5f);
		        celln1.setMinimumHeight(100);
		        table.addCell(celln1);
		        
		        PdfPCell celln12 = new PdfPCell(new Phrase("\n\n\n\n\nEmployee's Signature",font));
		        celln12.setHorizontalAlignment(Element.ALIGN_CENTER);
		        //celln12.setRowspan(5);
		        //celln12.setColspan(2);
		        celln12.setBorder(0);
		       // celln12.setBorderWidthBottom(0.5f);
		        celln12.setMinimumHeight(100);
		        table.addCell(celln12);
			    
		        doc.add(table);
		        doc.close();
	}
}
