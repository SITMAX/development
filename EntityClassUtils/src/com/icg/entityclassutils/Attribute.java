/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 */
public class Attribute implements Serializable {

    static public String VARCHAR = "string";
    static public String TEXT = "text";
    static public String DATE = "date"; // default "2011-01-01"
    static public String TIME = "time"; // default "21:15:00.523"
    static public String TIMESTAMP = "timestamp"; // DATE" "TIME
    static public String INTEGER = "integer";
    static public String ENTITY = "entity";
    static public String DATENOW = "now()";
    static public String BOOLEAN = "boolean";
    static public String DOUBLE = "double";
    static public String FLOAT = "float";
    static public String LONG = "long";
    static public String MULTIPLICITY_N = "n";
    static public String MULTIPLICITY_1 = "1";
    //static public String CLASS = "class";
    //static public String OBJECT = "object";
    static public String SUBENTITY = "subentity";
    public static String GEOMETRY = "geometry";
    private String name;
    private String id;
    private String classtype;
    private String label;
    private String type;
    private Integer length;
    private String mask;
    private String datePattern;
    private String numberPattern;
    private Boolean nullable;
    private Boolean hidden;
    private Boolean unique;
    private String defaultValue;
    private String rel;
    private String relID;
    private Entity entity;
    private String yesValue;
    private String noValue;
    private String multiplicity;
    private String yesNoSelect;
    private String parentName;
    private String childName;
    private String childLabel;
    private Integer maxChildren;
    private Class realType;
    @Deprecated
    private Boolean optionVisible;
    private Boolean visible;
    private List<SimpleObject> data;
    private Grouper group;
    private Block block;
    private String description;
    private Boolean allowDecimals;
    private Boolean allowNegative;
    private Integer decimalPrecision;
    private Integer minValue;
    private Integer maxValue;
    private Boolean createDataBase;

    public java.lang.Class getRealType() {
        if (type.equals(BOOLEAN)) {
            return Boolean.class;
        }
        if (type.equals(DATE) || type.equals(TIME) || type.equals(TIMESTAMP)) {
            return Date.class;
        }
        if (type.equals(INTEGER)) {
            return Integer.class;
        }
        if (type.equals(TEXT) || type.equals(VARCHAR)) {
            return String.class;
        }
        if (type.equals(DOUBLE)) {
            return Double.class;
        }
        if (type.equals(LONG)) {
            return Long.class;
        }
        if (type.equals(FLOAT)) {
            return Float.class;
        }
        return Object.class;
    }

    public String getRelID() {
        return relID;
    }

    public void setRelID(String relID) {
        this.relID = relID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Boolean getUnique() {
        return unique;
    }

    public void setUnique(Boolean unique) {
        this.unique = unique;
    }

    public String getClasstype() {
        return classtype;
    }

    public void setClasstype(String classtype) {
        this.classtype = classtype;
    }

    public String getDatePattern() {
        return datePattern;
    }

    public void setDatePattern(String datePattern) {
        this.datePattern = datePattern;
    }

    public String getDefaultValue() {
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = "".equals(defaultValue) ? null : defaultValue;
    }

    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
        this.entity = entity;
    }

    public Boolean getHidden() {
        return hidden;
    }

    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getLength() {
        return length;
    }

    public void setLength(Integer length) {
        this.length = length;
    }

    public String getMask() {
        return mask;
    }

    public void setMask(String mask) {
        this.mask = mask;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getNullable() {
        return nullable == null ? false : nullable;
    }

    public void setNullable(Boolean nullable) {
        this.nullable = nullable;
    }

    public String getNumberPattern() {
        return numberPattern;
    }

    public void setNumberPattern(String numberPattern) {
        this.numberPattern = numberPattern;
    }

    public String getRel() {
        return rel;
    }

    public void setRel(String rel) {
        this.rel = rel;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getNoValue() {
        return noValue;
    }

    public void setNoValue(String noValue) {
        this.noValue = noValue;
    }

    public String getYesValue() {
        return yesValue;
    }

    public void setYesValue(String yesValue) {
        this.yesValue = yesValue;
    }

    public String getMultiplicity() {
        return multiplicity;
    }

    public void setMultiplicity(String multiplicity) {
        this.multiplicity = multiplicity;
    }

    public String getYesNoSelect() {
        return yesNoSelect;
    }

    public void setYesNoSelect(String yesNoSelect) {
        this.yesNoSelect = yesNoSelect;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    @Deprecated
    public Boolean getOptionVisible() {
        return optionVisible;
    }

    @Deprecated
    public void setOptionVisible(Boolean optionVisible) {
        this.optionVisible = optionVisible;
    }

    public List<SimpleObject> getData() {
        return data;
    }

    public void setData(List<SimpleObject> data) {
        this.data = data;
    }

    public Grouper getGroup() {
        return group;
    }

    public void setGroup(Grouper group) {
        this.group = group;
    }

    public Block getBlock() {
        return block;
    }

    public void setBlock(Block block) {
        this.block = block;
    }

    public String getChildLabel() {
        return childLabel;
    }

    public void setChildLabel(String childLabel) {
        this.childLabel = childLabel;
    }

    public String getChildName() {
        return childName;
    }

    public void setChildName(String childName) {
        this.childName = childName;
    }

    public Integer getMaxChildren() {
        return maxChildren;
    }

    public void setMaxChildren(Integer maxChildren) {
        this.maxChildren = maxChildren;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getAllowDecimals() {
        return allowDecimals == null ? false : allowDecimals;
    }

    public void setAllowDecimals(Boolean allowDecimals) {
        this.allowDecimals = allowDecimals;
    }

    public Boolean getAllowNegative() {
        return allowNegative == null ? false : allowNegative;
    }

    public void setAllowNegative(Boolean allowNegative) {
        this.allowNegative = allowNegative;
    }

    public Integer getDecimalPrecision() {
        return decimalPrecision;
    }

    public void setDecimalPrecision(Integer decimalPrecision) {
        this.decimalPrecision = decimalPrecision;
    }

    public Integer getMaxValue() {
        return maxValue;
    }

    public void setMaxValue(Integer maxValue) {
        this.maxValue = maxValue;
    }

    public Integer getMinValue() {
        return minValue;
    }

    public void setMinValue(Integer minValue) {
        this.minValue = minValue;
    }

    public Boolean getCreateDataBase() {
        return createDataBase == null ? Boolean.FALSE : createDataBase;
    }

    public void setCreateDataBase(Boolean createDataBase) {
        this.createDataBase = createDataBase;
    }

    public String getColumnName() {
        return type.equals(Attribute.ENTITY) ? name + "_id" : name;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }
}
