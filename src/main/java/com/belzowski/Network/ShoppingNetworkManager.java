package com.belzowski.Network;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.BiddingModel;
import com.belzowski.Model.TransactionModel;
import com.belzowski.Support.Formatter.DataTypeFormatter;
import com.belzowski.Support.Formatter.DateFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.System.out;

public class ShoppingNetworkManager {

    public static int buy(Long auctionId, Long ownerId, Long userId, int itemNumber, double price){

        Map<Object, Object> map = new HashMap<>();
        map.put("auctionId",auctionId);
        map.put("ownerId", ownerId);
        map.put("userId", userId);
        map.put("itemNumber", itemNumber);
        map.put("price", price);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Integer> responseEntity = restTemplate.postForEntity(Constant.buyURL, map ,Integer.class );

        if(responseEntity.getStatusCode().is2xxSuccessful())
            return responseEntity.getBody().intValue();

        return 0;
    }

    public static List<TransactionModel> getBought(String login){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<TransactionModel[]> responseEntity = restTemplate.postForEntity(Constant.getBoughtURL, login, TransactionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            if(responseEntity.getBody() != null){
                List<TransactionModel> result = new ArrayList<>();

                for (TransactionModel tM: responseEntity.getBody()) {
                    DateFormatter dateFormatter = new DateFormatter(tM.getDate(), "yyyy-MM-dd HH:mm");
                    tM.setTmpDate(dateFormatter.calendarToString());
                    result.add(tM);
                }
                return result;
            }
        }

        return new ArrayList<>();
    }

    public static List<BiddingModel> getAuctioned(String login){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<BiddingModel[]> responseEntity = restTemplate.postForEntity(Constant.getAuctionedURL, login, BiddingModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            if(responseEntity.getBody() != null){

                List<BiddingModel> result = new ArrayList<>();

                for (BiddingModel bM: responseEntity.getBody()) {
                    DateFormatter dateFormatter = new DateFormatter(bM.getDate(),"yyyy-MM-dd HH:mm" );
                    bM.setTmpDate(dateFormatter.calendarToString());
                    result.add(bM);
                }

                return result;
            }
        }

        return new ArrayList<>();
    }

    public static List<AuctionModel> getObserved(String login){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<AuctionModel[]> responseEntity = restTemplate.postForEntity(Constant.getObservedURL, login, AuctionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){

            return DataTypeFormatter.arrayToList(responseEntity.getBody());
        }

        return new ArrayList<>();
    }
}
