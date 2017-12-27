package com.belzowski.Network;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Formatter.DateFormatter;
import com.belzowski.Support.Static.Constant;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static java.lang.System.out;

public class HomeNetworkManager {

    public static List<AuctionModel> getHomeAuctions(HttpSession session){

        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<AuctionModel[]> responseEntity = restTemplate.postForEntity(Constant.getHomeAuction,false,AuctionModel[].class);

        if(responseEntity.getStatusCode().is2xxSuccessful()){
            session.setAttribute("alert", Alert.OK);

            AuctionModel[] result = responseEntity.getBody();
            List<AuctionModel> auctionModels = new ArrayList<>();

            for(int i=0; i<result.length;i++){
                AuctionModel auctionModel = result[i];
                DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(),"yyyy-MM-dd HH:mm" );
                auctionModel.setTmpDate(dateFormatter.calendarToString());

                PhotoModel mainImage = null;
                if(auctionModel.getFiles().get(0).getImage() == null){
                    auctionModel.setMainImage("photoPlaceholder");
                    auctionModels.add(auctionModel);
                    continue;
                }

                String imageEncoded = null;
                try {
                    mainImage = auctionModel.getFiles().get(0);
                    byte[] image = Base64.getEncoder().encode(mainImage.getImage());
                    try {
                        imageEncoded = new String(image, "UTF-8");
                    } catch (UnsupportedEncodingException e) {
                        auctionModel.setMainImage("photoPlaceholder");
                        auctionModels.add(auctionModel);
                        continue;
                    }
                    auctionModel.setMainImage(imageEncoded);
                }catch (IndexOutOfBoundsException ee){
                    auctionModel.setMainImage("photoPlaceholder");
                    auctionModels.add(auctionModel);
                    continue;
                }
                auctionModels.add(auctionModel);
            }
            return auctionModels;
        }

        return new ArrayList<>();

    }
}
