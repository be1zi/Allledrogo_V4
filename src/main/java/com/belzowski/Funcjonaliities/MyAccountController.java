package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.MessageModel;
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
import org.springframework.web.bind.annotation.RequestParam;
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
        }else if(session.getAttribute("content") != null && session.getAttribute("content").equals(Content.Adress)){
            return "redirect:/myaccount/addressdetails";
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

    @RequestMapping("/saveAccount")
    public String editEmail(HttpSession session, @ModelAttribute("account") @Valid AccountModel accountModel){

        out.println(accountModel.toString());

        UserModel userModel = (UserModel)session.getAttribute("user");
        AccountModel accountModelSession = userModel.getAccountModel();

        if(accountModel.getEmail() != null && (accountModel.getEmail() != accountModelSession.getEmail())){
            accountModelSession.setEmail(accountModel.getEmail());
            userModel.setAccountModel(accountModelSession);
            UserModel uM = UserNetworkManager.editEmailNetwork(userModel, session);
            if(uM != null){
                session.setAttribute("alert", Alert.EDIT_EMAIL);
                session.setAttribute("user", uM);
            }
        }else {

            if(accountModel.getFirstName() != null && (accountModel.getFirstName() != accountModelSession.getFirstName())){
                accountModelSession.setFirstName(accountModel.getFirstName());
            }
            if(accountModel.getLastName() != null && (accountModel.getLastName() != accountModelSession.getLastName())){
                accountModelSession.setLastName(accountModel.getLastName());
            }
            if(accountModel.getCountry() != null && (accountModel.getCountry() != accountModelSession.getCountry())){
                accountModelSession.setCountry(accountModel.getCountry());
            }
            if(accountModel.getCity() != null && (accountModel.getCity() != accountModelSession.getCity())){
                accountModelSession.setCity(accountModel.getCity());
            }
            if(accountModel.getHouseNumber() !=0 && (accountModel.getHouseNumber() != accountModelSession.getHouseNumber())){
                accountModelSession.setHouseNumber(accountModel.getHouseNumber());
            }
            if(accountModel.getPlaceNumber() != accountModelSession.getPlaceNumber()){
                accountModelSession.setPlaceNumber(accountModel.getPlaceNumber());
            }
            if(accountModel.getStreet() != null && (accountModel.getStreet() != accountModelSession.getStreet())){
                accountModelSession.setStreet(accountModel.getStreet());
            }
            if(accountModel.getZipCode() != null && (accountModel.getZipCode() != accountModelSession.getZipCode())){
                accountModelSession.setZipCode(accountModel.getZipCode());
            }
            if(accountModel.getVoivodeship() != null && (accountModel.getVoivodeship() != accountModelSession.getVoivodeship())){
                accountModelSession.setVoivodeship(accountModel.getVoivodeship());
            }
            if(accountModel.getPhone() != null && (accountModel.getPhone() != accountModelSession.getPhone())){
                accountModelSession.setPhone(accountModel.getPhone());
            }
            if(accountModel.getDescription() != null) {
                accountModelSession.setDescription(accountModel.getDescription());
            }

            UserModel uM = UserNetworkManager.editAccountNetwork(userModel,session);
            if(uM != null){
                session.setAttribute("alert", Alert.EDIT_ACCOUNT);
                session.setAttribute("user", uM);
            }
        }

        return "redirect:/myaccount/";
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
    public ModelAndView addressDetails(HttpSession session){

        session.setAttribute("content", Content.Adress);
        UserModel userModel = (UserModel)session.getAttribute("user");
        AccountModel accountModel = userModel.getAccountModel();

        ModelAndView modelAndView = new ModelAndView("myAccount");
        modelAndView.addObject("user",userModel);
        modelAndView.addObject("account",accountModel);

        return modelAndView;
    }

    @RequestMapping("/messageslist")
    public  String messageList( HttpSession session){
        session.setAttribute("content", Content.Message);
        return "redirect:/message/getMessageList";
    }

    @RequestMapping("/messages")
    public String messageDetails(@RequestParam("id") Long id, HttpSession session){
        session.setAttribute("content", Content.SinggleMessage);

        return "redirect:/message/messageDetails?id=" + id;
    }
}
