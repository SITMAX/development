/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sitmaxoutputs.samples;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Ruben Huanacuni
 */
public class InformeTecnico {

    Font f1 = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);
    Font f1b = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
    Font f2 = new Font(Font.FontFamily.HELVETICA, 14, Font.NORMAL);
    Font f2b = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD);

    /**
     * Agrega la cadena de texto indicada como un parrafo
     *
     * @param parrafo Texto del parrafo
     * @param fuente Tipo de fuente del texto
     * @param document Documento donde se adicionará el parrafo
     * @param alineacion Alineacion del parrafo en el documento
     * @throws DocumentException
     */
    public void agregarParrafo(String parrafo, Font fuente, Document document, int alineacion) throws DocumentException {
        Paragraph par = new Paragraph(parrafo, fuente);
        par.setAlignment(alineacion);
        document.add(par);
    }

    /**
     * Crea un documento Informe Técnico
     *
     * @param filename Nombre del archivo
     */
    public void createPdf(String filename) throws IOException, DocumentException {
        Document document = new Document(PageSize.LETTER, 50, 50, 100, 50);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filename));
        FormatoDocumento encabezado = new FormatoDocumento();
        Paragraph parrafo;
        int izq = 0;
        int centro = 1;
        int der = 2;
        int justificado = 3;
        String nombreInforme = "INFORME TÉCNICO";
        String tipoTramite = "DIVISIÓN";
        String nroTramite = "13000045";
        String fechaInicio = "2015-03-12";
        String fechaRespuesta = "2015-03-14";
        String fechaReporte = "15 de marzo del 2015";
        String propietario = "JOSE BARBATO PORCASI";
        String resultadoDictamen = "POSITIVO";
        String observaciones = "EL RESULTADO DE LA INSPECCIÓN TÉCNICA FUE POSITIVA";
        String nroPadron = "T89191";
        String codCatastral = "0020096010410003";
        String area = "640,74";
        String valorCatastral = "2.099.234,60";
        String nroDivisiones = "2";
        String contenido = "Considerando la documentación presentada, analizando todos los requerimientos técnicos que marcan los reglamentos en la materia y habiéndose corroborado la información presentada de manera satisfactoria el dictamen ha determinado que esta solicitud de división es procedente.\n\n"
                + "A fin de seguir con el trámite de división el resultado del dictamen técnico es:";

        //indicamos que objeto manejara los eventos al escribir el Pdf
        writer.setPageEvent(encabezado);

        document.open();

        agregarParrafo(nombreInforme, f2b, document, der);

        agregarParrafo("FOLIO DEL TRÁMITE: " + nroTramite, f1, document, der);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo(tipoTramite, f2b, document, der);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo("Fecha de inicio: " + fechaInicio, f1b, document, der);

        agregarParrafo("Fecha de respuesta: " + fechaRespuesta, f1b, document, der);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo("Santa Fe de la Vera Cruz a " + fechaReporte, f1, document, der);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo("Sr. " + propietario, f2b, document, izq);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo(contenido, f1, document, justificado);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo(resultadoDictamen, f2b, document, centro);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo("OBSERVACIONES", f1, document, centro);

        agregarParrafo("\n", f1, document, izq);

        //Agregamos el recuadro de observaciones
        PdfPTable tablaObservaciones = new PdfPTable(1);
        tablaObservaciones.addCell(observaciones);

        document.add(tablaObservaciones);

        agregarParrafo("\n", f1, document, izq);

        agregarParrafo("DATOS DEL PREDIO", f1, document, centro);

        agregarParrafo("\n", f1, document, izq);

        PdfPTable tablaPredio = new PdfPTable(2);

        tablaPredio.addCell("Nro. padrón");
        tablaPredio.addCell(nroPadron);

        tablaPredio.addCell("Código catastral");
        tablaPredio.addCell(codCatastral);

        tablaPredio.addCell("Área");
        tablaPredio.addCell(area);

        tablaPredio.addCell("Valor catastral");
        tablaPredio.addCell(valorCatastral);

        tablaPredio.addCell("Número de divisiones");
        tablaPredio.addCell(nroDivisiones);

        document.add(tablaPredio);

        //document.newPage();
        document.close();
    }

    static public void main(String[] args) {
        InformeTecnico doc = new InformeTecnico();

        try {
            //Creamos el documento Pdf
            System.out.println("Creando el documento...");
            doc.createPdf("InformeTecnico.pdf");
            System.out.println("Documento Informe Tecnico creado.");
        } catch (DocumentException ed) {
            System.err.println("Error al crear el documento Pdf");
        } catch (IOException ex) {
            System.err.println("Error General de Entrada/Salida");
        }
    }
}
