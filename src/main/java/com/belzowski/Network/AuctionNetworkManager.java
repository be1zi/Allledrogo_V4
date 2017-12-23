package com.belzowski.Network;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Formatter.DateFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import com.belzowski.Support.Enum.Alert;
import org.springframework.http.HttpStatus;

import java.util.ArrayList;
import java.util.List;


public class AuctionNetworkManager {

    public static AuctionModel addAuction(AuctionModel auctionModel, HttpSession session){

        auctionModel.setId(Long.valueOf(1));
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<AuctionModel> responseEntity = restTemplate.postForEntity(Constant.addAuction, auctionModel, AuctionModel.class);

        return responseStatus(responseEntity, session);
    }

    public static List<AuctionModel> getMyAuction(UserModel userModel, HttpSession session){

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<AuctionModel[]> responseEntity = restTemplate.postForEntity(Constant.getMyAuction, userModel, AuctionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            session.setAttribute("alert", Alert.OK);
            AuctionModel[] result = responseEntity.getBody();

            List<AuctionModel> myAuctionList = new ArrayList<>();

            for(int i=0; i<result.length; i++){
                DateFormatter dateFormatter = new DateFormatter(result[i].getEndDate(),"yyyy-MM-dd HH:mm");
                result[i].setTmpDate(dateFormatter.calendarToString());
                myAuctionList.add(result[i]);
            }

            return myAuctionList;
        }else{
            session.setAttribute("alert", Alert.FOUND);
        }
        return null;
    }

//    public static UserModel getUserFromNetwork(UserModel userModel, HttpSession session){
//
//        RestTemplate restTemplate = new RestTemplate();
//
//        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.getUserURL, userModel, UserModel.class);
//
//        if (responseEntity.getStatusCode().is2xxSuccessful()){
//            session.setAttribute("alert", Alert.OK);
//            UserModel userModel1 = responseEntity.getBody();
//            return userModel1;
//        }else if (responseEntity.getStatusCodeValue() == 302) {
//            session.setAttribute("alert", Alert.FOUND);
//        }else if (responseEntity.getStatusCodeValue() == 301) {
//            session.setAttribute("alert", Alert.NOT_FOUND);
//        }
//
//        return null;
//    }


    private static AuctionModel responseStatus(ResponseEntity<AuctionModel> responseEntity, HttpSession session){

        if (responseEntity.getStatusCode().is2xxSuccessful()) {
            session.setAttribute("alert", Alert.OK);
            return responseEntity.getBody();
        }else if (responseEntity.getStatusCodeValue() == 302){
            session.setAttribute("alert", Alert.FOUND);
        }else if (responseEntity.getStatusCode() == HttpStatus.valueOf(301)){
            session.setAttribute("alert", Alert.NOT_FOUND);
        }

        return null;
    }

}
