package com.invoice.reports.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import com.invoice.company.beans.CompanyDetails;
import com.invoice.payroll.beans.BreakupByEmployee;
import com.invoice.payroll.beans.SalaryBeans;
import com.invoice.payroll.service.EmployeeService;
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

public class BreakupbyPDF extends AbstractPdfView
{

	@SuppressWarnings("null")
	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception 
	{

		CompanyDetails cid = (CompanyDetails) model.get("compInfo");
		/*BreakupByEmployee payhedList = (BreakupByEmployee) model.get("payhedList");
		BreakupByEmployee empList = (BreakupByEmployee) model.get("payhedList");
		BreakupByEmployee payamtList = (BreakupByEmployee) model.get("payhedList");
		
		BreakupByEmployee payhedListW = (BreakupByEmployee) model.get("payhedList");
		BreakupByEmployee empListW = (BreakupByEmployee) model.get("payhedList");
		BreakupByEmployee payamtListW = (BreakupByEmployee) model.get("payhedList");*/
		
		
		
		PdfPTable tableHD = new PdfPTable(5);
		tableHD.setWidthPercentage(100.0f);
		tableHD.setWidths(new float[] { 2.0f, 2.0f, 5.0f, 2.0f, 2.0f });
		tableHD.setSpacingBefore(10);

		// define font for table header row
		Font font1 = FontFactory.getFont("Times-Roman", 16, Font.UNDERLINE);
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
		// cell3.setPadding(5);
		cell3.setPhrase(new Phrase("BREAKUP BY EMPLOYEE", font1));
		// cell3.setColspan(5);
		cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell3.setBorder(Rectangle.NO_BORDER);
		// cell3.setBorderWidthBottom(1);
		tableHD.addCell(cell3);

		PdfPCell cell4 = new PdfPCell();
		cell4.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell4);
		PdfPCell cell5 = new PdfPCell();
		cell5.setBorder(Rectangle.NO_BORDER);
		tableHD.addCell(cell5);

		doc.add(tableHD);

		Paragraph p = new Paragraph("\n" + cid.getCompName(), new Font(
				FontFamily.HELVETICA, 15, Font.BOLD,
				new BaseColor(38, 114, 236)));

		Paragraph p2 = new Paragraph(
				cid.getCompDesc()
						+ "\n\n"
						+ cid.getCompAddress()
						+ "\n\nContact No :  "
						+ cid.getContactNo()
						+ "                                                                                            "
						+ "Email :  " + cid.getEmail() + "\n" + " ", new Font(
						FontFamily.HELVETICA, 10, Font.NORMAL, new BaseColor(0,
								0, 0)));

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
		
		
		Paragraph p3 = new Paragraph("\n\n\n" + "Breakup by Salary", new Font(
				FontFamily.TIMES_ROMAN, 11, Font.BOLD,BaseColor.BLACK));
			
		
		PdfPTable tblsal = new PdfPTable(1);
		tblsal.setWidthPercentage(100.0f);
		PdfPCell cellsal1 = new PdfPCell(p3);
		cellsal1.setHorizontalAlignment(Element.ALIGN_LEFT);
		cellsal1.setBorder(Rectangle.NO_BORDER);
		tblsal.addCell(cellsal1);
		
		doc.add(tblsal);
		
		PdfPTable tableDetails = new PdfPTable(2);
		tableDetails.setWidthPercentage(100.0f);
		
		tableDetails.setSpacingBefore(10);
		
		Font fo = FontFactory.getFont("Times-Roman");
		font1.setColor(BaseColor.BLACK);
		
		PdfPCell cell1 = new PdfPCell();
		cell1.setPadding(5);
		
		cell1.setPhrase(new Phrase("Name", fo));
		tableDetails.addCell(cell1);
		
		List<SalaryBeans> payhedList = new ArrayList<SalaryBeans>();
		EmployeeService empservice = null; 
		payhedList = empservice.showBreakupheadList();
		for (SalaryBeans salaryBeans : payhedList)
		{
			Font font11 = FontFactory.getFont("Times-Roman");
			font11.setColor(BaseColor.BLACK);
			
			PdfPCell cellid = new PdfPCell();
			cellid.setPhrase(new Phrase(salaryBeans.getPayheadid(), font11));
			cellid.setPadding(5);
			tableDetails.addCell(cellid);
		}
		
		PdfPCell cellDD1;			    	    
    	cellDD1 = new PdfPCell(new Phrase());	
    	cellDD1.setHorizontalAlignment(Element.ALIGN_RIGHT);
	    tableDetails.addCell(cellDD1);
		
		doc.add(tableDetails);
		
		
		Paragraph p4 = new Paragraph("\n\n\n" + "Breakup by Wages", new Font(
				FontFamily.TIMES_ROMAN, 11, Font.BOLD,BaseColor.BLACK));
		
		
		PdfPTable tblWag = new PdfPTable(1);
		tblWag.setWidthPercentage(100.0f);
		PdfPCell cellWag = new PdfPCell(p4);
		cellWag.setHorizontalAlignment(Element.ALIGN_LEFT);
		cellWag.setBorder(Rectangle.NO_BORDER);
		tblWag.addCell(cellWag);
		
		doc.add(tblWag);
		
	}

}
