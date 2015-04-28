/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.io.Serializable;

/**
 * @since 23-05-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class Block implements Serializable {

    private String id;
    private String name;

    public Block() {
        id = System.nanoTime() + "";
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
