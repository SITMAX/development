
package ar.gov.santafeciudad.persona.ws;

import javax.xml.bind.annotation.XmlRegistry;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ar.gov.santafeciudad.persona.ws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {


    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ar.gov.santafeciudad.persona.ws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DireccionActorCatastroDtoArray }
     * 
     */
    public DireccionActorCatastroDtoArray createDireccionActorCatastroDtoArray() {
        return new DireccionActorCatastroDtoArray();
    }

    /**
     * Create an instance of {@link GetActoresFilter }
     * 
     */
    public GetActoresFilter createGetActoresFilter() {
        return new GetActoresFilter();
    }

    /**
     * Create an instance of {@link ActorCatastroDto }
     * 
     */
    public ActorCatastroDto createActorCatastroDto() {
        return new ActorCatastroDto();
    }

    /**
     * Create an instance of {@link ActorCatastroDtoArray }
     * 
     */
    public ActorCatastroDtoArray createActorCatastroDtoArray() {
        return new ActorCatastroDtoArray();
    }

    /**
     * Create an instance of {@link DireccionActorCatastroDto }
     * 
     */
    public DireccionActorCatastroDto createDireccionActorCatastroDto() {
        return new DireccionActorCatastroDto();
    }

}
