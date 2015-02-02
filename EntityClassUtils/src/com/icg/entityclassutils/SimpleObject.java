/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class SimpleObject {

    private Long id;
    private Object value;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }
}
