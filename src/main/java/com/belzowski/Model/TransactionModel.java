package com.belzowski.Model;

import java.beans.Transient;
import java.util.Calendar;

public class TransactionModel {

    private Long id;
    public boolean isBuy;
    private boolean pay;
    private boolean commentSet;
    private UserModel userModel;
    private AuctionModel auctionModel;
    private String userLogin;
    private int itemNumber;
    private double price;
    private Calendar date;

    private String tmpDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isBuy() {
        return isBuy;
    }

    public void setBuy(boolean buy) {
        isBuy = buy;
    }

    public boolean isPay() {
        return pay;
    }

    public void setPay(boolean pay) {
        this.pay = pay;
    }

    public boolean isCommentSet() {
        return commentSet;
    }

    public void setCommentSet(boolean commentSet) {
        this.commentSet = commentSet;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public AuctionModel getAuctionModel() {
        return auctionModel;
    }

    public void setAuctionModel(AuctionModel auctionModel) {
        this.auctionModel = auctionModel;
    }

    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
    }
}
