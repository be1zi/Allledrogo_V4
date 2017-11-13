package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.UserNetworkManager;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Enum.Content;
import com.belzowski.Support.Enum.MenuStatus;
import com.sun.org.apache.regexp.internal.RE;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import static java.lang.System.out;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {

    @RequestMapping("/")
    public String myAccountHome(HttpSession session){

        //session.setAttribute("alert",Alert.OK);
        if(session.getAttribute("content") != null && session.getAttribute("content").equals(Content.Login)){
            return "redirect:/myaccount/logindetails";
        }

        return "myAccount";
    }

    @RequestMapping("/logindetails")
    public ModelAndView loginDetails(HttpSession session){

        session.setAttribute("content", Content.Login);
        UserModel userModel = (UserModel)session.getAttribute("user");
        AccountModel accountModel = userModel.getAccountModel();

        ModelAndView modelAndView = new ModelAndView("myAccount");
        modelAndView.addObject("user",userModel);
        modelAndView.addObject("account",accountModel);

        return modelAndView;
    }

    @RequestMapping("/save")
    public String edit(HttpSession session, @ModelAttribute("user") @Valid UserModel userModel){

        out.println(userModel.toString());
        UserModel user = (UserModel) session.getAttribute("user");

        if(userModel.getLogin() != null) {
            String tmp = user.getLogin();

            user.setLogin(userModel.getLogin());
            UserModel uM = UserNetworkManager.editUserNetwork(user, session);

            if (uM == null) {
                session.setAttribute("alert", Alert.FOUND);
                user.setLogin(tmp);
                return "redirect:/myaccount/";
            } else {
                session.setAttribute("menuStatus", MenuStatus.isLogin);
                session.setAttribute("user", uM);
                session.setAttribute("alert", Alert.EDIT_LOGIN);
                return "redirect:/myaccount/";
            }
        }else if(userModel.getPassword() != null){
            String tmp = user.getPassword();
            user.setPassword(userModel.getPassword());
            UserModel uM = UserNetworkManager.editUserNetwork(user, session);
            session.setAttribute("alert", Alert.EDIT_PASSWORD);
            session.setAttribute("user", uM);

            return "redirect:/myaccount/";
        }else{
            return "redirect:/myaccount/";
        }
    }

    @RequestMapping("/commentlist")
    public String commentList(HttpSession session){
        session.setAttribute("content", Content.Comments);

        return "redirect:/myaccount/";
    }

    @RequestMapping("/history")
    public String historyList(HttpSession session){
        session.setAttribute("content", Content.History);

        return "redirect:/myaccount/";
    }

    @RequestMapping("/accountdetails")
    public String accountDetails(HttpSession session){
        session.setAttribute("content", Content.Account);


        return "redirect:/myaccount/";
    }

    @RequestMapping("/addressdetails")
    public String addressDetails(HttpSession session){
        session.setAttribute("content", Content.Adress);

        return "redirect:/myaccount/";
    }

    @RequestMapping("/messageslist")
    public  String messageList(HttpSession session){
        session.setAttribute("content", Content.Message);

        return "redirect:/myaccount/";
    }
}
