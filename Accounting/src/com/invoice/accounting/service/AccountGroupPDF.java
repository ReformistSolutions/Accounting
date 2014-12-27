package com.invoice.accounting.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.invoice.accounting.beans.NewAccountGroup;
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

public class AccountGroupPDF extends AbstractPdfView{

	@Override
	protected void buildPdfDocument(Map<String, Object> model,
			Document doc, PdfWriter writer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		NewAccountGroup newAccountGroup=(NewAccountGroup) model.get("viewGrpAccount");
		
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
		cell3.setPhrase(new Phrase("ACCOUNT GROUP",font1));
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


		PdfPTable tableFR = new PdfPTable(4);
		tableFR.setWidthPercentage(100.0f);
		tableFR.setWidths(new float[] {4.0f, 3.0f,2.0f, 2.0f});
		tableFR.setSpacingBefore(10);


		Font font11 = FontFactory.getFont(FontFactory.HELVETICA);
		font11.setColor(BaseColor.BLACK);

		
		PdfPTable tableSR1 = new PdfPTable(4);
		tableSR1.setWidthPercentage(100.0f);
		tableSR1.setWidths(new float[] {4.0f, 3.0f,2.0f, 2.0f});
		tableSR1.setSpacingBefore(10);


		Font fontSR1 = FontFactory.getFont(FontFactory.HELVETICA);
		fontSR1.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Account Group No :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR1.addCell(cell);

		cell.setPhrase(new Phrase(newAccountGroup.getTxtAccGrpNo(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR1.addCell(cell);	

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR1.addCell(cell);

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR1.addCell(cell);


		doc.add(tableSR1);
		
		PdfPTable tableSR = new PdfPTable(4);
		tableSR.setWidthPercentage(100.0f);
		tableSR.setWidths(new float[] {4.0f, 3.0f,2.0f, 2.0f});
		tableSR.setSpacingBefore(10);
		Font fontSR = FontFactory.getFont(FontFactory.HELVETICA);
		fontSR.setColor(BaseColor.BLACK);

		cell.setPhrase(new Phrase("Group Name :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);

		cell.setPhrase(new Phrase(newAccountGroup.getTxtName(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);	

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tableSR.addCell(cell);


		doc.add(tableSR);



		PdfPTable tablePN1 = new PdfPTable(4);
		tablePN1.setWidthPercentage(100.0f);
		tablePN1.setWidths(new float[] {4.0f, 3.0f,2.0f, 2.0f});
		tablePN1.setSpacingBefore(10);

		cell.setPhrase(new Phrase("Description :", font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN1.addCell(cell);

		cell.setPhrase(new Phrase(newAccountGroup.getTxtDescription(),font));
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN1.addCell(cell);


		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN1.addCell(cell);

		cell.setPhrase(new Phrase());
		cell.setBorder(Rectangle.NO_BORDER);
		cell.setMinimumHeight(30f);
		tablePN1.addCell(cell);


		doc.add(tablePN1);

			}
}
