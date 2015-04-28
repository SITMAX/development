/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.util.List;
import java.util.Map;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class EntityResult {

    private List<Map<String, Object>> listData;
    private Map<String, Object> objectData;
    private Boolean success;
    private Entity entity;
    private int size;
    private Object primaryKey;

    public List<Map<String, Object>> getListData() {
        return listData;
    }

    public void setListData(List<Map<String, Object>> listData) {
        this.listData = listData;
    }

    public Map<String, Object> getObjectData() {
        if(this.listData != null) {
            if(this.listData.size() == 1) {                
                objectData = this.listData.get(0);
            }
        }
        return objectData;
    }

    public void setObjectData(Map<String, Object> objectData) {
        this.objectData = objectData;
    }

    public int getSize() {
        return listData != null ? listData.size() : 0;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }

    public Entity getEntity() {
        return entity;
    }

    public void setEntity(Entity entity) {
        this.entity = entity;
    }

    public Object getPrimaryKey() {
        return primaryKey;
    }

    public void setPrimaryKey(Object primaryKey) {
        this.primaryKey = primaryKey;
    }
}
