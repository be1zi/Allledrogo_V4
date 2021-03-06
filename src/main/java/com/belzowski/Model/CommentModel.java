package com.belzowski.Model;

import com.belzowski.Support.Enum.Comment;

import java.beans.Transient;
import java.util.Calendar;

public class CommentModel {

    private Long id;
    private int rate;
    private String description;
    private String senderLogin;
    private Calendar date;
    private Comment type;
    private String auctionTitle;
    private Long transactionId;
    private String tmpDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSenderLogin() {
        return senderLogin;
    }

    public void setSenderLogin(String senderLogin) {
        this.senderLogin = senderLogin;
    }

    public Calendar getDate() {
        return date;
    }

    public void setDate(Calendar date) {
        this.date = date;
    }

    public Comment getType() {
        return type;
    }

    public void setType(Comment type) {
        this.type = type;
    }

    public String getAuctionTitle() {
        return auctionTitle;
    }

    public void setAuctionTitle(String auctionTitle) {
        this.auctionTitle = auctionTitle;
    }

    @Transient
    public String getTmpDate() {
        return tmpDate;
    }

    @Transient
    public void setTmpDate(String tmpDate) {
        this.tmpDate = tmpDate;
    }

    public Long getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(Long transactionId) {
        this.transactionId = transactionId;
    }

    @Override
    public String toString() {
        return "CommentModel{" +
                "id=" + id +
                ", rate=" + rate +
                ", description='" + description + '\'' +
                ", senderLogin='" + senderLogin + '\'' +
                ", date=" + date +
                ", type=" + type +
                ", auctionTitle='" + auctionTitle + '\'' +
                ", transactionId=" + transactionId +
                ", tmpDate='" + tmpDate + '\'' +
                '}';
    }
}
