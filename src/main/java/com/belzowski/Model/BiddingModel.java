package com.belzowski.Model;

import java.beans.Transient;
import java.util.Calendar;

public class BiddingModel {

    private Long id;
    private Double price;
    private int itemNumber;
    private Calendar date;
    private UserModel userModel;
    private String userLogin;

    private String tmpDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
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

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public String getUserLogin() {
        return userLogin;
    }

    public void setUserLogin(String userLogin) {
        this.userLogin = userLogin;
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
