package com.belzowski.Network;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Static.Constant;
import org.springframework.web.client.RestTemplate;

import static java.lang.System.out;

public class UserNetworkManager {

    public static UserModel getUserFromNetwork(UserModel userModel){

        RestTemplate restTemplate = new RestTemplate();
        UserModel response = restTemplate.postForObject(Constant.getUserURL, userModel, UserModel.class);

        if (response == null)
            return null;
        else
            return response;
    }

    public static UserModel setUserToNetwork(UserModel userModel, AccountModel accountModel){

        userModel.setId(Long.valueOf(1));
        userModel.setAccountType("User");
        userModel.setAccountModel(accountModel);

        RestTemplate restTemplate = new RestTemplate();
        UserModel result = restTemplate.postForObject(Constant.addUserURL, userModel, UserModel.class);

        out.println(result.toString());
        return result;
    }

}
