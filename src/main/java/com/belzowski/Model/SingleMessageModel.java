package com.belzowski.Model;


import java.beans.Transient;
import java.util.Calendar;

public class SingleMessageModel {

    private Long id;
    private String authorLogin;
    private String content;
    private Long messageModelId;
    private Calendar date;
    private String tmpDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAuthorLogin() {
        return authorLogin;
    }

    public void setAuthorLogin(String authorLogin) {
        this.authorLogin = authorLogin;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getMessageModelId() {
        return messageModelId;
    }

    public void setMessageModelId(Long messageModelId) {
        this.messageModelId = messageModelId;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    @Transient
    public String getTmpDate() {
        return tmpDate;
    }

    @Transient
    public void setTmpDate(String tmpDate) {
        this.tmpDate = tmpDate;
    }
}
