package com.UUID;

import java.util.UUID;

public class UUIDgenarater {

    private String UUID_;

    public UUIDgenarater() {
        this.UUID_ = UUID.randomUUID().toString();
    }

    public String getUUID() {
        String tempUUID="";
        String[] strArr=this.UUID_.split("-");
        for (String c:strArr) {
            tempUUID=tempUUID + c;
        }
        return tempUUID;
    }


}
