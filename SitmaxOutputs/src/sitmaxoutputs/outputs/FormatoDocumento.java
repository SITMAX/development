/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmaxoutputs.outputs;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

/**
 *
 * @author Ruben Huanacuni
 */
public class FormatoDocumento extends PdfPageEventHelper {

    private Image imagen;
    PdfPTable table = new PdfPTable(2);

    /**
     * Constructor de la clase, inicializa la imagen que se utiliza en el
     * membrete
     */
    public FormatoDocumento() {
        try {
            PdfPCell celda1 = new PdfPCell(new Phrase("INFORME TÉCNICO"));
            PdfPCell celda2 = new PdfPCell(new Phrase("FOLIO DEL TRÁMITE: 13000045"));

            imagen = Image.getInstance("LogoSantaFe.JPG");
            imagen.scaleToFit(200f, 200f);
            imagen.setAbsolutePosition(50, 700f);            

            //celda1.setBorder(Rectangle.BOTTOM);
            //celda2.setBorder(Rectangle.BOTTOM);
            //celda2.setBorder(Rectangle.BOTTOM | Rectangle.RIGHT);

            //table.addCell(celda1);
            //table.addCell(celda2);

            table.setTotalWidth(400f);

        } catch (Exception r) {
            System.err.println("Error al leer la imagen");
        }
    }
    
    /**
     * Manejador del evento onEndPage, usado para generar el encabezado
     */
    public void onEndPage(PdfWriter writer, Document document){
        try{
            document.add(imagen);
            table.writeSelectedRows(0, -1, 140f, 700f, writer.getDirectContent());
        }catch(Exception doc)
        {
            doc.printStackTrace();
        }
    }
}
