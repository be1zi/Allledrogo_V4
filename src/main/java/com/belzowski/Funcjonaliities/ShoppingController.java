package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @RequestMapping("/")
    public String shoppingHome(){

        return "shopping";
    }

    @RequestMapping("/bought")
    public ModelAndView bought(){

        ModelAndView modelAndView = new ModelAndView("shopping");
        return modelAndView;
    }

}
