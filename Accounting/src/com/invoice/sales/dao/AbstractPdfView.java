package com.invoice.sales.dao;


import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * This class is a work around for working with iText 5.x in Spring.
 * The code here is almost identical to the AbstractPdfView class. 
 *
 */
public abstract class AbstractPdfView extends AbstractView
{

	public AbstractPdfView() {
		setContentType("application/pdf");
	}

	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}
		
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		// IE workaround: write into byte array first.
		ByteArrayOutputStream baos = createTemporaryOutputStream();

		// Apply preferences and build metadata.
		Document document = newDocument();
		PdfWriter writer = newWriter(document, baos);
		prepareWriter(model, writer, request);
		buildPdfMetadata(model, document, request);

		// Build PDF document.
		
		/*Image logo = Image.getInstance("/image.gif");
		logo.setAlignment(Image.MIDDLE);
		logo.scaleAbsoluteHeight(20);
		logo.scaleAbsoluteWidth(20);
		logo.scalePercent(100);
		Chunk chunk = new Chunk(logo, 0, -45);
		HeaderFooter header = new HeaderFooter(new Phrase(chunk), false);
		header.setAlignment(Element.ALIGN_CENTER);
		header.setBorder(Rectangle.NO_BORDER);
		document.setHeader(header);*/
		document.addAuthor("PRADEEP");
		document.addTitle("ENQUIRY PDF");
		document.addHeader("PRADEEP", "MY HEADER");
		document.open();
		
		
		buildPdfDocument(model, document, writer, request, response);
		document.close();

		// Flush to HTTP response.
		writeToResponse(response, baos);
	}

	protected Document newDocument() {
		Document doc=new Document(PageSize.A4);
		doc.addHeader("Estimate PDF","BY PRADEEP");
		doc.setPageCount(1);
		return doc;

	}
	public Document newDocumentHeader() {
		Document doc=new Document();
		doc.addHeader("PRADEEP","MY PDF");
		return doc;
	//,100.0F,50.0F,50.0F,100.0F
	}

	protected PdfWriter newWriter(Document document, OutputStream os) throws DocumentException {
		return PdfWriter.getInstance(document, os);
	}
	
	protected void prepareWriter(Map<String, Object> model, PdfWriter writer, HttpServletRequest request)
			throws DocumentException {

		writer.setViewerPreferences(getViewerPreferences());
		
	
	}
	
	protected int getViewerPreferences() {
		return PdfWriter.ALLOW_PRINTING | PdfWriter.PageLayoutSinglePage | PdfWriter.DisplayDocTitle;
	}
	
	protected void buildPdfMetadata(Map<String, Object> model, Document document, HttpServletRequest request) {
	}
	
	public abstract void buildPdfDocument(Map<String, Object> model, Document document, PdfWriter writer,
			HttpServletRequest request, HttpServletResponse response) throws Exception;	

}



	
