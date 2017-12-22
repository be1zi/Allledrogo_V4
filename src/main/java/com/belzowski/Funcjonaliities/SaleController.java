package com.belzowski.Funcjonaliities;

import com.belzowski.Model.AuctionModel;
import com.belzowski.Model.UserModel;
import com.belzowski.Support.Enum.Content;
import com.belzowski.Support.Formatter.DateFormatter;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static java.lang.System.out;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @RequestMapping("/")
    public String saleHome(HttpSession session){

        if(session.getAttribute("content") != null && session.getAttribute("content").equals(Content.MakeAuction)){
            return "redirect:/sale/makeauction";
        }

        return "sale";
    }

    @RequestMapping("/makeauction")
    public ModelAndView makeAuction(HttpSession session){

        session.setAttribute("content", Content.MakeAuction);

        List<MultipartFile> multipartFiles = new ArrayList<>();
        session.setAttribute("image", multipartFiles);

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
            auctionModel.setStartDate(dateFormatter.dateToCalendar());

            ArrayList<byte[]> images = (ArrayList<byte[]>)session.getAttribute("image");

            if(images != null)
                auctionModel.setFile(images);

        }
        

        return "redirect:/sale/makeauction";
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<?> uploadFile(@RequestParam("uploadfile") MultipartFile uploadfile, HttpSession session) {

        try {
               ArrayList<byte[]> images = (ArrayList<byte[]>)session.getAttribute("image");

               byte[] image = uploadfile.getBytes();
               images.add(image);
               session.setAttribute("image",images);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping("/mysales")
    public String mySales(HttpSession session){

        session.setAttribute("content", Content.MySales);

        return "redirect:/sale/";
    }

    @RequestMapping("/sold")
    public String sold(HttpSession session){

        session.setAttribute("content", Content.Sold);

        return "redirect:/sale/";
    }

    @RequestMapping("/notsold")
    public String notSold(HttpSession session){

        session.setAttribute("content", Content.NotSold);

        return "redirect:/sale/";
    }
}
