package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

    @RequestMapping("/")
    public String shoppingHome(){

        return "shopping";
    }

}
