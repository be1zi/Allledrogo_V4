package com.belzowski.Model;
import java.beans.Transient;
import java.util.Calendar;
import java.util.List;

public class MessageModel {


    private Long id;
    private String topic;
    private String ownerLogin;
    private String senderLogin;
    private boolean viewed;
    private int itemNumber;
    private Calendar date;

    private String tmpDate;
    List<SingleMessageModel> singleMessageModels;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getOwnerLogin() {
        return ownerLogin;
    }

    public void setOwnerLogin(String ownerLogin) {
        this.ownerLogin = ownerLogin;
    }

    public String getSenderLogin() {
        return senderLogin;
    }

    public void setSenderLogin(String senderLogin) {
        this.senderLogin = senderLogin;
    }

    public boolean isViewed() {
        return viewed;
    }

    public void setViewed(boolean viewed) {
        this.viewed = viewed;
    }

    public List<SingleMessageModel> getSingleMessageModels() {
        return singleMessageModels;
    }

    public void setSingleMessageModels(List<SingleMessageModel> singleMessageModels) {
        this.singleMessageModels = singleMessageModels;
    }

    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
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

    @Override
    public String toString() {
        return "MessageModel{" +
                "id=" + id +
                ", topic='" + topic + '\'' +
                ", ownerLogin='" + ownerLogin + '\'' +
                ", senderLogin='" + senderLogin + '\'' +
                ", viewed=" + viewed +
                ", itemNumber=" + itemNumber +
                ", date=" + date +
                ", tmpDate='" + tmpDate + '\'' +
                ", singleMessageModels=" + singleMessageModels +
                '}';
    }
}
