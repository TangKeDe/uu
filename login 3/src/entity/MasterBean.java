package entity;

import java.io.Serializable;

public class MasterBean implements Serializable {
    private String masterName;
    private String masterPass;
    private String masterType;


    public String getMasterName() {
        return masterName;
    }
    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }
    public String getMasterPass() {
        return masterPass;
    }
    public void setMasterPass(String masterPass) {
        this.masterPass = masterPass;
    }
    public String getMasterType() {
        return masterType;
    }
    public void setMasterType(String masterType) {
        this.masterType = masterType;
    }
}
