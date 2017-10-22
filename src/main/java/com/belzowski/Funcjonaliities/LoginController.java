package com.belzowski.Funcjonaliities;

import com.belzowski.Model.UserModel;
import com.belzowski.Network.UserNetworkManager;
import com.belzowski.Support.Enum.MenuStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static java.lang.System.out;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request){

        HttpSession session = request.getSession(true);

        request.getSession().setAttribute("menuStatus", MenuStatus.login);

        ModelAndView modelAndView = new ModelAndView("login");

        UserModel userModel = new UserModel();

        modelAndView.addObject("userModel", userModel);
        return modelAndView;
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public String check(@ModelAttribute("userModel") @Valid  UserModel userModel, HttpSession session){

        UserModel uM = UserNetworkManager.getUserFromNetwork(userModel);

        if (uM == null)
            return "login";
        else {
            session.setAttribute("user",uM);
            return "home";
        }


    }
}
