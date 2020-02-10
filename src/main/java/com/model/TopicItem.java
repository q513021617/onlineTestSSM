package com.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "topicItem")
public class TopicItem {
    @Id
    private String id;
    private String description;
    private String title;
    private String type;
    private String ansItemsA;
    private String ansItemsB;
    private String ansItemsC;
    private String ansItemsD;
    private String answer;
    private String subject;
    public TopicItem() {

    }

    public TopicItem(String id, String description, String title, String type, String ansItemsA, String ansItemsB, String ansItemsC, String ansItemsD, String answer, String subject) {
        this.id = id;
        this.description = description;
        this.title = title;
        this.type = type;
        this.ansItemsA = ansItemsA;
        this.ansItemsB = ansItemsB;
        this.ansItemsC = ansItemsC;
        this.ansItemsD = ansItemsD;
        this.answer = answer;
        this.subject = subject;
    }

    public String getAnsItemsA() {
        return ansItemsA;
    }

    public void setAnsItemsA(String ansItemsA) {
        this.ansItemsA = ansItemsA;
    }

    public String getAnsItemsB() {
        return ansItemsB;
    }

    public void setAnsItemsB(String ansItemsB) {
        this.ansItemsB = ansItemsB;
    }

    public String getAnsItemsC() {
        return ansItemsC;
    }

    public void setAnsItemsC(String ansItemsC) {
        this.ansItemsC = ansItemsC;
    }

    public String getAnsItemsD() {
        return ansItemsD;
    }

    public void setAnsItemsD(String ansItemsD) {
        this.ansItemsD = ansItemsD;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
