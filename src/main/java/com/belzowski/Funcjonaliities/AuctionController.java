package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.AuctionNetworkManager;
import com.belzowski.Network.ShoppingNetworkManager;
import com.belzowski.Support.Enum.Shopping;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/auction")
public class AuctionController {

    @RequestMapping("/{id}")
    public ModelAndView showAuction(@PathVariable Long id, HttpSession session){

        ModelAndView modelAndView = new ModelAndView("auction");
        AuctionModel auctionModel = AuctionNetworkManager.getAuction(id, session);

        DateFormatter dateFormatter = new DateFormatter(auctionModel.getEndDate(), "yyyy-MM-dd HH:mm");
        auctionModel.setTmpDate(dateFormatter.calendarToString());
        auctionModel.setViewNumber(auctionModel.getViewNumber() + 1);
        String imageEncoded = null;

        // miniaturka
        try {
            List<PhotoModel> imagesList = auctionModel.getFiles();
            byte[] image = Base64.getEncoder().encode(imagesList.get(0).getImage());
            imageEncoded = new String(image, "UTF-8");
            modelAndView.addObject("mainImages", imageEncoded);
        }catch(IndexOutOfBoundsException e){
            modelAndView.addObject("mainImages", "photoPlaceholder");

        }catch(UnsupportedEncodingException e){
            modelAndView.addObject("mainImages", "photoPlaceholder");
        }

        // reszta zdjęć
        if(auctionModel.getFiles() != null){
            List<String> images = new ArrayList<>();
            for(int i=1; i<auctionModel.getFiles().size();i++){
                byte[] image = Base64.getEncoder().encode(auctionModel.getFiles().get(i).getImage());
                try {
                    images.add(new String(image, "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    images.add(new String("photoPlaceholder"));
                }
            }
            modelAndView.addObject("images", images);
        }

        if(auctionModel != null) {
            modelAndView.addObject("auction", auctionModel);
            AuctionNetworkManager.editAuction(auctionModel.getId(), auctionModel.getUserId(), auctionModel.getViewNumber(),session);
        }

        return  modelAndView;
    }

    @RequestMapping("/list")
    public ModelAndView auctionList(){

        ModelAndView modelAndView = new ModelAndView("auctionList");

        return modelAndView;
    }

    @RequestMapping("/list/{category}")
    public ModelAndView auctionsList(@PathVariable String category){

        ModelAndView modelAndView = new ModelAndView("auctionList");

        return modelAndView;
    }

    @RequestMapping("/buyNow/{auctionId}/{userId}/{itemNumber}")
    public String bought(@PathVariable Long auctionId, @PathVariable Long userId, @PathVariable int itemNumber, HttpSession session){

        UserModel userModel = (UserModel)session.getAttribute("user");
        int isBuy = ShoppingNetworkManager.buyNow(auctionId, userId,userModel.getId(), itemNumber);

        if(isBuy == 0)
            session.setAttribute("shopping", Shopping.FAILURE);
        else if (isBuy == 1)
            session.setAttribute("shopping", Shopping.SUCCESS);
        else
            session.setAttribute("shopping", Shopping.OWNAUCTION);

        return "redirect:/";
    }

    @RequestMapping("/bidding/{auctionId}/{userId}/{itemNumber}/{price}")
    public String bidding(@PathVariable Long auctionId, @PathVariable Long userId, @PathVariable int itemNumber, @PathVariable double price, HttpSession session){

        UserModel userModel = (UserModel)session.getAttribute("user");
        return "redirect:/";
    }
}
