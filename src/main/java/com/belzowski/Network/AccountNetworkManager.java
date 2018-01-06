package com.belzowski.Network;

import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class AccountNetworkManager {

    public static int getAuctionNumber(Long id){

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<Integer> responseEntity = restTemplate.postForEntity(Constant.getAuctionNumberURL , id, Integer.class);

        if(responseEntity.getStatusCode().is2xxSuccessful())
            return responseEntity.getBody().intValue();

        return 0;
    }
}
