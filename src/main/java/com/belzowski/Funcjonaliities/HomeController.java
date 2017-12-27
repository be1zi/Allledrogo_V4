package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Network.HomeNetworkManager;
import com.belzowski.Support.Enum.MenuStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.List;

import static java.lang.System.out;

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView emptyHomeMapping(HttpSession session){

        if(session.getAttribute("user") == null || session.getAttribute("menuStatus")==null){
            session.setAttribute("menuStatus", MenuStatus.isLogout);
        }else{
            session.setAttribute("menuStatus", MenuStatus.isLogin);
        }

        ModelAndView modelAndView = new ModelAndView("home");
        List<AuctionModel> auctionModels = HomeNetworkManager.getHomeAuctions(session);
        modelAndView.addObject("list", auctionModels);

        return modelAndView;
    }
}
