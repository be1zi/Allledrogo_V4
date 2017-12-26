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
import java.util.Base64;
import java.util.List;

@Controller
@RequestMapping("/auction")
public class AuctionController {

    @RequestMapping("/{id}")
    public ModelAndView showAuction(@PathVariable Long id, HttpSession session) throws UnsupportedEncodingException {

        ModelAndView modelAndView = new ModelAndView("auction");
        AuctionModel auctionModel = AuctionNetworkManager.getAuction(id, session);

        DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(), "yyyy-MM-dd HH:mm");
        auctionModel.setTmpDate(dateFormatter.calendarToString());

        List<PhotoModel> imagesList = auctionModel.getFiles();
        byte[] image = Base64.getEncoder().encode(imagesList.get(0).getImage());
        String imageEncoded = new String(image, "UTF-8");
        modelAndView.addObject("mainImages", imageEncoded);

        if(auctionModel != null)
            modelAndView.addObject("auction",auctionModel);

        return  modelAndView;
    }
}
