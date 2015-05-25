/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmaxoutputs.samples;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Ruben Huanacuni
 *
 *
 * First iText example: Hello World.
 */
public class HelloWorld {
    
    public float marginLeft;
    public float marginRight;
    public float marginTop;
    public float marginBottom;
 
    /** Path to the resulting PDF file. */
    public static final String RESULT = "hello.pdf";
 
    /**
     * Creates a PDF file: hello.pdf
     * @param    args    no arguments needed
     * @throws com.itextpdf.text.DocumentException
     * @throws java.io.IOException
     */
    public static void main(String[] args)              
    	throws DocumentException, IOException {
    	new HelloWorld().createPdf(RESULT);
    }
 
    /**
     * Creates a PDF document.
     * @param filename the path to the new PDF document
     * @throws    DocumentException 
     * @throws    IOException 
     */
    public void createPdf(String filename)
	throws DocumentException, IOException {
        // step 1
        //Para los márgenes tienes más argumentos, 72 puntos es 1 pulgada:
        //Document document = new Document(PageSize.A4, marginLeft, marginRight, marginTop, marginBottom);
        Document document = new Document(PageSize.A4);
        // step 2
        PdfWriter.getInstance(document, new FileOutputStream(filename));
        // step 3
        document.open();
        // step 4
        document.add(new Paragraph("Hello World!"));
        // step 5
        document.close();
    }
}