package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import com.belzowski.Network.AuctionNetworkManager;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/auction")
public class AuctionController {

    @RequestMapping("/{id}")
    public ModelAndView showAuction(@PathVariable Long id, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("auction");
        AuctionModel auctionModel = AuctionNetworkManager.getAuction(id, session);

        DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(), "yyyy-MM-dd HH:mm");
        auctionModel.setTmpDate(dateFormatter.calendarToString());

        String imageEncoded = null;

        // miniaturka
        try {
            List<PhotoModel> imagesList = auctionModel.getFiles();
            byte[] image = Base64.getEncoder().encode(imagesList.get(0).getImage());
            imageEncoded = new String(image, "UTF-8");
            modelAndView.addObject("mainImages", imageEncoded);
        }catch(IndexOutOfBoundsException e){
            modelAndView.addObject("mainImages", "photoPlaceholder");

        }catch(UnsupportedEncodingException e){
            modelAndView.addObject("mainImages", "photoPlaceholder");
        }

        // reszta zdjęć
        if(auctionModel.getFiles() != null){
            List<String> images = new ArrayList<>();
            for(int i=1; i<auctionModel.getFiles().size();i++){
                byte[] image = Base64.getEncoder().encode(auctionModel.getFiles().get(i).getImage());
                try {
                    images.add(new String(image, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    images.add(new String("photoPlaceholder"));
                }
            }
            modelAndView.addObject("images", images);
        }


        if(auctionModel != null)
            modelAndView.addObject("auction",auctionModel);

        out.println(auctionModel.toString());
        out.println(auctionModel.isAuctionType());
        out.println(auctionModel.isBuyNowType());

        return  modelAndView;
    }
}
