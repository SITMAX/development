/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class Grouper {

    private String id;
    private String name;
    private Block block;

    public Grouper() {
        id = System.nanoTime() + "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Block getBlock() {
        return block;
    }

    public void setBlock(Block block) {
        this.block = block;
    }
}
