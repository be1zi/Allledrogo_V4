package com.belzowski.Model;

public class TransactionModel {

    private Long id;
    private boolean isBuy;
    private boolean isPay;
    private boolean isCommentSet;
    private UserModel userModel;
    private AuctionModel auctionModel;

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
        return isPay;
    }

    public void setPay(boolean pay) {
        isPay = pay;
    }

    public boolean isCommentSet() {
        return isCommentSet;
    }

    public void setCommentSet(boolean commentSet) {
        isCommentSet = commentSet;
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
}