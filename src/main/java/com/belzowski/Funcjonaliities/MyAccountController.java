package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Enum.Content;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import static java.lang.System.out;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {

    @RequestMapping("/")
    public String myAccountHome(){
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

//    @RequestMapping(value = "/logindetails", method = RequestMethod.GET)
//    public String loginDetails(HttpSession session, Model model){
////        session.setAttribute("content", Content.Login);
////
////        UserModel userModel = (UserModel)session.getAttribute("user");
////        model.addAttribute("user", userModel);
////
////        out.println(userModel.toString());
////
////        return "redirect:/myaccount/";
//    }

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
