/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icg.entityclassutils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

/**
 *
 * @author John Castillo Valencia
 */
public class DynamicEntityMap {

    public static int UPPER = 0;
    public static int LOWER = 1;
    public static int NORMAL = 2;

    private static void toUpper(Entry<String, String[]> en) {
        for (String c : en.getValue()) {
            c = c.toUpperCase();
        }
    }

    /**
     *
     * @param requestMap, is HTTPServletRequestMap.parameterMap() Map<String,
     * String[]>
     * @return full object Map<String, Object>
     */
    public static Map<String, Object> requestMapToEntityMap(Map<String, String[]> requestMap, Entity entity) {
        Map<String, Object> output = new HashMap<String, Object>();
        for (Entry<String, String[]> en : requestMap.entrySet()) {
            toUpper(en);
            /* input puede ser simple o array String ({} o []) */
            Object input = (en.getValue().length == 1 ? en.getValue()[0] : en.getValue());
            System.out.println("--------------- K  " + en.getKey());
            System.out.println("---------------   " + en.getValue()[0]);
            if (input instanceof String) {
                output.put(en.getKey(), input.equals("") ? null : input);
            } else {
                /* input is instace of String[] */
                output.put(en.getKey(), input);
            }
        }
        return output;
    }

    /**
     *
     * @param requestMap, is HTTPServletRequestMap.parameterMap() Map<String,
     * String[]>
     * @return full object Map<String, Object>
     */
    public static Map<String, Object> requestMapToEntityMap(Map<String, String[]> requestMap) {
        Map<String, Object> output = new HashMap<String, Object>();
        for (Entry<String, String[]> en : requestMap.entrySet()) {
            /* input puede ser simple o array String ({} o []) */
            Object input = (en.getValue().length == 1 ? en.getValue()[0] : en.getValue());
            System.out.println("---- K  " + en.getKey());

            for (String v : en.getValue()) {
                System.out.println("____    " + v);
            }

            if (input instanceof String) {
                output.put(en.getKey(), input.equals("") ? null : input);
            } else {
                /* input is instace of String[] */
                output.put(en.getKey(), input);
            }
        }
        return output;
    }

    /**
     *
     * @param entityMap
     * @return SingleAttributesMap, excluye los atributos Array[] de la entidad
     */
    public static Map<String, Object> SingleAttributesMap(Map<String, Object> entityMap) {
        Map<String, Object> output = new HashMap<String, Object>();
        for (Entry<String, Object> en : entityMap.entrySet()) {
            if (!(en.getValue() instanceof String[])) {
                output.put(en.getKey(), en.getValue());
            }
        }
        return output;
    }

    /**
     *
     * @param entityMap
     * @return multipleAttributesMap, retorna todos los atributos Array[]
     */
    public static Map<String, String[]> multipleAttributesMap(Map<String, Object> entityMap) {
        Map<String, String[]> output = new HashMap<String, String[]>();
        for (Entry<String, Object> en : entityMap.entrySet()) {
            if (en.getValue() instanceof String[]) {
                output.put(en.getKey(), (String[]) en.getValue());
            }
        }
        return output;
    }

    /**
     *
     * @param entityMap
     * @return
     */
    public static boolean hasMultipleAttributes(Map<String, Object> entityMap) {
        for (Entry<String, Object> en : entityMap.entrySet()) {
            if (en.getValue() instanceof String[]) {
                return true;
            }
        }
        return false;
    }

