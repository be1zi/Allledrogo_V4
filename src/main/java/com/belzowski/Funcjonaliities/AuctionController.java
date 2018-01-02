package com.belzowski.Funcjonaliities;

import com.belzowski.Model.*;
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
import java.util.*;

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

        session.setAttribute("biddingList", null);

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

        // lista licytujących
        if(auctionModel.getBiddingList() != null) {

            List<BiddingModel> biddingModelList = auctionModel.getBiddingList();

            Collections.sort(biddingModelList, new Comparator<BiddingModel>() {
                @Override
                public int compare(BiddingModel o1, BiddingModel o2) {
                    return o2.getPrice().compareTo(o1.getPrice());
                }
            });

            session.setAttribute("biddingList", auctionModel.getBiddingList());

            for (BiddingModel bM: biddingModelList) {
                DateFormatter dF = new DateFormatter(bM.getDate(),"yyyy-MM-dd HH:mm");
                bM.setTmpDate(dF.calendarToString());
            }
        }

        //lista kupionych
        List<TransactionModel> transactionModels = AuctionNetworkManager.getTransactions(auctionModel);

        if(transactionModels != null )
            session.setAttribute("transactions", transactionModels);

        if(auctionModel != null) {
            modelAndView.addObject("auction", auctionModel);
            AuctionNetworkManager.editAuction(auctionModel.getId(), auctionModel.getUserId(), auctionModel.getViewNumber(),session);
        }

        out.println(auctionModel);
        return  modelAndView;
    }

    @RequestMapping("/list/{category}")
    public ModelAndView auctionsList(@PathVariable String category){

        ModelAndView modelAndView = new ModelAndView("auctionList");
        List<AuctionModel> auctionModels = AuctionNetworkManager.getListByCategory(category);
        modelAndView.addObject("list", auctionModels);

        out.println(auctionModels.size());
        return modelAndView;
    }

    @RequestMapping("/buy/{auctionId}/{userId}/{itemNumber}/{price}")
    public String bidding(@PathVariable Long auctionId, @PathVariable Long userId, @PathVariable int itemNumber, @PathVariable double price, HttpSession session){

        UserModel userModel = (UserModel)session.getAttribute("user");
        int isBuy = ShoppingNetworkManager.buy(auctionId, userId, userModel.getId(), itemNumber, price);

        if(isBuy == 0)
            session.setAttribute("shopping", Shopping.FAILURE);
        else if (isBuy == 1)
            session.setAttribute("shopping", Shopping.SUCCESS);
        else
            session.setAttribute("shopping", Shopping.OWNAUCTION);

        return "redirect:/";
    }

    @RequestMapping("/delete/{id}/{userId}")
    public String deleteAuction(@PathVariable("id") Long id, @PathVariable("userId") Long userId){

        boolean isDeleted = AuctionNetworkManager.deleteAuction(id,userId );

        if(isDeleted)
            return "redirect:/sale/notsold";

        return "redirect:/sale/mysale";
    }

    @RequestMapping("/addagain/{id}/{userId}")
    public String addAgain(@PathVariable("id") Long id, @PathVariable("userId") Long userId){

        boolean isAdded = AuctionNetworkManager.addAgain(id, userId);

        if(isAdded)
            return "redirect:/sale/mysales";

        return "redirect:/sale/notsale";
    }
}
