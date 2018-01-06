package com.belzowski.Network;

import com.belzowski.Model.CommentModel;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class CommentNetworkManager {

    public static boolean sendComment(CommentModel comment){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<Boolean> responseEntity = restTemplate.postForEntity(Constant.addCommentULR, comment, Boolean.class);

        if(responseEntity.getStatusCode().is2xxSuccessful())
            return responseEntity.getBody().booleanValue();

        return false;
    }
}
