package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {

    @RequestMapping("/")
    public String myAccountHome(){
        return "myAccount";
    }
}
