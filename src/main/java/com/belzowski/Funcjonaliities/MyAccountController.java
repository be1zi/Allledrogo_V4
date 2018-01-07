package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.CommentModel;
import com.belzowski.Model.MessageModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.AccountNetworkManager;
import com.belzowski.Network.UserNetworkManager;
import com.belzowski.Support.Enum.Alert;
import com.belzowski.Support.Enum.Comment;
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

import java.util.*;

import static java.lang.System.out;

@Controller
@RequestMapping("/myaccount")
public class MyAccountController {

    @RequestMapping("/")
    public String myAccountHome(HttpSession session){

        Content tmp = (Content) session.getAttribute("content");

        if(tmp != null && tmp != Content.Login && tmp != Content.Adress && tmp != Content.Account && tmp != Content.Comments && tmp != Content.Message )
            return "redirect:/myaccount/accountdetails";

        if(tmp == null){
            return "redirect:/myaccount/accountdetails";
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
    public ModelAndView commentList(HttpSession session){
        session.setAttribute("content", Content.Comments);

        UserModel user = (UserModel)session.getAttribute("user");
        AccountModel account = user.getAccountModel();
        List<CommentModel> comments = account.getCommentList();

        Collections.sort(comments, new Comparator<CommentModel>() {
            @Override
            public int compare(CommentModel o1, CommentModel o2) {
                return o2.getDate().compareTo(o1.getDate());
            }
        });

        for(CommentModel cM: comments){
            if(cM.getType() == Comment.Positiv){
                cM.setTmpDate("Pozytywny");
            }else if (cM.getType() == Comment.Negativ){
                cM.setTmpDate("Negatywny");
            }else
                cM.setTmpDate("Neutralny");
        }

        ModelAndView modelAndView = new ModelAndView("myAccount");
        modelAndView.addObject("list", comments);

        return modelAndView;
    }

    @RequestMapping("/commentsByType")
    public ModelAndView commentsByList(@RequestParam("type") String type,  HttpSession session){
        session.setAttribute("content", Content.Comments);
        ModelAndView modelAndView = new ModelAndView("myAccount");

        UserModel user = (UserModel)session.getAttribute("user");
        AccountModel account = user.getAccountModel();
        List<CommentModel> comments = account.getCommentList();

        List<CommentModel> list = new ArrayList<>();

        for(CommentModel cM: comments) {
            if (cM.getType().toString().equals(type)) {
                if (cM.getType() == Comment.Positiv)
                    cM.setTmpDate("Pozytywny");
                else if (cM.getType() == Comment.Negativ)
                    cM.setTmpDate("Negatywny");
                else
                    cM.setTmpDate("Neutralny");
                list.add(cM);
            }
        }

        modelAndView.addObject("list", list);

        return modelAndView;

    }

    @RequestMapping("/accountdetails")
    public ModelAndView accountDetails(HttpSession session){

        session.setAttribute("content", Content.Account);
        UserModel user = (UserModel)session.getAttribute("user");
        AccountModel account = user.getAccountModel();
        List<CommentModel> list = account.getCommentList();
        int auctionNumber = AccountNetworkManager.getAuctionNumber(user.getId());

        int positive = 0, negative = 0, neutral = 0;
        int star1 = 0, star2 = 0, star3 = 0, star4 = 0, star5 = 0;

        for(CommentModel cM: list){
            if(cM.getType() == Comment.Positiv)
                positive++;
            else if (cM.getType() == Comment.Negativ)
                negative ++;
            else
                neutral++;

            if(cM.getRate() == 1)
                star1++;
            else if (cM.getRate() == 2)
                star2++;
            else if (cM.getRate() == 3)
                star3++;
            else if (cM.getRate() == 4)
                star4++;
            else
                star5++;
        }


        ModelAndView modelAndView = new ModelAndView("myAccount");
        modelAndView.addObject("user", user);
        modelAndView.addObject("account", account);
        modelAndView.addObject("auctionNumber", auctionNumber);
        modelAndView.addObject("positive", positive);
        modelAndView.addObject("negative", negative);
        modelAndView.addObject("neutral", neutral);
        modelAndView.addObject("star1", star1);
        modelAndView.addObject("star2", star2);
        modelAndView.addObject("star3", star3);
        modelAndView.addObject("star4", star4);
        modelAndView.addObject("star5", star5);
        return modelAndView;
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
