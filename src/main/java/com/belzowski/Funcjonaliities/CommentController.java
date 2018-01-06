package com.belzowski.Funcjonaliities;

import com.belzowski.Model.CommentModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.CommentNetworkManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.Calendar;

import static java.lang.System.out;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @RequestMapping("/make")
    public ModelAndView sendComment(@RequestParam(value = "title") String title, @RequestParam(value="id") Long id, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("sendComment");
        CommentModel comment = new CommentModel();
        comment.setAuctionTitle(title);

        modelAndView.addObject("comment", comment);
        session.setAttribute("commentTitle", title);
        session.setAttribute("id", id);
        return modelAndView;
    }

    @RequestMapping("/send")
    public String sendComment(@ModelAttribute("comment") CommentModel comment, HttpSession session){

        UserModel user = (UserModel)session.getAttribute("user");
        String title = (String)session.getAttribute("commentTitle");
        Long id = (Long)session.getAttribute("id");

        comment.setSenderLogin(user.getLogin());
        comment.setAuctionTitle(title);
        comment.setDate(Calendar.getInstance());
        comment.setTransactionId(id);

        CommentNetworkManager.sendComment(comment);

        return "redirect:/shopping/";
    }
}
