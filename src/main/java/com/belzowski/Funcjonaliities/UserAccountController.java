package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AccountModel;
import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.CommentModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.AccountNetworkManager;
import com.belzowski.Network.AuctionNetworkManager;
import com.belzowski.Network.UserNetworkManager;
import com.belzowski.Support.Enum.Comment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/userAccount")
public class UserAccountController {

    @RequestMapping("/show")
    public ModelAndView showUserAccount(@RequestParam("login") String login, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("userAccount");
        UserModel user = UserNetworkManager.getUserByLogin(login);
        AccountModel account = user.getAccountModel();
        List<CommentModel> list = account.getCommentList();

        session.setAttribute("userToWatch", user);

        int positive = 0, negative = 0, neutral = 0;
        int star1 = 0, star2 = 0, star3 = 0, star4 = 0, star5 = 0;

        int auctionNumber = AccountNetworkManager.getAuctionNumber(user.getId());

        for(CommentModel cM:list){
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

    @RequestMapping("/auctionList")
    public ModelAndView showAuctionList(HttpSession session){

        ModelAndView modelAndView = new ModelAndView("auctionList");
        UserModel user = (UserModel)session.getAttribute("userToWatch");
        List<AuctionModel> auctionModelList = AuctionNetworkManager.getMyAuction(user,false, false, session);

        if(auctionModelList == null)
            auctionModelList = new ArrayList<>();

        modelAndView.addObject("list", auctionModelList);

        return modelAndView;
    }
}
