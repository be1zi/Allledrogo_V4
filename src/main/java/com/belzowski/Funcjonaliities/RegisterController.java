package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
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
public class RegisterController {

    @RequestMapping("/register")
    public ModelAndView register(){

        ModelAndView modelAndView = new ModelAndView("register");

        UserModel userModel = new UserModel();
        AccountModel accountModel = new AccountModel();

        modelAndView.addObject("userModel", userModel);
        modelAndView.addObject("accountModel",accountModel);

        return modelAndView;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("userModel") @Valid UserModel userModel, @ModelAttribute("accountModel") @Valid AccountModel accountModel){

        UserModel uM = UserNetworkManager.setUserToNetwork(userModel,accountModel);
        out.println(uM);

        if (uM.getId() == null)
            return "register";
        else
            return "home";

    }
}
