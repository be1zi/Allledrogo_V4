package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.UserNetworkManager;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Enum.MenuStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static java.lang.System.out;

@Controller
public class RegisterController {

    @RequestMapping("/register")
    public ModelAndView register(HttpSession session){

        session.setAttribute("menuStatus", MenuStatus.register);
        session.setAttribute("alert", Alert.OK);

        ModelAndView modelAndView = new ModelAndView("register");

        UserModel userModel = new UserModel();
        AccountModel accountModel = new AccountModel();

        modelAndView.addObject("userModel", userModel);
        modelAndView.addObject("accountModel",accountModel);

        return modelAndView;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@ModelAttribute("userModel") @Valid UserModel userModel, @ModelAttribute("accountModel") @Valid AccountModel accountModel, HttpSession session){

        UserModel uM = UserNetworkManager.setUserToNetwork(userModel,accountModel,session);

        if (uM == null)
            return "register";
        else {
            session.setAttribute("user", uM);
            session.setAttribute("menuStatus", MenuStatus.isLogin);
            return "redirect:/";
        }

    }
}
