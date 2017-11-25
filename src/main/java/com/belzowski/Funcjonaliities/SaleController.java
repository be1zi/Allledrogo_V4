package com.belzowski.Funcjonaliities;

import com.belzowski.Support.Enum.Content;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @RequestMapping("/")
    public String saleHome(){

        return "sale";
    }

    @RequestMapping("/makeauction")
    public String makeAuction(HttpSession session){

        session.setAttribute("content", Content.MakeAuction);

        return "redirect:/sale/";
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
