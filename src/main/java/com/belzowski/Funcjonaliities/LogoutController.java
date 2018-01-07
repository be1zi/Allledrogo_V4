package com.belzowski.Funcjonaliities;

import com.belzowski.Support.Enum.MenuStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
public class LogoutController {

    @RequestMapping("/logout")
    public String logout(HttpSession session){

        session.invalidate();
        return "redirect:/";
    }
}
