package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("/auction")
public class AuctionController {

    @RequestMapping("/{id}")
    public ModelAndView showAuction(@PathVariable Long id, @ModelAttribute("list") ArrayList<AuctionModel> auctionModelList){

        ModelAndView modelAndView = new ModelAndView("auction");

        for(int i=0; i<auctionModelList.size();i++){

            if(auctionModelList.get(i).getId() != id){
                continue;
            }

            modelAndView.addObject(auctionModelList.get(i));
        }

        return  modelAndView;
    }
}
