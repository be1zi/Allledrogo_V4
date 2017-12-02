package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Support.Enum.Content;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.util.Date;

import static java.lang.System.out;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @RequestMapping("/")
    public String saleHome(HttpSession session){

        if(session.getAttribute("content") != null && session.getAttribute("content").equals(Content.MakeAuction)){
            return "redirect:/sale/makeauction";
        }

        return "sale";
    }

    @RequestMapping("/makeauction")
    public ModelAndView makeAuction(HttpSession session){

        session.setAttribute("content", Content.MakeAuction);

        ModelAndView modelAndView = new ModelAndView("sale");
        AuctionModel auctionModel = new AuctionModel();
        modelAndView.addObject("auctionModel", auctionModel);

        return modelAndView;
    }

    @RequestMapping("/save")
    public String  saveAuction(@ModelAttribute("auctionModel") @Valid AuctionModel auctionModel, HttpSession session){

        if(auctionModel != null){

            if(auctionModel.getBiddingPrice() != null) {
                auctionModel.setAuctionType(true);
            }else{
                auctionModel.setAuctionType(false);
            }

            if(auctionModel.getBuyNowPrice() != null){
                auctionModel.setBuyNowType(true);
            }else{
                auctionModel.setBuyNowType(false);
            }

            Date date = new Date();
            auctionModel.setStartDate(date);
        }

        out.println(auctionModel.toString());

        return "redirect:/sale/makeauction";
    }

    @RequestMapping("/mysales")
    public String mySales(HttpSession session){

        session.setAttribute("content", Content.MySales);

        return "redirect:/sale/";
    }

    @RequestMapping("/sold")
    public String sold(HttpSession session){

        session.setAttribute("content", Content.Sold);

        return "redirect:/sale/";
    }

    @RequestMapping("/notsold")
    public String notSold(HttpSession session){

        session.setAttribute("content", Content.NotSold);

        return "redirect:/sale/";
    }
}
