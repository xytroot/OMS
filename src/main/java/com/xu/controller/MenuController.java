package com.xu.controller;

import com.xu.pojo.Menu;
import com.xu.pojo.Order;
import com.xu.pojo.User;
import com.xu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MenuController {
    private MenuService menuService;

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @RequestMapping("/allDishes")
    public String allDishes(Model model){
        List<Menu> menuList = menuService.getMenuList();
        model.addAttribute("list",menuList);
        return "allDishes";
    }

    @RequestMapping("/toAddDish")
    public String toAddDish(){return "addDish";}

    @RequestMapping("/addDish")
    public String addDish(Menu dish, Model model){
        int res = menuService.addDish(dish);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        System.out.println(dish);
        return "redirect:/allDishes";
    }

    @RequestMapping("/toUpdateDish")
    public String toUpdateDish(int dishesId, Model model){
        Menu dish = menuService.getDishById(dishesId);
        model.addAttribute("DISH",dish);
        return "updateDish";
    }

    @RequestMapping("/updateDish")
    public String updateDish(Menu dish, Model model){
        int res = menuService.updateDish(dish);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        return "redirect:/allDishes";
    }



    @RequestMapping("/deleteDish")
    public String deleteDish(int dishesId,Model model){
        int res = menuService.deleteDish(dishesId);
        if(res >= 1)
            model.addAttribute("state","Success!");
        else
            model.addAttribute("state","Fail!");
        return "redirect:/allDishes";
    }

    @RequestMapping("/getDishBySuffixName")
    public String getDishBySuffixName(String dishesName, Model model){
        List<Menu> dishesList = menuService.getDishBySuffixName(dishesName);
        //System.out.println(dishesList);
        model.addAttribute("list",dishesList);
        return "allDishes";
    }

    @RequestMapping("clientOrder")
    public String clientOrder(Model model) {
        List<Menu> menuList = menuService.getMenuList();
        model.addAttribute("list",menuList);
        return "clientOrder";
    }

    @RequestMapping("clientGetDishBySuffixName")
    public String clientGetDishBySuffixName(String dishesName, Model model){
        List<Menu> dishesList = menuService.getDishBySuffixName(dishesName);
        model.addAttribute("list",dishesList);
        return "clientOrder";
    }


    @RequestMapping("clientAddDish")
    public String clientAddDish(HttpSession session,int dishesId){
        HashMap<Integer,Integer> map = (HashMap<Integer,Integer>) session.getAttribute("cart");
        if(map.containsKey(dishesId))
            map.put(dishesId, map.get(dishesId)+1);
        else
            map.put(dishesId, 1);
        return "redirect:/clientOrder";
    }

    @RequestMapping("clientCart")
    public String clientCart(HttpSession session){
        double totalPrice = 0;
        HashMap<Integer,Integer> cartMap = (HashMap<Integer, Integer>) session.getAttribute("cart");
        ArrayList<Order> list = new ArrayList<Order>();
        for(Map.Entry<Integer, Integer> entry: cartMap.entrySet()) {
            Order order = new Order();
            Menu dish = menuService.getDishById(entry.getKey());
            order.setDishesNum(entry.getValue());
            order.setMenu(dish);
            list.add(order);
            totalPrice += dish.getUnitPrice() * order.getDishesNum();
        }
        session.setAttribute("cartList",list);
        session.setAttribute("totalPrice",totalPrice);
        return "clientCart";
    }


    @RequestMapping("clientCartDelete")
    public String clientCartDelete(HttpSession session, int dishesId){
        HashMap<Integer,Integer> cartMap = (HashMap<Integer, Integer>) session.getAttribute("cart");
        if(cartMap.get(dishesId) > 1)
            cartMap.put(dishesId, cartMap.get(dishesId)-1);
        else
            cartMap.remove(dishesId);
        return "redirect:/clientCart";
    }

    @ResponseBody
    @RequestMapping("/validationDishesName")
    public String validationName(String Name){

        Menu dish = menuService.getDishByName(Name);//不存在则返回null
        if(dish == null)
            return "";
        return "该菜名已存在";
    }
}
