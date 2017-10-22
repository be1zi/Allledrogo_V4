package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import static java.lang.System.out;

@Controller
public class HomeController {

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(){

        return "home";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String emptyHomeMapping(HttpSession session){
        out.println(session.getAttribute("menuStatus"));
        
        return "home";
    }
}
