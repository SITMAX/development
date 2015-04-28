/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TestSimgei;
import SimgeiClient.PersonaServiceImpl;
import java.util.HashMap;
import java.util.Map;
/**
 *
 * @author icg01
 */
public class SimgeiTest {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try 
        {
            PersonaServiceImpl client = new PersonaServiceImpl("http://10.20.12.26:8080/simgeiWS/ActorWebServiceBean?wsdl");
            
            System.out.println(client.getActorPorDocumento("1"));
            System.out.println(client.getActorPorId(509897));
            System.out.println(client.getActoresUnificado(509897));
            System.out.println(client.getDireccionActor(509897));
            System.out.println(client.getDireccionActiva(509897));
            Map map = new HashMap();
            map.put("apellido", "CALLEJAS");
            map.put("conNumeroDocumento", "143503");
            System.out.println(client.getActorPorFiltros(map));
        } catch (Exception e) {
        }
    }
    
}
