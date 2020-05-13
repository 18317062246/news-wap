package com.news.web.controller;

import com.news.web.model.pojo.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestController {

    @RequestMapping("/index/{name}")
    public String testJsp(Model model , @PathVariable(name = "name") String name){

        List<Users> list = new ArrayList<>();
        list.add(new Users(1,"张三",20));
        list.add(new Users(2,"李四",22));
        list.add(new Users(3,"王五",24));
        model.addAttribute("cityen" , name);

        //需要一个 Model 对象
        model.addAttribute("list",list);
        //跳转视图
        return "test";
    }

    @RequestMapping("index1")
    public String testIndex1(HttpServletRequest request , Model model ){
        String name = request.getParameter("name");
        System.out.println("name = " + name);
        List<Users> list = new ArrayList<>();
        list.add(new Users(1,"张三",20));
        list.add(new Users(2,"李四",22));
        list.add(new Users(3,"王五",24));
        model.addAttribute("cityen" , name);

        //需要一个 Model 对象
        model.addAttribute("list",list);
        //跳转视图
        return "test";
    }
}