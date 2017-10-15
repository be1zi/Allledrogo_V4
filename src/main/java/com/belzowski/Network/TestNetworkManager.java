package com.belzowski.Network;

import com.belzowski.Model.TestModel;
import com.belzowski.Support.Static.Constant;
import org.springframework.web.client.RestTemplate;

import static java.lang.System.out;

public class TestNetworkManager {


    public static void test(){

        RestTemplate restTemplate = new RestTemplate();
        TestModel testModel = restTemplate.getForObject(Constant.testObjectURL, TestModel.class);
        out.println(testModel.toString());
    }

    public static  void addTest(String name){

        TestModel testModel = new TestModel();
        testModel.setId(Long.valueOf(1));
        testModel.setName(name);

        RestTemplate restTemplate = new RestTemplate();

        TestModel result = restTemplate.postForObject(Constant.addTestURL, testModel, TestModel.class);
        out.println(result);

    }

}
