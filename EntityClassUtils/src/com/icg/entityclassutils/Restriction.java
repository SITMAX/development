/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icg.entityclassutils;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class Restriction {

    public static String EQUALS = "=";
    public static String NOT_EQUALS = "<>";
    public static String DISTINCT = "<>";
    public static String GREATER = ">";
    public static String LEES = "<";
    public static String GREATER_EQUALS = ">=";
    public static String LESS_EQUALS = "<=";
    public static String LIKE = "like";
    public static String BETWEEN = "between";
    private String field;
    private String operator;
    private String keyValue;
    private Boolean match;

    public Restriction(String field, String operator, String keyValue, Boolean match) {
        this.field = field;
        this.operator = operator;
        this.keyValue = keyValue;
        this.match = match;
    }

    public Restriction(String field, String operator, String keyValue) {
        this.field = field;
        this.operator = operator;
        this.keyValue = keyValue;
    }

    public Restriction(String field, String operator) {
        this.field = field;
        this.operator = operator;
        this.keyValue = field;
    }
    
    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public Boolean getMatch() {
        return match == null ? Boolean.FALSE : Boolean.TRUE;
    }

    public void setMatch(Boolean match) {
        this.match = match;
    }

    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    @Override
    public String toString() {
        if (operator.equals(LIKE) && !this.getMatch()) {
            return "upper(" + this.field + ") " + this.operator + " upper(:" + this.keyValue + ")";
        }
        return this.field + " " + this.operator + " :" + this.keyValue;
    }
}