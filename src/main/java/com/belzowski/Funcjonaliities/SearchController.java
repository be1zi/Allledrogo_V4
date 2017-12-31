package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static java.lang.System.out;


@Controller
@RequestMapping("/search")
public class SearchController {



    @RequestMapping(value="/search")
    public ModelAndView Search(@RequestParam(value = "searchTerm", required = false) String pSearchTerm, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("search");

        mav.addObject("searchTerm", pSearchTerm);

        return mav;
    }

    @RequestMapping("/")
    public ModelAndView search(@CookieValue(value = "search", defaultValue = "default") String search,  HttpSession session){

        ModelAndView modelAndView = new ModelAndView("auctionList");
        String title = (String)session.getAttribute("search");
        out.println(title + " " + search);
        return  modelAndView;
    }
}
