package com.xu.controller;

import com.xu.pojo.User;
import com.xu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    private UserService userService;

    @Autowired
    //@Qualifier("userServiceImpl")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //跳转到添加用户页面
    @RequestMapping("/toAddUser")
    public String toAddUser(){
        return "addUser";
    }

    //添加用户
    @RequestMapping("/addUser")
    public String addUser(HttpServletRequest request, User user, Model model){
        String auth = request.getParameter("auth");
        if(auth !=null && auth.equals("on"))
            user.setAuthorization(1);
        else
            user.setAuthorization(0);
        int res = userService.addUser(user);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        //System.out.println(user);
        return "redirect:/allUser";
    }

    //展示所有用户
    @RequestMapping("/allUser")
    public String allUser(Model model){
        List<User> userList = userService.getUserList();
        model.addAttribute("list",userList);
        return "allUser";
    }

    //跳转到修改用户页面
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(int id, Model model){
        User user = userService.getUserById(id);
        model.addAttribute("USER",user);
        return "updateUser";
    }

    //修改用户
    @RequestMapping("/updateUser")
    public String updateUser(User user, Model model){
        int res = userService.updateUser(user);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        //System.out.println(user);
        return "redirect:/allUser";
    }

    //删除用户
    @RequestMapping("/deleteUser")
    public String deleteUser(int id, Model model){
        int res = userService.deleteUser(id);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        //System.out.println(user);
        return "redirect:/allUser";
    }

    //查询用户
    @RequestMapping("/getUser")
    public String getUserBySuffixName(String userName, Model model){
//        if(userName!=null) {
//            System.out.println(userName.equals(""));
//            System.out.println("fsdfsdfsd");
//        }
        List<User> userList = userService.getUserBySuffixName(userName);
        //System.out.println(userList);
        model.addAttribute("list",userList);
        return "allUser";
    }


    @ResponseBody
    @RequestMapping("/validationId")
    public String validationId(Integer Id){
        if(Id == null)
            return "";
        if(userService.getUserById(Id) == null)
            return "";
        return "该ID已存在";
    }

    @ResponseBody
    @RequestMapping("/validationName")
    public String validationName(String Name){
        User user = userService.getUserByName(Name);//不存在则返回null
        if(user == null)
            return "";
        return "该用户名已存在";
    }

    @RequestMapping("/clientBalanceModify")
    public String clientBalanceModify(HttpSession session){
        User userTmp = (User) session.getAttribute("userLoginInfo");
        User user = userService.getUserById(userTmp.getUserId());
        double totalPrice = (double) session.getAttribute("totalPrice");
        user.setBalance(user.getBalance() - totalPrice);
        userService.updateBalance(user);
        user = userService.getUserById(userTmp.getUserId());
        session.setAttribute("userLoginInfo",user);
        return "redirect:/clientAddBill";
    }

    @RequestMapping("/goclientTopUp")
    public synchronized String goclientTopUp(HttpSession session){
        session.setAttribute("userLoginInfo", userService.getUserById(((User) session.getAttribute("userLoginInfo")).getUserId()));
        return "clientTopUp";
    }
    @RequestMapping("/clientTopUp")
    public synchronized String clientTopUp(HttpSession session,int credits){
        User userTmp = (User) session.getAttribute("userLoginInfo");
        User user = userService.getUserById(userTmp.getUserId());
        user.setBalance(user.getBalance() + credits);
        userService.updateBalance(user);
        user = userService.getUserById(userTmp.getUserId());
        session.setAttribute("userLoginInfo",user);
        return "redirect:/goclientTopUp";
    }

    @RequestMapping("/goclientChangePwd")
    public synchronized String goclientChangePwd(HttpSession session){
        session.setAttribute("userLoginInfo", userService.getUserById(((User) session.getAttribute("userLoginInfo")).getUserId()));
        return "clientChangePwd";
    }
    @RequestMapping("/clientChangePwd")
    public synchronized String clientChangePwd(HttpSession session,String pwd){
        User userTmp = (User) session.getAttribute("userLoginInfo");
        User user = userService.getUserById(userTmp.getUserId());
        user.setPassword(pwd);
        userService.updateUser(user);
        user = userService.getUserById(userTmp.getUserId());
        session.setAttribute("userLoginInfo",user);
        return "redirect:/goclientChangePwd";
    }
}
