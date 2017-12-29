package com.belzowski.Network;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import com.belzowski.Model.TransactionModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Formatter.DateFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.el.PropertyNotFoundException;
import javax.servlet.http.HttpSession;
import com.belzowski.Support.Enum.Alert;
import org.springframework.http.HttpStatus;

import java.io.UnsupportedEncodingException;
import java.util.*;

import static java.lang.System.out;


public class AuctionNetworkManager {

    public static AuctionModel addAuction(AuctionModel auctionModel, HttpSession session){

        auctionModel.setId(Long.valueOf(1));
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<AuctionModel> responseEntity = restTemplate.postForEntity(Constant.addAuction, auctionModel, AuctionModel.class);

        return responseStatus(responseEntity, session);
    }

    public static List<AuctionModel> getMyAuction(UserModel userModel,boolean isSold, boolean isEnded, HttpSession session){

        RestTemplate restTemplate = new RestTemplate();

        Map<Object, Object> map = new HashMap<>();
        map.put("userId", userModel.getId());
        map.put("isSold", isSold);
        map.put("isEnded", isEnded);

        ResponseEntity<AuctionModel[]> responseEntity = restTemplate.postForEntity(Constant.getMyAuction, map, AuctionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            session.setAttribute("alert", Alert.OK);
            AuctionModel[] result = responseEntity.getBody();
            List<AuctionModel> myAuctionList = new ArrayList<>();

            for(int i=0; i<result.length; i++){
                AuctionModel auctionModel = result[i];

                DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(),"yyyy-MM-dd HH:mm");
                auctionModel.setTmpDate(dateFormatter.calendarToString());


                PhotoModel mainImage = null;

                if(auctionModel.getFiles() == null){
                    auctionModel.setMainImage("photoPlaceholder");
                    myAuctionList.add(auctionModel);
                    continue;
                }

                try {
                    mainImage = auctionModel.getFiles().get(0);
                    byte[] image = Base64.getEncoder().encode(mainImage.getImage());
                    String imageEncoded = null;
                    try {
                        imageEncoded = new String(image, "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        auctionModel.setMainImage("photoPlaceholder");
                        myAuctionList.add(auctionModel);
                        continue;
                    }
                    auctionModel.setMainImage(imageEncoded);

                }catch (IndexOutOfBoundsException ee){
                    auctionModel.setMainImage("photoPlaceholder");
                    myAuctionList.add(auctionModel);

                    continue;
                }

                myAuctionList.add(auctionModel);
            }
            return myAuctionList;
        }else{
            session.setAttribute("alert", Alert.FOUND);
        }
        return null;
    }

    public static AuctionModel getAuction(Long id, HttpSession session){
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<AuctionModel> responseEntity = restTemplate.postForEntity(Constant.getAuction, id, AuctionModel.class);

        return responseStatus(responseEntity, session);
    }

    public static AuctionModel editAuction(Long id, Long userId, int viewNumber, HttpSession session){

        Map<Object,Object> map = new HashMap<>();
        map.put("id", id);
        map.put("userId", userId);
        map.put("viewNumber", viewNumber);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<AuctionModel> responseEntity = restTemplate.postForEntity(Constant.editAuction, map, AuctionModel.class);

        return  responseStatus(responseEntity, session);
    }

    public static List<TransactionModel> getTransactions(AuctionModel auctionModel){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<TransactionModel[]> responseEntity = restTemplate.postForEntity(Constant.getTransactions, auctionModel, TransactionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            TransactionModel[] transactionModels = responseEntity.getBody();
            if(transactionModels.length == 0)
                return new ArrayList<>();
            else {
                ArrayList<TransactionModel> result = new ArrayList<>();
                for (TransactionModel tM: transactionModels) {
                    DateFormatter dateFormatter = new DateFormatter(tM.getDate(),"yyyy-MM-dd HH:mm" );
                    tM.setTmpDate(dateFormatter.calendarToString());
                    result.add(tM);
                }
                return result;
            }
        }

        return new ArrayList<>();
    }

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
