/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import com.google.gson.Gson;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONArray;
import org.apache.commons.beanutils.PropertyUtils;

/**
 * @since 23-03-2011
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 */
public class Entity implements Serializable {

    static public String SCHEMA = "public";
    static public String ACTIVO = "A";
    static public String PASIVO = "P";
    static public String READONLY = "R";
    private String id;
    private String name;
    private String urlPath;
    private String packagename;
    private String struct;
    private String schema;
    private List<Attribute> attributes = new ArrayList<Attribute>();
    private List<Grouper> groups = new ArrayList<Grouper>();
    private List<Block> blocks = new ArrayList<Block>();
    private Attribute optionVisible;
    private Object objectEntity;
    private String urlPersist;
    //private int nroAttributes;
    //private int indexOfAttributeVisible;
    private List<Attribute> relOption = new ArrayList<Attribute>();
    private boolean child;
    private boolean hasDataBase;
    private String parent;
    private String optionSeparator = " - ";
    private Map<String, Object> data;

    public String primaryKeyName() {
        return (id + "_id").toLowerCase();
    }

    public boolean existAttributeById(String id) {
        for (Attribute a : attributes) {
            if (a.getName().equals(id)) {
                return true;
            }
        }
        return false;
    }

    public void addAttribute(Attribute attr) {
        attributes.add(attr);
    }

    public void updateAttribute(Attribute attr) {
        attr.setParentName(id);
        attributes.set(indexOfAttribute(attr), attr);
    }

    public void updateGroup(Grouper group) {
        groups.set(indexOfGroup(group), group);
    }

    public int indexOfAttribute(Attribute attr) {
        int i = 0;
        for (Attribute a : attributes) {
            if (a.getName().equals(attr.getName())) {
                return i;
            }
            i++;
        }
        return -1;
    }

    public Attribute getAttributeByName(String name) {
        for (Attribute a : attributes) {
            if (a.getName().equals(name)) {
                return a;
            }
        }
        return null;
    }

//    public String getId() {
//        if (id != null) {
//            return id;
//        } else {
//            return name.toLowerCase() + "_id";
//        }
//    }
    public int getNroAttributes() {
        return attributes.size();
    }

    public int getIndexOfAttributeVisible() {
        //return attributes.indexOf(optionVisible);
        int index = 0;
        if (optionVisible != null) {
            for (Attribute a : attributes) {
                if (a.getName().equals(optionVisible.getName())) {
                    return index;
                }
                index++;
            }
        }
        return index;
    }

    public int indexOfGroup(Grouper group) {
        int index = 0;
        for (Grouper g : groups) {
            if (g.getId().equals(group.getId())) {
                return index;
            }
            index++;
        }
        return -1;
    }

    public int indexOfBlock(Block block) {
        int index = 0;
        for (Block b : blocks) {
            if (b.getId().equals(b.getId())) {
                return index;
            }
            index++;
        }
        return -1;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public List<Attribute> getAttributes() {
        List<Attribute> attrs = new ArrayList<Attribute>();
        for (Attribute a : attributes) {
            if (!a.getType().equals(Attribute.SUBENTITY)) {
                attrs.add(a);
            }
        }
        return attrs;
    }

    public List<Attribute> getAllAttributes() {
        for (Attribute a : attributes) {
            if (optionVisible != null) {
                if (a.getName().equals(optionVisible.getName())) {
                    a.setVisible(Boolean.TRUE);
                }
            }
        }
        return attributes;
    }

    public void setAttributes(List<Attribute> attributes) {
        this.attributes = attributes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPackagename() {
        return packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename;
    }

    public String getStruct() {
        return struct;
    }

    public void setStruct(String struct) {
        this.struct = struct;
    }

    public String getOptionSeparator() {
        return optionSeparator;
    }

    public void setOptionSeparator(String optionSeparator) {
        this.optionSeparator = optionSeparator;
    }

    public List<Attribute> getRelOption() {
        return relOption;
    }

    public void setRelOption(List<Attribute> relOption) {
        this.relOption = relOption;
    }

    public Attribute getOptionVisible() {
        return optionVisible;
    }

    public void setOptionVisible(Attribute optionVisible) {
        this.optionVisible = optionVisible;
    }

    public String getUrlPath() {
        return urlPath;
    }

    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }

    public List<Grouper> getGroups() {
        return groups;
    }

    public void setGroups(List<Grouper> groups) {
        this.groups = groups;
    }

    public void addGroup(Grouper group) {
        if (this.getGroupById(group.getId()) == null) {
            this.groups.add(group);
        } else {
            this.updateGroup(group);
        }
    }

    public Object getObjectEntity() throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Gson gson = new Gson();
        PropertyUtils.setProperty(objectEntity, "struct", gson.toJson(this.metaAttributesInfo()));
        PropertyUtils.setProperty(objectEntity, "groups", gson.toJson(groups));
        if (optionVisible != null) {
            PropertyUtils.setProperty(objectEntity, "visible", gson.toJson(optionVisible));
        }
        PropertyUtils.setProperty(objectEntity, "blocks", JSONArray.fromObject(blocks).toString());
        return objectEntity;
    }

    public List<Attribute> metaAttributesInfo() {
        List<Attribute> nlist = new ArrayList<Attribute>();
        for (Attribute a : attributes) {
            if (a.getType().equals(Attribute.ENTITY) || a.getType().equals(Attribute.SUBENTITY)) {
                a.setEntity(null);
            }
            nlist.add(a);
        }
        return nlist;
    }

