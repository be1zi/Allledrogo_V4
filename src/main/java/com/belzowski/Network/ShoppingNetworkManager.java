package com.belzowski.Network;

import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
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
}
