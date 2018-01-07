package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.BiddingModel;
import com.belzowski.Model.TransactionModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.ShoppingNetworkManager;
import com.belzowski.Support.Enum.Content;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @RequestMapping("/")
    public String shoppingHome(HttpSession session){

        Content tmp = (Content) session.getAttribute("content");

        if(session.getAttribute("list") == null){
            return "redirect:/shopping/bought";
        }

        if(tmp != null && tmp != Content.Bought  && tmp != Content.Auctioned && tmp != Content.Observed )
            return "redirect:/shopping/bought";

        if(session.getAttribute("content") == null){
            return "redirect:/shopping/bought";
        }

        return "shopping";
    }

    @RequestMapping("/bought")
    public ModelAndView bought(HttpSession session){

        session.setAttribute("content", Content.Bought);
        ModelAndView modelAndView = new ModelAndView("shopping");
        UserModel userModel = (UserModel)session.getAttribute("user");
        List<TransactionModel> transactionModels = ShoppingNetworkManager.getBought(userModel.getLogin());
        modelAndView.addObject("list", transactionModels);
        return modelAndView;
    }

    @RequestMapping("/auctioned")
    public ModelAndView auctioned(HttpSession session){

        session.setAttribute("content", Content.Auctioned);
        ModelAndView modelAndView = new ModelAndView("shopping");
        UserModel userModel = (UserModel)session.getAttribute("user");
        List<BiddingModel> biddingModels = ShoppingNetworkManager.getAuctioned(userModel.getLogin());
        modelAndView.addObject("list", biddingModels);
        return modelAndView;
    }

    @RequestMapping("/observed")
    public ModelAndView observed(HttpSession session){

        session.setAttribute("content", Content.Observed);
        ModelAndView modelAndView = new ModelAndView("shopping");
        UserModel userModel = (UserModel)session.getAttribute("user");
        List<AuctionModel> observedList = ShoppingNetworkManager.getObserved(userModel.getLogin());
        modelAndView.addObject("list", observedList);

        return modelAndView;
    }

}
