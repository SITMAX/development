/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmaxoutputs.samples;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;

/**
 * Clase de ejemplo de como organizar el uso de la libreria iText Generando el
 * archivo desde un punto del programa y agregando los elementos desde metodos
 * especializados
 * 
* Esta clase esta pensada como un ejemplo de como organizar el codigo de un
 * proyecto de iText
 *
 * @author Ruben Huanacuni
 */
public class Modular {

    private Document documento;

    /**
     * Inicializa el docuemnto iText para agregar elementos, abre el docuemnto
     * por default
     *
     * @param nombreArchivo Ruta del archivo pdf que se creara
     * @throws FileNotFoundException
     * @throws DocumentException
     */
    public void agregarParrafo(String parrafo) throws DocumentException {
        Paragraph par = new Paragraph(parrafo);
        documento.add(par);
    }
    
     /**
      * Agrega una imagen al documento
      * @param rutaImagen Ruta de la imagen a agregar
      * @throws MalformedURLException
      * @throws IOException
      * @throws DocumentException
      */
      public void agregarImagen(String rutaImagen) throws MalformedURLException, IOException, DocumentException {
            Image imagen = Image.getInstance(rutaImagen);
            documento.add(imagen);
      }
      
       /**
      * Cierra el documento
      */
      public void cerrarDocumento() {
            documento.close();
      }

      public Document getDocumento() {
            return documento;
      }

      public void setDocumento(Document documento) {
            this.documento = documento;
      }
}
