/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.io.Serializable;
import java.util.List;

/**
 * @since 23-05-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class Element implements Serializable {

    private String id;
    private String text;
    private String iconCls;
    private boolean leaf = false;
    private boolean draggable = false;
    private Boolean expanded = true;
    private String href;
    private String hrefTarget;
    private List<Element> children;

    public List<Element> getChildren() {
        return children;
    }

    public void setChildren(List<Element> children) {
        this.children = children;
    }

    public boolean isDraggable() {
        return draggable;
    }

    public void setDraggable(boolean draggable) {
        this.draggable = draggable;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getHrefTarget() {
        return hrefTarget;
    }

    public void setHrefTarget(String hrefTarget) {
        this.hrefTarget = hrefTarget;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isLeaf() {
        return leaf;
    }

    public void setLeaf(boolean leaf) {
        this.leaf = leaf;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Boolean getExpanded() {
        return expanded;
    }

    public void setExpanded(Boolean expanded) {
        this.expanded = expanded;
    }
}
