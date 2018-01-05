package com.belzowski.Network;


import com.belzowski.Model.MessageModel;
import com.belzowski.Model.SingleMessageModel;
import com.belzowski.Support.Formatter.DataTypeFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;

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

    public static List<MessageModel> getMessageList(String userLogin){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<MessageModel[]> responseEntity = restTemplate.postForEntity(Constant.getMessageListURL, userLogin, MessageModel[].class);

        for(MessageModel mm: responseEntity.getBody())
            out.println(mm.toString());


        if(responseEntity.getStatusCode().is2xxSuccessful()){
            return DataTypeFormatter.messsageArrayToList(responseEntity.getBody());
        }

        return new ArrayList<>();
    }
}
