/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SimgeiClient;

import ar.gov.santafeciudad.persona.ws.ActorCatastroDto;
import ar.gov.santafeciudad.persona.ws.ActorCatastroDtoArray;
import ar.gov.santafeciudad.persona.ws.DireccionActorCatastroDto;
import ar.gov.santafeciudad.persona.ws.DireccionActorCatastroDtoArray;
import ar.gov.santafeciudad.persona.ws.GetActoresFilter;
import javax.xml.ws.BindingProvider;
import com.google.gson.Gson;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/*
 *
 * @author Edy Huiza
 */
public class PersonaServiceImpl {

    static ar.gov.santafeciudad.persona.ws.ActorWebServiceBeanService service = null;
    static ar.gov.santafeciudad.persona.ws.ActorWebService port = null;

    /**
     * Constructor de la clase que inicializa el metodo
     *
     * @param URL String con el Link del servicio a consumir.
     *
     */
    public PersonaServiceImpl(String URL) {
        try {
            URL path = new URL(URL);
            service = new ar.gov.santafeciudad.persona.ws.ActorWebServiceBeanService(path);
            port = service.getActorWebServiceBeanPort();
        } catch (Exception e) {
        }

    }

    /**
     * Busqueda de actores por numero de documento
     *
     * @param documento String con el numero de documento a buscar
     * @return List de actores
     */
    public static List getActorPorDocumento(java.lang.String documento) {
        try {
            List<String> ListaActores = new ArrayList<>();
            List<ActorCatastroDto> listAct = getActorByDocumento(documento).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                String Actor = new Gson().toJson(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Busqueda de actores por ID
     *
     * @param Id del tipo Long del actor a buscar
     * @return Lista de actores
     */
    public static String getActorPorId(long Id) {
        try {
            ActorCatastroDto ActorObj = new ActorCatastroDto();
            ActorObj = getActorById(Id);
            String Actor = new Gson().toJson(ActorObj);
            return Actor;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Metodo que realiza la busqueda de actores a traves de filtros
     *
     * @param pref Map con los campos a ingresar en la busqueda
     * @return Lista de actores
     */
    public static List getActorPorFiltros(Map pref) {
        try {
            List<String> ListaActores = new ArrayList<>();
            GetActoresFilter filtroActores = SerializarPreferenciasActor(pref);
            List<ActorCatastroDto> listAct = getActores(filtroActores).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                String Actor = new Gson().toJson(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Busqueda de actores unificados
     *
     * @param Id identificador del Actor a buscar
     * @return Lista de actores
     */
    public static List getActoresUnificado(long Id) {
        try {
            List<String> ListaActores = new ArrayList<>();
            List<ActorCatastroDto> listAct = getActoresUnificados(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                String Actor = new Gson().toJson(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Metodo de busqueda de direcciones activas de un actor
     *
     * @param Id Identificador del actor a buscar
     * @return Lista de direcciones
     */
    public static List getDireccionActiva(long Id) {
        try {
            List<String> ListaActores = new ArrayList<>();
            List<DireccionActorCatastroDto> listAct = getDireccionesActiva(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                DireccionActorCatastroDto ds = new DireccionActorCatastroDto();
                ds = listAct.get(i);
                String Actor = new Gson().toJson(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
        } catch (Exception e) {
            return null;
        }
    }
    /**
    * Metodo de busca de direcciones de actor
    * @param Id Identificador del actor a buscar
    * @return Lista de direcciones 
    */
    public static List getDireccionActor(long Id) {
        try {
            List<String> ListaDirActor = new ArrayList<>();
            List<DireccionActorCatastroDto> listAct = getDireccionesActor(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                DireccionActorCatastroDto ds = new DireccionActorCatastroDto();
                ds = listAct.get(i);
                String Actor = new Gson().toJson(ds);
                ListaDirActor.add(Actor);
            }
            return ListaDirActor;
        } catch (Exception e) {
            return null;
        }
    }

    private static ActorCatastroDtoArray getActorByDocumento(java.lang.String documento) {
        try {
            BindingProvider prov = (BindingProvider) port;
            prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
            prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
            return port.getActorByDocumento(documento);
        } catch (Exception e) {
            return null;
        }
    }

    private static ActorCatastroDto getActorById(long arg0) {
        BindingProvider prov = (BindingProvider) port;
        prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
        prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
        return port.getActorById(arg0);
    }

    private static ActorCatastroDtoArray getActores(ar.gov.santafeciudad.persona.ws.GetActoresFilter arg0) {
        BindingProvider prov = (BindingProvider) port;
        prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
        prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
        return port.getActores(arg0);
    }

    private static ActorCatastroDtoArray getActoresUnificados(long arg0) {

        BindingProvider prov = (BindingProvider) port;
        prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
        prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
        return port.getActoresUnificados(arg0);
    }

    private static DireccionActorCatastroDtoArray getDireccionesActiva(long arg0) {

        BindingProvider prov = (BindingProvider) port;
        prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
        prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
        return port.getDireccionesActiva(arg0);
    }

    private static DireccionActorCatastroDtoArray getDireccionesActor(long arg0) {

        BindingProvider prov = (BindingProvider) port;
        prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, "catastro");
        prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, "cata5tr0");
        return port.getDireccionesActor(arg0);
    }

    private static GetActoresFilter SerializarPreferenciasActor(Map pref) {
        GetActoresFilter obj = new GetActoresFilter();
        Iterator it = pref.entrySet().iterator();

        while (it.hasNext()) {
            try {
                Map.Entry e = (Map.Entry) it.next();
                if (e.getKey() == "apellido") {
                    obj.setApellido(e.getValue().toString());
                }
                if (e.getKey() == "conCuit") {
                    obj.setConCuit((int) e.getValue());
                }
                if (e.getKey() == "conNumeroDocumento") {
                    obj.setConNumeroDocumento((int) e.getValue());
                }
                if (e.getKey() == "cuitCodigo1") {
                    obj.setCuitCodigo1((Byte) e.getValue());
                }
                if (e.getKey() == "cuitCodigo2") {
                    obj.setCuitCodigo2((int) e.getValue());
                }
                if (e.getKey() == "cuitCodigo3") {
                    obj.setCuitCodigo3((Byte) e.getValue());
                }
                if (e.getKey() == "filaInicial") {
                    obj.setFilaInicial((int) e.getValue());
                }
                if (e.getKey() == "nombreFantasia") {
                    obj.setNombreFantasia(e.getValue().toString());
                }
                if (e.getKey() == "nombreOrganismo") {
                    obj.setNombreOrganismo(e.getValue().toString());
                }
                if (e.getKey() == "numeroDocumento") {
                    obj.setNumeroDocumento((int) e.getValue());
                }
                if (e.getKey() == "razonSocial") {
                    obj.setRazonSocial(e.getValue().toString());
                }
                if (e.getKey() == "tipoBusqueda") {
                    obj.setTipoBusqueda(e.getValue().toString());
                }
                if (e.getKey() == "tipoDocumento") {
                    obj.setTipoDocumento(e.getValue().toString());
                }
                if (e.getKey() == "totalFilas") {
                    obj.setTotalFilas((int) e.getValue());
                }
                if (e.getKey() == "nombre") {
                    obj.setNombre(e.getValue().toString());
                }
            } catch (Exception e) {
            }

        }
        return obj;
    }
}
