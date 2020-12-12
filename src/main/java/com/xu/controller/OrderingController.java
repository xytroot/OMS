package com.xu.controller;

import com.xu.pojo.Order;
import com.xu.pojo.Ordering;
import com.xu.pojo.User;
import com.xu.service.OrderingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class OrderingController {

    private OrderingService orderingService;

    @Autowired
    public void setOrderingService(OrderingService orderingService) {
        this.orderingService = orderingService;
    }

    @RequestMapping("/allOrdering")
    public String getOrderingList(Model model){
        List<Order> orderList = orderingService.getOrderingList();
        Collections.sort(orderList);
        model.addAttribute("list",orderList);
        return "allOrdering";
    }

    @RequestMapping("/deleteOrdering")
    public String deleteOrdering(int id,Model model) {
        int res = orderingService.deleteOrdering(id);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        return "redirect:/allOrdering";
    }

    @RequestMapping("/getOrderingsByName")
    public String getOrderingsByName(String userName,Model model) {
        List<Order> orderList = orderingService.getOrderingsByName(userName);
        model.addAttribute("list",orderList);
        return "allOrdering";
    }


    @RequestMapping("/clientSubmit")
    public String clientSubmit(HttpSession session,int tableId,int pay, Model model) throws ParseException {
        ArrayList<Order> list = (ArrayList<Order>) session.getAttribute("cartList");
        if(list.size() == 0)
            return "redirect:/clientCart";
        User user = (User) session.getAttribute("userLoginInfo");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=new Date();
        for(Order order:list) {
            Ordering ordering = new Ordering(null, tableId, user.getUserId(), order.getMenu().getDishesId(), order.getDishesNum(), simpleDateFormat.parse(simpleDateFormat.format(date)));
            //System.out.println(ordering);
            int res = orderingService.addOrdering(ordering);
            if(res >= 1)
                model.addAttribute("state", "Success!");
            else
                model.addAttribute("state","Fail!");
        }

        if(pay == 0)
            return "redirect:/clientBalanceModify";
        else
            return "redirect:/clientAddBill";
    }

    @RequestMapping("/clientCheckOrder")
    public String clientCheckOrder(Model model,HttpSession session){
        List<Order> orderList = orderingService.getOrderingsByName(((User) session.getAttribute("userLoginInfo")).getUserName());
        model.addAttribute("list",orderList);
        return "clientCheckOrder";
    }
}
