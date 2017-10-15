package com.belzowski.Funcjonaliities;

import com.belzowski.Model.UserModel;
import com.belzowski.Network.UserNetworkManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

import static java.lang.System.out;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public ModelAndView login(){

        ModelAndView modelAndView = new ModelAndView("login");

        UserModel userModel = new UserModel();

        modelAndView.addObject("userModel", userModel);
        return modelAndView;
    }

    @RequestMapping(value = "/check", method = RequestMethod.POST)
    public String check(@ModelAttribute("userModel") @Valid  UserModel userModel){

        out.print(userModel.toString());
        UserModel uM = UserNetworkManager.getUserFromNetwork(userModel);

        if (uM == null)
            return "login";
        else
            return "home";

    }
}
