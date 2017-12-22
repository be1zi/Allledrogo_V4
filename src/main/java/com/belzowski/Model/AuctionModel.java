package com.belzowski.Model;

import java.beans.Transient;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
public class AuctionModel {

    private Long id;
    private Long userId;
    private Double buyNowPrice;
    private Double biddingPrice;
    private int itemNumber;
    private Calendar startDate;
    private Calendar endDate;
    private int viewNumber;
    private boolean isAuctionType;
    private boolean isBuyNowType;

    private String category;
    private String title;
    private String description;
    private String state;
    private String color;
    private String damaged;
    private String productionDate;
    private String warranty;

    private List<byte[]> file;

    private List<BiddingModel> biddingList;
    private List<UserModel> usersList;

    private String tmpDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getBuyNowPrice() {
        return buyNowPrice;
    }

    public void setBuyNowPrice(Double buyNowPrice) {
        this.buyNowPrice = buyNowPrice;
    }

    public Double getBiddingPrice() {
        return biddingPrice;
    }

    public void setBiddingPrice(Double biddingPrice) {
        this.biddingPrice = biddingPrice;
    }

    public int getItemNumber() {
        return itemNumber;
    }

    public void setItemNumber(int itemNumber) {
        this.itemNumber = itemNumber;
    }

    public Calendar getStartDate() {
        return startDate;
    }

    public void setStartDate(Calendar startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Calendar endDate) {
        this.endDate = endDate;
    }

    public int getViewNumber() {
        return viewNumber;
    }

    public void setViewNumber(int viewNumber) {
        this.viewNumber = viewNumber;
    }

    public List<BiddingModel> getBiddingList() {
        return biddingList;
    }

    public void setBiddingList(List<BiddingModel> biddingList) {
        this.biddingList = biddingList;
    }

    public List<UserModel> getUsersList() {
        return usersList;
    }

    public void setUsersList(List<UserModel> usersList) {
        this.usersList = usersList;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDamaged() {
        return damaged;
    }

    public void setDamaged(String damaged) {
        this.damaged = damaged;
    }

    public String getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(String productionDate) {
        this.productionDate = productionDate;
    }

    public boolean isAuctionType() {
        return isAuctionType;
    }

    public void setAuctionType(boolean auctionType) {
        isAuctionType = auctionType;
    }

    public boolean isBuyNowType() {
        return isBuyNowType;
    }

    public void setBuyNowType(boolean buyNowType) {
        isBuyNowType = buyNowType;
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public List<byte[]> getFile() {
        return file;
    }

    public void setFile(List<byte[]> file) {
        this.file = file;
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
        return "AuctionModel{" +
                "id=" + id +
                ", userId=" + userId +
                ", buyNowPrice=" + buyNowPrice +
                ", biddingPrice=" + biddingPrice +
                ", itemNumber=" + itemNumber +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", viewNumber=" + viewNumber +
                ", isAuctionType=" + isAuctionType +
                ", isBuyNowType=" + isBuyNowType +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", state='" + state + '\'' +
                ", color='" + color + '\'' +
                ", damaged='" + damaged + '\'' +
                ", productionDate='" + productionDate + '\'' +
                ", warranty='" + warranty + '\'' +
                ", file=" + file +
                ", biddingList=" + biddingList +
                ", usersList=" + usersList +
                ", tmpDate='" + tmpDate + '\'' +
                '}';
    }
}
