package com.xu.controller;

import com.xu.pojo.Menu;
import com.xu.pojo.Order;
import com.xu.pojo.User;
import com.xu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
public class LoginController {
    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/goLogin")
    public String goLogin(){
        return "login";
    }


    @RequestMapping("/login")
    public String login(HttpSession session, String name, String pwd, Model model){
        User user = userService.getUserByName(name);
        if(user == null || !user.getPassword().equals((pwd))) {
            model.addAttribute("info","密码错误或用户名不存在");
            return "login";
        }
        else{
            session.setAttribute("userLoginInfo",user);
            if(user.getAuthorization() == 1) {
                session.setAttribute("auth","系统管理员: ");
                return "redirect:/allUser";
            }
            else {
                session.setAttribute("auth","顾客: ");
                session.setAttribute("cart",new HashMap<Integer, Integer>());
                session.setAttribute("cartList",null);
                return "redirect:clientOrder";
            }
        }
    }

    @RequestMapping("/goSignup")
    public String goSignup(){
        return "signup";
    }


    @RequestMapping("/signup")
    public String signup(String name, String pwd,Model model){
        User user = new User();
        user.setUserName(name);
        user.setPassword(pwd);
        int res = userService.addUser(user);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        return "redirect:/goLogin";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userLoginInfo");
        session.removeAttribute("auth");
        session.removeAttribute("cart");
        session.removeAttribute("cartList");
        return "redirect:/goLogin";
    }


}
