package com.belzowski.Network;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;

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

    public static UserModel setUserToNetwork(UserModel userModel, AccountModel accountModel, HttpSession session){

        userModel.setId(Long.valueOf(1));
        userModel.setAccountType("User");
        userModel.setAccountModel(accountModel);
        userModel.getAccountModel().setMark(0.0);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.addUserURL, userModel, UserModel.class);

        return responseStatus(responseEntity,session);

    }

    public static UserModel editUserNetwork(UserModel userModel, HttpSession session){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.editUserURL, userModel, UserModel.class);

        return responseStatus(responseEntity,session);

    }

    public static UserModel editEmailNetwork(UserModel userModel, HttpSession session){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.editEmailURL, userModel, UserModel.class);

        return responseStatus(responseEntity,session);
    }

    public static UserModel editAccountNetwork(UserModel userModel, HttpSession session){
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.editAccountURL, userModel, UserModel.class);

        return responseStatus(responseEntity,session);
    }

    public static UserModel getUserByLogin(String login){

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<UserModel> responseEntity = restTemplate.postForEntity(Constant.getUserByLoginURL, login , UserModel.class);

        if(responseEntity.getStatusCode().is2xxSuccessful())
            return responseEntity.getBody();

        return new UserModel();
    }


    private static UserModel responseStatus(ResponseEntity<UserModel> responseEntity, HttpSession session){

        if (responseEntity.getStatusCode().is2xxSuccessful()) {
            session.setAttribute("alert", Alert.OK);
            UserModel userModel1 = responseEntity.getBody();
            return userModel1;
        }else if (responseEntity.getStatusCodeValue() == 302){
            session.setAttribute("alert", Alert.FOUND);
        }else if (responseEntity.getStatusCode() == HttpStatus.valueOf(301)){
            session.setAttribute("alert", Alert.NOT_FOUND);
        }

        return null;
    }

}
