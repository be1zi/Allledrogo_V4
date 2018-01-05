package com.belzowski.Funcjonaliities;

import com.belzowski.Model.MessageModel;
import com.belzowski.Model.SingleMessageModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.MessageNetworkManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.util.Calendar;


@Controller
@RequestMapping("/message")
public class MessagesController {

    @RequestMapping("/{ownerLogin}")
    public ModelAndView message(@PathVariable("ownerLogin") String ownerLogin, @RequestParam(value = "title") String title , HttpSession session){

        ModelAndView modelAndView = new ModelAndView("sendMessage");

        MessageModel messageModel = new MessageModel();
        messageModel.setTopic(title);
        messageModel.setOwnerLogin(ownerLogin);

        session.setAttribute("messageTitle", title);
        session.setAttribute("ownerLogin", ownerLogin);

        SingleMessageModel singleMessageModel = new SingleMessageModel();

        modelAndView.addObject("message", messageModel);
        modelAndView.addObject("singleMessage", singleMessageModel);

        return modelAndView;
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String sendMessage(@ModelAttribute("message") MessageModel messageModel,@ModelAttribute("singleMessage") SingleMessageModel singleMessageModel, HttpSession session){

        UserModel userModel = (UserModel)session.getAttribute("user");
        messageModel.setId(Long.valueOf(1));
        messageModel.setSenderLogin(userModel.getLogin());
        messageModel.setDate(Calendar.getInstance());
        messageModel.setItemNumber(0);
        messageModel.setViewed(false);

        String title = (String)session.getAttribute("messageTitle");
        String ownerLogin = (String)session.getAttribute("ownerLogin");
        messageModel.setTopic(title);
        messageModel.setOwnerLogin(ownerLogin);

        Long isAdded = MessageNetworkManager.addFirstMessage(messageModel);

        singleMessageModel.setId(Long.valueOf(1));
        singleMessageModel.setAuthorLogin(userModel.getLogin());
        singleMessageModel.setMessageModelId(isAdded);
        singleMessageModel.setDate(Calendar.getInstance());

        MessageNetworkManager.addMessage(singleMessageModel);

        return "redirect:/myaccount/messageslist";
    }

}
