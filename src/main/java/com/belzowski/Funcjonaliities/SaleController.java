package com.belzowski.Funcjonaliities;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sale")
public class SaleController {

    @RequestMapping("/")
    public String saleHome(){

        return "sale";
    }
}
