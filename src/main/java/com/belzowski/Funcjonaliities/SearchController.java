package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Network.AuctionNetworkManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import static java.lang.System.out;


@Controller
@RequestMapping("/search")
public class SearchController {

    @RequestMapping("/")
    public ModelAndView search(@CookieValue("searchValue") String searchValue){

        ModelAndView modelAndView = new ModelAndView("auctionList");
        List<AuctionModel> list = AuctionNetworkManager.searchAuctions(searchValue);

        if(list == null)
            modelAndView.addObject("list", new ArrayList());
        else
            modelAndView.addObject("list", list);

        return modelAndView;
    }
}