    /**
     *
     * @param entityMap
     * @param attrs
     * @return
     */
    public static Map<String, Object> parseEntityMap(Map<String, Object> entityMap, Entity entity, Entity parent) throws ParseException {
        for (Attribute a : entity.getAttributes()) {
            if (a.getType().equals(Attribute.ENTITY)) {
                if (a.getMultiplicity().equals(Attribute.MULTIPLICITY_1)) {
                    String val = entityMap.get(a.getEntity().primaryKeyName()).toString();
                    entityMap.put(a.getEntity().primaryKeyName(), new Long(val));
                }
            } else {
                if (entityMap.get(a.getName()) != null) {
                    String val = entityMap.get(a.getName()).toString();
                    if (a.getType().equals(Attribute.INTEGER)) {
                        entityMap.put(a.getName(), new Integer(val));
                    } else if (a.getType().equals(Attribute.DATE)) {
                        if (!val.isEmpty()) {
                            DateFormat df = new SimpleDateFormat(a.getDatePattern());
                            entityMap.put(a.getName(), df.parse(val));
                        } else {
                            entityMap.put(a.getName(), null);
                        }
                    } else if (a.getType().equals(Attribute.BOOLEAN)) {
                        entityMap.put(a.getName(), Boolean.parseBoolean(val));
                    } else if (a.getType().equals(Attribute.FLOAT)) {
                        entityMap.put(a.getName(), Float.parseFloat(val));
                    } else if (a.getType().equals(Attribute.TIME)) {
                        if (!val.isEmpty()) {
                            DateFormat df = new SimpleDateFormat("HH:mm:ss");
                            entityMap.put(a.getName(), df.parse(val));
                        } else {
                            entityMap.put(a.getName(), null);
                        }
                    }
                }
            }

        }
        if (parent != null) {
            String parentid = entityMap.get(parent.primaryKeyName()).toString();
            entityMap.put(parent.primaryKeyName(), new Long(parentid));
        }

        if (entityMap.get(entity.primaryKeyName()) == null) {
            entityMap.put(entity.primaryKeyName(), System.currentTimeMillis());
        } else {
            entityMap.put(entity.primaryKeyName(), new Long((String) entityMap.get(entity.primaryKeyName())));
        }
        return entityMap;
    }

    public static Map<String, Object> parseInputMap(Map<String, Object> input, Map<String, String> tableMap) throws ParseException {
        return parseInputMap(input, tableMap, "dd/MM/yyyy", "HH:mm:ss");
    }

    public static Map<String, Object> parseInputMap(Map<String, Object> input, Map<String, String> tableMap, String datePattern, String hourPattern) throws ParseException {
        for (Entry<String, String> c : tableMap.entrySet()) {
            if (input.get(c.getKey()) != null) {
                System.out.println(">> PRE input : val - " + c.getKey() + " : " + input.get(c.getKey()));
                if (c.getValue().equals(PGTableTypes.INTEGER)) {
                    input.put(c.getKey(), new Integer(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.BOOLEAN)) {
                    String svalue = input.get(c.getKey()).toString();
                    input.put(c.getKey(), Boolean.parseBoolean(svalue.equals("on") ? "true" : svalue));
                } else if (c.getValue().equals(PGTableTypes.DATE)) {
                    if (c.getValue().equals("now")) {                        
                        input.put(c.getKey(), new Date());
                    } else {
                        DateFormat df = new SimpleDateFormat(datePattern);
                        input.put(c.getKey(), df.parse(input.get(c.getKey()).toString()));
                    }
                } else if (c.getValue().equals(PGTableTypes.NUMERIC)) {
                    input.put(c.getKey(), Float.parseFloat(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.DOUBLE)) {
                    input.put(c.getKey(), Float.parseFloat(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.REAL)) {
                    input.put(c.getKey(), Float.parseFloat(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.BIGINTEGER)) {
                    input.put(c.getKey(), new Long(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.TIME_WTZ)) {
                    DateFormat df = new SimpleDateFormat(hourPattern);
                    input.put(c.getKey(), df.parse(input.get(c.getKey()).toString()));
                } else if (c.getValue().equals(PGTableTypes.GEOMETRY)) {
                    //
                } else if (c.getValue().equals(PGTableTypes.VARCHAR)) {
                    //
                }
                System.out.println(">>  POST input : val - " + c.getKey() + " : " + input.get(c.getKey()));
            } else {
                // for boolean Extjs v3 checkbox.
                if (c.getValue().equals(PGTableTypes.BOOLEAN)) {
                    input.put(c.getKey(), Boolean.FALSE);
                }
            }
        }
        return input;
    }

    public static Map<String, String> getInsertableFields(Map<String, String> tableMap, Map<String, Object> insertable) {
        Map<String, String> fields = new HashMap<String, String>();
        for (Entry<String, String> c : tableMap.entrySet()) {
            if (insertable.get(c.getKey()) != null) {
                fields.put(c.getKey(), c.getValue());
            }
        }
        return fields;
    }

    public static Map<String, Object> nullToEmptyText(Map<String, Object> input) {
        for (Entry e : input.entrySet()) {
            if (e.getValue() == null) {
                e.setValue("");
            }
        }
        return input;
    }

    public static Map<String, Object> deleteNullValue(Map<String, Object> input) {
        Map<String, Object> newMap = new HashMap<String, Object>();
        for (Entry e : input.entrySet()) {
            if (e.getValue() != null) {
                newMap.entrySet().add(e);
            }
        }
        return newMap;
    }
}