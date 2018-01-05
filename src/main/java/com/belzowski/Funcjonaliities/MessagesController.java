package com.belzowski.Funcjonaliities;

import com.belzowski.Model.MessageModel;
import com.belzowski.Model.SingleMessageModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.MessageNetworkManager;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.util.*;


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
    public String sendMessage(@ModelAttribute("message") MessageModel messageModel, @ModelAttribute("singleMessage") SingleMessageModel singleMessageModel, HttpSession session){

        UserModel userModel = (UserModel)session.getAttribute("user");
        messageModel.setId(Long.valueOf(1));
        messageModel.setSenderLogin(userModel.getLogin());
        messageModel.setDate(Calendar.getInstance());
        messageModel.setItemNumber(0);
        messageModel.setViewed(false);

        if(messageModel.getTopic() == null) {
            String tmp = (String)session.getAttribute("title");
            messageModel.setTopic(tmp);
        }

        String title = (String)session.getAttribute("messageTitle");
        String ownerLogin = (String)session.getAttribute("ownerLogin");
        messageModel.setTopic(title);
        messageModel.setOwnerLogin(ownerLogin);

        Long isAdded = MessageNetworkManager.addFirstMessage(messageModel);

        singleMessageModel.setAuthorLogin(userModel.getLogin());
        singleMessageModel.setMessageModelId(isAdded);
        singleMessageModel.setDate(Calendar.getInstance());

        MessageNetworkManager.addMessage(singleMessageModel);

        return "redirect:/myaccount/messageslist";
    }

    @RequestMapping("/getMessageList")
    public ModelAndView getMessageList(HttpSession session){

        ModelAndView modelAndView = new ModelAndView("myAccount");
        UserModel user = (UserModel)session.getAttribute("user");
        List<MessageModel> list = MessageNetworkManager.getMessageList(user.getLogin());
        modelAndView.addObject("list", list);
        session.setAttribute("messagesList", list);
        return modelAndView;
    }

    @RequestMapping("/messageDetails")
    public ModelAndView messageDetails(@RequestParam("id") Long id, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("myAccount");
        List<MessageModel> list = (List<MessageModel>)session.getAttribute("messagesList");
        MessageModel message = null;
        for(MessageModel mm: list) {
            if (mm.getId().equals(id)) {
                message = mm;
                break;
            }
        }

        UserModel userModel = (UserModel)session.getAttribute("user");
        List<SingleMessageModel> result = message.getSingleMessageModels();

        Collections.sort(result, new Comparator<SingleMessageModel>() {
            @Override
            public int compare(SingleMessageModel o1, SingleMessageModel o2) {
                return o1.getDate().compareTo(o2.getDate());
            }
        });

        for(SingleMessageModel smm: result){
            DateFormatter dateFormatter = new DateFormatter(smm.getDate(), "yyyy-MM-dd HH:mm:ss");
            smm.setTmpDate(dateFormatter.calendarToString());
        }

        modelAndView.addObject("title", message.getTopic());
        modelAndView.addObject("userLogin",userModel.getLogin());
        modelAndView.addObject("list", result);

        modelAndView.addObject("message", message);
        modelAndView.addObject("singleMessage", new SingleMessageModel());
        session.setAttribute("id", id);

        return modelAndView;
    }

    @RequestMapping("/sendReply")
    public String sendReplace(@ModelAttribute("message") MessageModel messageModel, @ModelAttribute("singleMessage") SingleMessageModel singleMessageModel, HttpSession session){

        Long id = (Long)session.getAttribute("id");
        UserModel userModel = (UserModel)session.getAttribute("user");

        singleMessageModel.setAuthorLogin(userModel.getLogin());
        singleMessageModel.setMessageModelId(id);
        singleMessageModel.setDate(Calendar.getInstance());

        MessageNetworkManager.addMessage(singleMessageModel);

//        return "redirect:/message/messageDetails?id=" + id;
//
        return  "redirect:/myaccount/messageslist";
//        return "redirect:/myaccount/messages?id=" + id;
    }
}