    public void setObjectEntity(Object objectEntity) {
        this.objectEntity = objectEntity;
    }

    public List<Block> getBlocks() {
        return blocks;
    }

    public void setBlocks(List<Block> blocks) {
        this.blocks = blocks;
    }

    public void deleteGroup(Grouper group) {
        for (Attribute a : attributes) {
            if (a.getGroup() != null) {
                if (a.getGroup().getId().equals(group.getId())) {
                    a.setGroup(null);
                }
            }
        }
        groups.remove(this.indexOfGroup(group));
    }

    public void deleteAttribute(Attribute attr) {
        attributes.remove(this.indexOfAttribute(attr));
    }

    public Block getBlockById(String blockid) {
        for (Block b : blocks) {
            if (b.getId().equals(blockid)) {
                return b;
            }
        }
        return null;
    }

    public Grouper getGroupById(String groupid) {
        for (Grouper g : groups) {
            if (g.getId().equals(groupid)) {
                return g;
            }
        }
        return null;
    }

    public List getExtTreeLoaderDataStruct() {
        List<Element> els = new ArrayList<Element>();
        for (Block b : blocks) {
            Element folder = new Element();
            folder.setId(b.getId());
            folder.setText(b.getName());
            folder.setChildren(new ArrayList<Element>());
            folder.setExpanded(Boolean.TRUE);
            for (Attribute a : attributes) {
                if (a.getBlock() != null) {
                    if (a.getBlock().getId().equals(b.getId())) {
                        Element child = new Element();
                        child.setId(a.getName());
                        child.setText("(A) [" + a.getName() + "] " + a.getLabel());
                        child.setLeaf(true);
                        child.setIconCls("attribute");
                        folder.getChildren().add(child);
                    }
                }
            }
            for (Grouper g : groups) {
                if (g.getBlock() != null) {
                    if (g.getBlock().getId().equals(b.getId())) {
                        Element child = new Element();
                        child.setId(g.getId());
                        child.setText("(G) " + g.getName());
                        child.setLeaf(true);
                        child.setIconCls("group");
                        folder.getChildren().add(child);
                    }
                }
            }
            els.add(folder);
        }
        return els;
    }

    public Object getObjectItemById(String id) {
        Object e = this.getGroupById(id) == null ? this.getAttributeByName(id) : this.getGroupById(id);
        return e != null ? e : this.getBlockById(id);
    }

    public void setItemBlock(Block block, String el) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object obj = this.getObjectItemById(el);
        PropertyUtils.setProperty(obj, "block", block);
        if (obj instanceof Grouper) {
            this.updateGroup((Grouper) obj);
        }
        if (obj instanceof Attribute) {
            PropertyUtils.setProperty(obj, "group", null);
            this.updateAttribute((Attribute) obj);
        }
    }

    public List<Attribute> getAttributesOfGroup(Grouper group) {
        List<Attribute> gattrs = new ArrayList<Attribute>();
        for (Attribute a : attributes) {
            if (a.getGroup() != null) {
                if (a.getGroup().getId().equals(group.getId())) {
                    gattrs.add(a);
                }
            }
        }
        return gattrs;
    }

    public void deleteNodeBlock(String id) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        System.out.println("................" + id);
        Object o = this.getObjectItemById(id);
        if (o instanceof Block) {
            this.deleteBlockInAttrs(id);
            this.deleteBlockInGroups(id);
            blocks.remove(this.indexOfBlock(this.getBlockById(id)));
        } else {
            System.out.println("................" + o.getClass());
            PropertyUtils.setProperty(o, "block", null);
        }
    }

    private void deleteBlockInAttrs(String blockid) {
        for (Attribute a : attributes) {
            if (a.getBlock() != null) {
                if (a.getBlock().getId().equals(blockid)) {
                    a.setBlock(null);
                }
            }
        }
    }

    private void deleteBlockInGroups(String blockid) {
        for (Grouper g : groups) {
            if (g.getBlock() != null) {
                if (g.getBlock().getId().equals(blockid)) {
                    g.setBlock(null);
                }
            }
        }
    }

    public boolean isChild() {
        return child;
    }

    public void setChild(boolean child) {
        this.child = child;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getUrlPersist() {
        return urlPersist;
    }

    public void setUrlPersist(String urlPersist) {
        this.urlPersist = urlPersist;
    }

    public boolean hasSubEntities() {
        int count = 0;
        for (Attribute a : getAllAttributes()) {
            if (a.getType().equals(Attribute.SUBENTITY)) {
                count++;
            }
        }
        if (count == 0) {
            return false;
        } else {
            return true;
        }
    }

    public boolean setUp(Attribute attribute) {
        int index = indexOfAttribute(attribute);
        if (index != 0) {
            Collections.swap(attributes, index - 1, index);
            return true;
        }
        return false;
    }

    public boolean setDown(Attribute attribute) {
        int index = indexOfAttribute(attribute);
        if (index != attributes.size() - 1) {
            Collections.swap(attributes, index, index + 1);
            return true;
        }
        return false;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public boolean isHasDataBase() {
        return hasDataBase;
    }

    public void setHasDataBase(boolean hasDataBase) {
        this.hasDataBase = hasDataBase;
    }    
}
