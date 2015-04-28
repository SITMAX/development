/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.icg.entityclassutils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author John
 */
public class SimpleFilter {

    private Boolean match;
    private String search;
    private String option;
    private List<String> fields;
    private List<Restriction> andRestrictions;
    private List<Restriction> orRestrictions;
    private List<Restriction> statement;
    private Map<String, Object> values;

    public SimpleFilter(Map<String, Object> values) {
        this.values = values;
    }

    public SimpleFilter() {
    }

    public Map<String, Object> getValues() {
        return values;
    }

    public void addValue(String key, Object value) {
        values = values == null ? new HashMap<String, Object>() : values;
        values.put(key, value);
    }

    public void addANDRestriction(Restriction restriction) {
        andRestrictions = andRestrictions == null ? new ArrayList<Restriction>() : andRestrictions;
        andRestrictions.add(restriction);
    }

    public void addORRestriction(Restriction restriction) {
        orRestrictions = orRestrictions == null ? new ArrayList<Restriction>() : orRestrictions;
        orRestrictions.add(restriction);
    }

    public List<Restriction> getAndRrestrictions() {
        return andRestrictions == null ? new ArrayList<Restriction>() : andRestrictions;
    }

    public List<Restriction> getOrRrestrictions() {
        return orRestrictions == null ? new ArrayList<Restriction>() : orRestrictions;
    }

    public Map<String, Object> mapFields() {
        Map<String, Object> map = new HashMap<String, Object>();
        if (fields != null) {
            for (String field : fields) {
                map.put(field, "%" + search + "%");
            }
        }
        return map;
    }

    public void addField(String field) {
        fields = fields == null ? new ArrayList<String>() : fields;
        fields.add(field);
    }

    public void addFields(String[] fields) {
        for (String field : fields) {
            this.addField(field);
        }
    }

    public List<String> getFields() {
        return fields;
    }

    public void setFields(List<String> fields) {
        this.fields = fields;
    }

    public Boolean getMatch() {
        return match;
    }

    public void setMatch(Boolean match) {
        this.match = match;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getSearch() {
        return search;
    }

    public void setSearch(String search) {
        this.search = search;
    }
}
