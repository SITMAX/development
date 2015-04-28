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

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map.Entry;

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
    public PersonaServiceImpl(String URL, String user, String password) {
        try {
            URL path = new URL(URL);
            service = new ar.gov.santafeciudad.persona.ws.ActorWebServiceBeanService(path);
            port = service.getActorWebServiceBeanPort();
            BindingProvider prov = (BindingProvider) port;
            prov.getRequestContext().put(BindingProvider.USERNAME_PROPERTY, user);
            prov.getRequestContext().put(BindingProvider.PASSWORD_PROPERTY, password);
        } catch (Exception e) {
        }

    }

    /**
     * Busqueda de actores por documento
     *
     * @param Id del tipo Long del actor a buscar
     * @return Map de actores
     */
    public static List<Map<String, Object>> getActorPorDocumentoMap(java.lang.String documento) {
        try {
            List<Map<String, Object>> ListaActores = new ArrayList<>();
            List<ActorCatastroDto> listAct = getActorByDocumento(documento).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                Map Actor = buildMapActor(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
        } catch (Exception e) {
            return null;
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
     * Busqueda de actores por ID
     *
     * @param Id del tipo Long del actor a buscar
     * @return Map de actores
     */
    public static Map getActorPorIdMap(long Id) {
        try {
            ActorCatastroDto ActorObj = new ActorCatastroDto();
            ActorObj = getActorById(Id);
            Map Actor = buildMapActor(ActorObj);
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
    public static List<Map<String, Object>> getActorPorFiltrosMap(Map pref) {
        try {
            
            List<Map<String, Object>> ListaActores = new ArrayList<>();
            GetActoresFilter filtroActores = SerializarPreferenciasActor(pref);
            List<ActorCatastroDto> listAct = getActores(filtroActores).getItem();

            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                Map Actor = buildMapActor(ds);
                ListaActores.add(Actor);
            }
            return ListaActores;
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
     * @return Lista de actores con contenido de map
     */
    public static List<Map> getActoresUnificadoMap(long Id) {
        try {
            List<Map> ListaActores = new ArrayList<>();
            List<ActorCatastroDto> listAct = getActoresUnificados(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                ActorCatastroDto ds = new ActorCatastroDto();
                ds = listAct.get(i);
                Map Actor = buildMapActorUnificado(ds);
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
     * Metodo de busqueda de direcciones activas de un actor en un map
     *
     * @param Id Identificador del actor a buscar
     * @return Lista de direcciones en Map
     */
    public static List<Map> getDireccionActivaMap(long Id) {
        try {
            List<Map> ListaActores = new ArrayList<>();
            List<DireccionActorCatastroDto> listAct = getDireccionesActiva(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                DireccionActorCatastroDto ds = new DireccionActorCatastroDto();
                ds = listAct.get(i);
                Map Actor = buildMapDireccionActor(ds);
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
     * Metodo de busca de direcciones de actor en un Map
     *
     * @param Id Identificador del actor a buscar
     * @return Lista de direcciones
     */
    public static List<Map<String, Object>> getDireccionActorMap(long Id) {
        try {
            List<Map<String, Object>> ListaDirActor = new ArrayList<>();
            List<DireccionActorCatastroDto> listAct = getDireccionesActor(Id).getItem();
            for (int i = 0; i < listAct.size(); i++) {
                DireccionActorCatastroDto ds = new DireccionActorCatastroDto();
                ds = listAct.get(i);
                Map Actor = buildMapDireccionActor(ds);
                ListaDirActor.add(Actor);
            }
            return ListaDirActor;
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * Metodo de busca de direcciones de actor
     *
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
        return port.getActorByDocumento(documento);
    }

    private static ActorCatastroDto getActorById(long arg0) {

        return port.getActorById(arg0);
    }

    private static ActorCatastroDtoArray getActores(ar.gov.santafeciudad.persona.ws.GetActoresFilter arg0) {
        return port.getActores(arg0);
    }

    private static ActorCatastroDtoArray getActoresUnificados(long arg0) {
        return port.getActoresUnificados(arg0);
    }

    private static DireccionActorCatastroDtoArray getDireccionesActiva(long arg0) {
        return port.getDireccionesActiva(arg0);
    }

    private static DireccionActorCatastroDtoArray getDireccionesActor(long arg0) {
        return port.getDireccionesActor(arg0);
    }

    private static GetActoresFilter SerializarPreferenciasActor(Map<String, Object> pref) throws IOException {
        try {
            GetActoresFilter obj = new GetActoresFilter();
            for (Entry<String, Object> e : pref.entrySet()) {
                if (String.valueOf(e.getKey()).compareTo("apellido") == 0) {
                    obj.setApellido(e.getValue().toString());
                }
                if (String.valueOf(e.getKey()).compareTo("conCuit") == 0) {
                    obj.setConCuit(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("cuitCodigo1") == 0) {
                    obj.setCuitCodigo1(Byte.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("cuitCodigo2") == 0) {
                    obj.setCuitCodigo2(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("cuitCodigo3") == 0) {
                    obj.setCuitCodigo3(Byte.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("conNumeroDocumento") == 0) {
                    obj.setConNumeroDocumento(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("numeroDocumento") == 0) {
                    obj.setNumeroDocumento(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("tipoDocumento") == 0) {
                    obj.setTipoDocumento(e.getValue().toString());
                }
                if (String.valueOf(e.getKey()).compareTo("filaInicial") == 0) {
                    obj.setFilaInicial(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("tipoBusqueda") == 0) {
                    obj.setTipoBusqueda((String) e.getValue());
                }
                if (String.valueOf(e.getKey()).compareTo("razonSocial") == 0) {
                    obj.setRazonSocial((String) e.getValue());
                }
                if (String.valueOf(e.getKey()).compareTo("nombreFantasia") == 0) {
                    obj.setNombreFantasia((String) e.getValue());
                }
                if (String.valueOf(e.getKey()).compareTo("totalFilas") == 0) {
                    obj.setTotalFilas(Integer.valueOf(e.getValue().toString()));
                }
                if (String.valueOf(e.getKey()).compareTo("nombre") == 0) {
                    obj.setNombre(e.getValue().toString());
                }
                if (String.valueOf(e.getKey()).compareTo("conUnificado") == 0) {
                    obj.setConUnificados(Integer.valueOf(e.getValue().toString()));
                }
            }
            return obj;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    private static Map<String, Object> buildMapActor(ActorCatastroDto ActorObj) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("apellido", ActorObj.getApellido());
        map.put("codigo", ActorObj.getCodigo());
        map.put("fechaNacimiento", ActorObj.getFechaNacimiento());
        map.put("cuit", ActorObj.getCuit());
        map.put("id", ActorObj.getId());
        map.put("nombre", ActorObj.getNombre());
        map.put("numeroDocumento", ActorObj.getNumeroDocumento());
        map.put("razonSocial", ActorObj.getRazonSocial());
        map.put("sexo", ActorObj.getSexo());
        map.put("tipoActor", ActorObj.getTipoActor());
        map.put("tipoDocumento", ActorObj.getTipoDocumento());
        map.put("email", ActorObj.getEmailPrincipal());
        map.put("unificados", ActorObj.getUnificados());
        map.put("telefonoPrincipal", ActorObj.getTelefonoPrincipal());
        map.put("firmaSidom", ActorObj.getFirmaSidom());
        return map;
    }

    private static Map<String, Object> buildMapActorUnificado(ActorCatastroDto ActorObj) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("codigo", ActorObj.getCodigo());
        map.put("id", ActorObj.getId());
        return map;
    }

    private static Map<String, Object> buildMapDireccionActor(DireccionActorCatastroDto ActorObj) {

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("departamento", ActorObj.getDepartamento());
        map.put("direccion", ActorObj.getDireccion());
        map.put("zona", ActorObj.getZona());
        map.put("distrito", ActorObj.getDistrito());
        map.put("edificio", ActorObj.getEdificio());
        map.put("id", ActorObj.getId());
        map.put("idCalle", ActorObj.getIdCalle());
        map.put("item", ActorObj.getItem());
        map.put("letra", ActorObj.getLetra());
        map.put("local", ActorObj.getLocal());
        map.put("manzana", ActorObj.getManzana());
        map.put("monoblock", ActorObj.getMonoblock());
        map.put("nombreCalle", ActorObj.getNombreCalle());
        map.put("numero", ActorObj.getNumero());
        map.put("observaciones", ActorObj.getObservaciones());
        map.put("padron", ActorObj.getPadron());
        map.put("piso", ActorObj.getPiso());
        map.put("provincia", ActorObj.getProvincia());
        map.put("sector", ActorObj.getSector());
        map.put("secuencia", ActorObj.getSecuencia());
        map.put("tipoDireccion", ActorObj.getTipoDireccion());
        map.put("tipoDomicilio", ActorObj.getTipoDomicilio());
        map.put("tipoPortal", ActorObj.getTipoPortal());
        map.put("torre", ActorObj.getTorre());
        map.put("vivienda", ActorObj.getVivienda());
        map.put("activo", ActorObj.isActivo());
        map.put("fecha_activo", ActorObj.getFechaActivo());
        map.put("codPostal", ActorObj.getCodPostal());
        return map;
    }

    private static void writeFile(String a) {
        BufferedWriter writer = null;
        try {
            //create a temporary file
            String timeLog = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
            File logFile = new File(timeLog + ".txt");

            // This will output the full path where the file will be written to...
            System.out.println(logFile.getCanonicalPath());

            writer = new BufferedWriter(new FileWriter(logFile));
            writer.write(a);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Close the writer regardless of what happens...
                writer.close();
            } catch (Exception e) {
            }
        }
    }
}
