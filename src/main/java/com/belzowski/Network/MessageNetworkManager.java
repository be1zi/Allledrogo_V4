package com.belzowski.Network;


import com.belzowski.Model.MessageModel;
import com.belzowski.Model.SingleMessageModel;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class MessageNetworkManager {

    public static Long addFirstMessage(MessageModel message){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Long> responseEntity = restTemplate.postForEntity(Constant.addFirstMessageURL, message , Long.class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            return responseEntity.getBody().longValue();
        }

        return Long.valueOf(0);
    }

    public static boolean addMessage(SingleMessageModel singleMessageModel){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Boolean> responseEntity = restTemplate.postForEntity(Constant.addMessageURL, singleMessageModel, Boolean.class);

        if(responseEntity.getStatusCode().is2xxSuccessful())
            return responseEntity.getBody().booleanValue();

        return false;
    }
}
