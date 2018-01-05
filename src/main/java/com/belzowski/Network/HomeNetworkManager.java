package com.belzowski.Network;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Formatter.DataTypeFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


public class HomeNetworkManager {

    public static List<AuctionModel> getHomeAuctions(HttpSession session){

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<AuctionModel[]> responseEntity = restTemplate.postForEntity(Constant.getHomeAuction,false, AuctionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            session.setAttribute("alert", Alert.OK);

            AuctionModel[] result = responseEntity.getBody();
            List<AuctionModel> auctionModels = new ArrayList<>();

            auctionModels = DataTypeFormatter.arrayToList(result);

            return auctionModels;
        }

        return new ArrayList<>();

    }
}
