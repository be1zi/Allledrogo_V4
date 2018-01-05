package com.belzowski.Support.Static;

public class Constant {

    //User
    private static String restURL = "http://localhost:8081";
    public static String getUserURL = restURL + "/user/getuser";
    public static String addUserURL = restURL + "/user/adduser";
    public static String editUserURL = restURL + "/account/edit";
    public static String editEmailURL = restURL + "/account/editemail";
    public static String editAccountURL = restURL + "/account/editaccount";

    //Auction
    public static String addAuction = restURL + "/sale/add";
    public static String getAuction = restURL + "/auction/get";
    public static String editAuction = restURL + "/auction/edit";
    public static String deleteAuctionURL = restURL + "/auction/delete";
    public static String addAuctionAgain = restURL + "/auction/addagain";
    public static String addToObservedURL = restURL + "/auction/addToObserved";

    //shopping
    public static String buyURL = restURL + "/shopping/buy";
    public static String getBoughtURL = restURL + "/shopping/bought";
    public static String getAuctionedURL = restURL + "/shopping/auctioned";
    public static String getObservedURL = restURL + "/shopping/observed";

    //sale
    public static String getMyAuction = restURL + "/sale/getMyAuction";
    public static String getSoldAuctionURL = restURL + "/sale/getSold";
    public static String getTransactions = restURL + "/shopping/transactions";

    //Home - Dashboard
    public static String getHomeAuction = restURL + "/home/get";
    public static String getAuctionsByCategory = restURL + "/auction/searchByCategory";

    //Message
    public static String addFirstMessageURL = restURL + "/message/addFirst";
    public static String addMessageURL = restURL + "/message/add";

    //test
    public static String testObjectURL = restURL + "/test/21";
    public static String addTestURL = restURL + "/test/addtest";
}
