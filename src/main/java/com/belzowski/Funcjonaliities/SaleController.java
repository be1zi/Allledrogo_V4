package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.PhotoModel;
import com.belzowski.Model.TransactionModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Network.AuctionNetworkManager;
import com.belzowski.Support.Enum.Content;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import static java.lang.System.out;


@Controller
@RequestMapping("/sale")
public class SaleController {

    @RequestMapping("/")
    public String saleHome(HttpSession session){

        Content tmp = (Content) session.getAttribute("content");

        if(tmp != null && tmp != Content.MySales && tmp != Content.Sold && tmp != Content.NotSold && tmp != Content.MakeAuction )
            return "redirect:/sale/mysales";

        if(tmp == null){
            return "redirect:/sale/mysales";
        }

        return "sale";

    }

    @RequestMapping("/makeauction")
    public ModelAndView makeAuction(HttpSession session){

        session.setAttribute("content", Content.MakeAuction);

        List<PhotoModel> photoModels = new ArrayList<>();
        session.setAttribute("image", photoModels);

        ModelAndView modelAndView = new ModelAndView("sale");
        AuctionModel auctionModel = new AuctionModel();
        modelAndView.addObject("auctionModel", auctionModel);

        return modelAndView;
    }

    @RequestMapping("/save")
    public String  saveAuction(@ModelAttribute("auctionModel")  AuctionModel auctionModel, HttpSession session){

        if(auctionModel != null){

            UserModel userModel = (UserModel)session.getAttribute("user");

            auctionModel.setUserId(userModel.getId());

            if(auctionModel.getBiddingPrice() != null) {
                auctionModel.setAuctionType(true);
            }else{
                auctionModel.setAuctionType(false);
            }

            if(auctionModel.getBuyNowPrice() != null){
                auctionModel.setBuyNowType(true);
            }else{
                auctionModel.setBuyNowType(false);
            }

            DateFormatter dateFormatter = new DateFormatter(auctionModel.getTmpDate(), "yyyy-MM-dd HH:mm");
            auctionModel.setEndDate(dateFormatter.stringToCalendar());

            DateFormatter dateFormatter2 = new DateFormatter("yyyy-MM-dd HH:mm");
            auctionModel.setStartDate(dateFormatter2.dateToCalendar());

            ArrayList<PhotoModel> images = (ArrayList<PhotoModel>)session.getAttribute("image");

            if(images != null)
                auctionModel.setFiles(images);

            auctionModel.setSold(false);
            auctionModel.setEnded(false);
            auctionModel.setEndPrice(0.0);
            auctionModel.setUserLogin(userModel.getLogin());
        }

        AuctionModel aM = AuctionNetworkManager.addAuction(auctionModel, session);

        if(aM == null){
            return "redirect:/sale/makeauction";
        }

        return "redirect:/sale/mysales";

    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> uploadFile(@RequestParam("uploadfile") MultipartFile uploadfile, HttpSession session) {

        try {
               ArrayList<PhotoModel> images = (ArrayList<PhotoModel>)session.getAttribute("image");

               PhotoModel pM = new PhotoModel();
               pM.setImage(uploadfile.getBytes());
               images.add(pM);
               session.setAttribute("image",images);
        }
        catch (Exception e) {
            out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/mysales")
    public ModelAndView mySales(HttpSession session) {

        session.setAttribute("content", Content.MySales);
        ModelAndView modelAndView = new ModelAndView("sale");
        UserModel userModel = (UserModel)session.getAttribute("user");
        List<AuctionModel> auctionModelList = AuctionNetworkManager.getMyAuction(userModel,false, false, session);
        modelAndView.addObject("list", auctionModelList);

        return modelAndView;
    }

    @RequestMapping("/sold")
    public ModelAndView sold(HttpSession session){

        session.setAttribute("content", Content.Sold);
        ModelAndView modelAndView = new ModelAndView("sale");
        UserModel userModel = (UserModel) session.getAttribute("user");
        List<TransactionModel> transactionModels = AuctionNetworkManager.getSold(userModel.getLogin());
        modelAndView.addObject("list", transactionModels);
        return modelAndView;
    }

    @RequestMapping("/notsold")
    public ModelAndView notSold(HttpSession session){

        session.setAttribute("content", Content.NotSold);
        ModelAndView modelAndView = new ModelAndView("sale");
        UserModel userModel = (UserModel)session.getAttribute("user");
        List<AuctionModel> auctionModelList = AuctionNetworkManager.getMyAuction(userModel, false, true, session);
        modelAndView.addObject("list", auctionModelList);

        return modelAndView;
    }
}
