package com.belzowski.Network;

import com.belzowski.Model.UserModel;
import com.belzowski.Support.Static.Constant;
import org.springframework.web.client.RestTemplate;

public class UserNetworkManager {

    public static UserModel getUserFromNetwork(UserModel userModel){

        RestTemplate restTemplate = new RestTemplate();
        UserModel response = restTemplate.postForObject(Constant.getUserURL, userModel, UserModel.class);

        if (response == null)
            return null;
        else
            return response;
    }

}
