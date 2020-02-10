package com.model;

import java.util.Date;

public class Sitedata {
    private String id;

    private Integer viewcount;

    private Integer testcount;

    private Date time;

    private Integer registercount;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Integer getViewcount() {
        return viewcount;
    }

    public void setViewcount(Integer viewcount) {
        this.viewcount = viewcount;
    }

    public Integer getTestcount() {
        return testcount;
    }

    public void setTestcount(Integer testcount) {
        this.testcount = testcount;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getRegistercount() {
        return registercount;
    }

    public void setRegistercount(Integer registercount) {
        this.registercount = registercount;
    }
}