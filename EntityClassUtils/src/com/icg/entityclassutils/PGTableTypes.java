/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.io.Serializable;

/**
 * @since 16-11-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class PGTableTypes implements Serializable {

    static public String VARCHAR = "character varying";
    static public String TEXT = "text";
    static public String DATE = "date";
    static public String INTEGER = "integer";
    static public String BOOLEAN = "boolean";
    static public String DOUBLE = "double precision";
    static public String BIGINTEGER = "bigint";
    static public String TIME_WTZ = "time without time zone";
    static public String NUMERIC = "numeric";
    static public String REAL = "real";
    static public String GEOMETRY = "geometry";
}
