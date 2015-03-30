package ShapeUtil;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.geotools.data.FileDataStore;
import org.geotools.data.FileDataStoreFinder;
import org.geotools.data.simple.SimpleFeatureCollection;
import org.geotools.data.simple.SimpleFeatureIterator;
import org.geotools.data.simple.SimpleFeatureSource;
import org.geotools.filter.text.cql2.CQL;
import org.opengis.feature.simple.SimpleFeature;
import org.opengis.feature.simple.SimpleFeatureType;
import org.opengis.filter.Filter;

public class ShapeManager {

    private static SimpleFeatureIterator simpleFeatureIterator;
    private static String fileName = "";
    static FileDataStore store; 

    public static Map getSchameFile(String path) throws Exception {
        try {
            fileName = path;
            File dataFile = new File(fileName);
            dataFile.setReadOnly();
            store = FileDataStoreFinder.getDataStore(dataFile);

            SimpleFeatureSource source = store.getFeatureSource();
            SimpleFeatureCollection featureCollection = source.getFeatures();
            simpleFeatureIterator = featureCollection.features();

            Filter filter = CQL.toFilter("include");
            SimpleFeatureCollection features = source.getFeatures(filter);
            List esquema = features.getSchema().getTypes();
            Map<String, Object> map = new HashMap<String, Object>();
            for (int i = 0; i < esquema.size(); i++) {
                String valor = esquema.get(i).toString();
                String delimiter = ">";
                /* given string will be split by the argument delimiter provided. */
                String[] temp;
                temp = valor.split(delimiter);
                /* print substrings */
                for (int j = 0; j < temp.length; j++) {
                    String valores = getName(temp[j]);
                    if (valores != "") {
                        String[] gg = valores.split("<");
                        map.put(gg[0], gg[1]);
                    }
                }
            }
            System.out.println(map);
            return map;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            simpleFeatureIterator.close();
            store.dispose();
        }
    }

    public static String getName(String value) {
        if (value.contains("[")) {
            return "";
        } else {
            if (value.contains("Geo")) {
                return "the_geom<geometry";
            } else {
                String[] val = value.split(" ");
                return val[1];
            }
        }
    }

    /**
     * Este metodo realiza la iteración del shape para obtener todos los valores
     * de la dbase
     *
     * @param channel The channel
     * @return The RSS data
     */
    public static List<Map> getDataShape(String path) {
        try {
            fileName = path;
            File dataFile = new File(fileName);
            dataFile.setReadOnly();
            store = FileDataStoreFinder.getDataStore(dataFile);
            // ShapefileDataStore store = new ShapefileDataStore(dataFile.toURL());

            SimpleFeatureSource source = store.getFeatureSource();
            SimpleFeatureCollection featureCollection = source.getFeatures();
            simpleFeatureIterator = featureCollection.features();
            List<Map> listaMaps = new ArrayList<Map>();
            while (simpleFeatureIterator.hasNext()) {
                SimpleFeature feature = simpleFeatureIterator.next();
                SimpleFeatureType simFeature = feature.getFeatureType();
                List ads = simFeature.getAttributeDescriptors();
                List attributes = feature.getAttributes();

                Map<String, Object> map = new HashMap<String, Object>();
                for (int i = 0; i < attributes.size(); i++) {
                    //System.out.println(GetTableName(ads.get(i).toString()) + "= "+attributes.get(i).toString());
                    map.put(GetTableName(ads.get(i).toString()), attributes.get(i).toString());
                }
                listaMaps.add(map);
                System.out.println(map);
            }
            return listaMaps;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            simpleFeatureIterator.close();
            store.dispose();
        }
    }

    /**
     * Metodo que obtiene el nombre de la tabla a partir de una cadena
     *
     * @cadena de texto que contiene el nombre de la tabla
     * @cadena con el nombre de la tabla formateada
     */
    public static String GetTableName(String stringCom) {
        String[] values = stringCom.split(" ");
        return values[1];
    }

    public static void main(String[] args) {
        try {
            for (int i = 0; i < 5; i++) {
                System.out.println("reading " + i);
                String path = "D:\\workspace\\date\\Parcelario_09_2014 - Capa\\PARCELARIO SEPTIEMBRE 2014.shp";
                ShapeManager.getSchameFile(path);
                ShapeManager.getDataShape(path);
                System.out.println("Stopped");
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
