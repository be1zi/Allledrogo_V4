package com.belzowski.Funcjonaliities;

import com.belzowski.Network.TestNetworkManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/test1")
    public String test1(){

        TestNetworkManager.test();

        return "home";
    }

    @RequestMapping(value = "/test2", method = RequestMethod.GET)
    public String test2(@RequestParam(value = "name") String name){

        TestNetworkManager.addTest(name);

        return "home";
    }

    @RequestMapping("/homethree")
    public String secoundHome(){

        return "homethree";
    }

    @RequestMapping("/index")
    public String indexPage(){

        return "index";
    }

    @RequestMapping("/greeting")
    public String greeting() {

        return "greeting";
    }
}
