package com.belzowski.Network;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

import static java.lang.System.out;

public class UserNetworkManager {

    public static UserModel getUserFromNetwork(UserModel userModel, HttpSession session){

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.getUserURL, userModel, UserModel.class);

        if (responseEntity.getStatusCode().is2xxSuccessful()){
            session.setAttribute("alert", Alert.OK);
            UserModel userModel1 = responseEntity.getBody();
            return userModel1;
        }else if (responseEntity.getStatusCodeValue() == 302) {
            session.setAttribute("alert", Alert.FOUND);
        }else if (responseEntity.getStatusCodeValue() == 301) {
            session.setAttribute("alert", Alert.NOT_FOUND);
        }

        return null;
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
