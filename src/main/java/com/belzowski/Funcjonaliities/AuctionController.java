package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Network.AuctionNetworkManager;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import static java.lang.System.out;

@Controller
@RequestMapping("/auction")
public class AuctionController {

    @RequestMapping("/{id}")
    public ModelAndView showAuction(@PathVariable Long id, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("auction");

        out.println(id);
        AuctionModel auctionModel = AuctionNetworkManager.getAuction(id, session);

        DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(), "yyyy-MM-dd HH:mm");
        auctionModel.setTmpDate(dateFormatter.calendarToString());

        if(auctionModel != null)
            modelAndView.addObject("auction",auctionModel);

        return  modelAndView;
    }
}
