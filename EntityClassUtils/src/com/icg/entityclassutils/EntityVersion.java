/*
 * ICG SRL - International Consulting Group 2011
 */
package com.icg.entityclassutils;

import java.util.Date;
import java.util.Map;

/**
 * @since 23-03-2011
 * @author Johnston Castillo Valencia
 * email: john.gnu@gmail.com
 */
public class EntityVersion {

    private String objectId;
    private String logId;
    private String operation;
    private String user;
    private Date date;
    private Map<String, ?> objectOld;
    private Map<String, ?> objectNew;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getLogId() {
        return logId;
    }

    public void setLogId(String logId) {
        this.logId = logId;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public Map<String, ?> getObjectNew() {
        return objectNew;
    }

    public void setObjectNew(Map<String, ?> objectNew) {
        this.objectNew = objectNew;
    }

    public Map<String, ?> getObjectOld() {
        return objectOld;
    }

    public void setObjectOld(Map<String, ?> objectOld) {
        this.objectOld = objectOld;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
}
