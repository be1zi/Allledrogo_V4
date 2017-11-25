package com.belzowski.Funcjonaliities;

import com.belzowski.Support.Enum.MenuStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

import static java.lang.System.out;

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String emptyHomeMapping(HttpSession session){

        if(session.getAttribute("user") == null || session.getAttribute("menuStatus")==null){
            session.setAttribute("menuStatus", MenuStatus.isLogout);
        }else{
            session.setAttribute("menuStatus", MenuStatus.isLogin);
        }

        return "home";
    }
}
