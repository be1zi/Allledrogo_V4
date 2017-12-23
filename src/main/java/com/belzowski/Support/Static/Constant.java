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
    public static String getMyAuction = restURL + "/sale/getMyAuction";

    public static String testObjectURL = restURL + "/test/21";
    public static String addTestURL = restURL + "/test/addtest";
}
