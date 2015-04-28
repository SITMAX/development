
package ar.gov.santafeciudad.persona.ws;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for getActoresFilter complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="getActoresFilter">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="apellido" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="conCuit" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="conNumeroDocumento" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="conUnificados" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cuitCodigo1" type="{http://www.w3.org/2001/XMLSchema}byte" minOccurs="0"/>
 *         &lt;element name="cuitCodigo2" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="cuitCodigo3" type="{http://www.w3.org/2001/XMLSchema}byte" minOccurs="0"/>
 *         &lt;element name="filaInicial" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="nombre" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nombreFantasia" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="nombreOrganismo" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="numeroDocumento" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *         &lt;element name="razonSocial" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="tipoBusqueda" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="tipoDocumento" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="totalFilas" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "getActoresFilter", propOrder = {
    "apellido",
    "conCuit",
    "conNumeroDocumento",
    "conUnificados",
    "cuitCodigo1",
    "cuitCodigo2",
    "cuitCodigo3",
    "filaInicial",
    "nombre",
    "nombreFantasia",
    "nombreOrganismo",
    "numeroDocumento",
    "razonSocial",
    "tipoBusqueda",
    "tipoDocumento",
    "totalFilas"
})
public class GetActoresFilter {

    protected String apellido;
    protected Integer conCuit;
    protected Integer conNumeroDocumento;
    protected Integer conUnificados;
    protected Byte cuitCodigo1;
    protected Integer cuitCodigo2;
    protected Byte cuitCodigo3;
    protected Integer filaInicial;
    protected String nombre;
    protected String nombreFantasia;
    protected String nombreOrganismo;
    protected Integer numeroDocumento;
    protected String razonSocial;
    protected String tipoBusqueda;
    protected String tipoDocumento;
    protected Integer totalFilas;

    /**
     * Gets the value of the apellido property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * Sets the value of the apellido property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setApellido(String value) {
        this.apellido = value;
    }

    /**
     * Gets the value of the conCuit property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getConCuit() {
        return conCuit;
    }

    /**
     * Sets the value of the conCuit property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setConCuit(Integer value) {
        this.conCuit = value;
    }

    /**
     * Gets the value of the conNumeroDocumento property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getConNumeroDocumento() {
        return conNumeroDocumento;
    }

    /**
     * Sets the value of the conNumeroDocumento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setConNumeroDocumento(Integer value) {
        this.conNumeroDocumento = value;
    }

    /**
     * Gets the value of the conUnificados property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getConUnificados() {
        return conUnificados;
    }

    /**
     * Sets the value of the conUnificados property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setConUnificados(Integer value) {
        this.conUnificados = value;
    }

    /**
     * Gets the value of the cuitCodigo1 property.
     * 
     * @return
     *     possible object is
     *     {@link Byte }
     *     
     */
    public Byte getCuitCodigo1() {
        return cuitCodigo1;
    }

    /**
     * Sets the value of the cuitCodigo1 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Byte }
     *     
     */
    public void setCuitCodigo1(Byte value) {
        this.cuitCodigo1 = value;
    }

    /**
     * Gets the value of the cuitCodigo2 property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getCuitCodigo2() {
        return cuitCodigo2;
    }

    /**
     * Sets the value of the cuitCodigo2 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setCuitCodigo2(Integer value) {
        this.cuitCodigo2 = value;
    }

    /**
     * Gets the value of the cuitCodigo3 property.
     * 
     * @return
     *     possible object is
     *     {@link Byte }
     *     
     */
    public Byte getCuitCodigo3() {
        return cuitCodigo3;
    }

    /**
     * Sets the value of the cuitCodigo3 property.
     * 
     * @param value
     *     allowed object is
     *     {@link Byte }
     *     
     */
    public void setCuitCodigo3(Byte value) {
        this.cuitCodigo3 = value;
    }

    /**
     * Gets the value of the filaInicial property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getFilaInicial() {
        return filaInicial;
    }

    /**
     * Sets the value of the filaInicial property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setFilaInicial(Integer value) {
        this.filaInicial = value;
    }

    /**
     * Gets the value of the nombre property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Sets the value of the nombre property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombre(String value) {
        this.nombre = value;
    }

    /**
     * Gets the value of the nombreFantasia property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreFantasia() {
        return nombreFantasia;
    }

    /**
     * Sets the value of the nombreFantasia property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreFantasia(String value) {
        this.nombreFantasia = value;
    }

    /**
     * Gets the value of the nombreOrganismo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNombreOrganismo() {
        return nombreOrganismo;
    }

    /**
     * Sets the value of the nombreOrganismo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNombreOrganismo(String value) {
        this.nombreOrganismo = value;
    }

    /**
     * Gets the value of the numeroDocumento property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getNumeroDocumento() {
        return numeroDocumento;
    }

    /**
     * Sets the value of the numeroDocumento property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setNumeroDocumento(Integer value) {
        this.numeroDocumento = value;
    }

    /**
     * Gets the value of the razonSocial property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRazonSocial() {
        return razonSocial;
    }

    /**
     * Sets the value of the razonSocial property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRazonSocial(String value) {
        this.razonSocial = value;
    }

    /**
     * Gets the value of the tipoBusqueda property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoBusqueda() {
        return tipoBusqueda;
    }

    /**
     * Sets the value of the tipoBusqueda property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoBusqueda(String value) {
        this.tipoBusqueda = value;
    }

    /**
     * Gets the value of the tipoDocumento property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTipoDocumento() {
        return tipoDocumento;
    }

    /**
     * Sets the value of the tipoDocumento property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTipoDocumento(String value) {
        this.tipoDocumento = value;
    }

    /**
     * Gets the value of the totalFilas property.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getTotalFilas() {
        return totalFilas;
    }

    /**
     * Sets the value of the totalFilas property.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setTotalFilas(Integer value) {
        this.totalFilas = value;
    }

}
