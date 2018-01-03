package com.belzowski.Support.Formatter;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class DataTypeFormatter {

    public static List<AuctionModel> arrayToList(AuctionModel[] array){

        List<AuctionModel> list = new ArrayList<>();

        for(int i=0; i<array.length;i++){
            AuctionModel auctionModel = array[i];
            DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(),"yyyy-MM-dd HH:mm" );
            auctionModel.setTmpDate(dateFormatter.calendarToString());

            PhotoModel mainImage = null;
            if(auctionModel.getFiles() == null || auctionModel.getFiles().get(0) == null || auctionModel.getFiles().get(0).getImage() == null){
                auctionModel.setMainImage("photoPlaceholder");
                list.add(auctionModel);
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
                    list.add(auctionModel);
                    continue;
                }
                auctionModel.setMainImage(imageEncoded);
            }catch (IndexOutOfBoundsException ee){
                auctionModel.setMainImage("photoPlaceholder");
                list.add(auctionModel);
                continue;
            }
            list.add(auctionModel);
        }

        return list;
    }
}
