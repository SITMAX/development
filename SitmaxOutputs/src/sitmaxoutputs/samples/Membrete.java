/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmaxoutputs.samples;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Ruben Huanacuni
 */
public class Membrete {
    /**
     * Crea un documento con encabezado y conteo de
     * paginas, para este ejemplo se crn 50 paginas
     * @param filename Nombre del archivo
     */
    public void createPdf(String filename) throws IOException, DocumentException
    {
        Document document = new Document(PageSize.LETTER, 36, 36, 140, 36);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filename));
        FormatoDocumento encabezado = new FormatoDocumento();
        Paragraph parrafo;
        int i;
        
        //indicamos que objeto manejara los eventos al escribir el Pdf
        writer.setPageEvent(encabezado);
        
        document.open();
        
        //Creamos una cantidad significativa de paginas para probar el encabezado

        for(i=0; i<50;i++)
        {
            parrafo = new Paragraph("Esta es una de las paginas de prueba de nuestro programa, es la pagina numero 0x " + String.format("%03x", i+42));
            parrafo.setAlignment(Element.ALIGN_CENTER);
            
            document.add(parrafo);
            document.newPage();           
        }
        
        document.close();
    }
    
    static public void main(String[] args)
    {
        Membrete doc = new Membrete();
        
        try{
            //Creamos el documento Pdf
            System.out.println("Creando el documento...");
            doc.createPdf("documentoMembrete.pdf");
            System.out.println("Documento creado.");
        }catch(DocumentException ed)
        {
            System.err.println("Error al crear el docuemnto Pdf");
        }
        catch(IOException ex)
        {
            System.err.println("Error General de Entrada/Salida");
        }
    }
}
