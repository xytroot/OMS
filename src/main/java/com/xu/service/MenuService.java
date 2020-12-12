package com.xu.service;

import com.xu.pojo.Menu;

import java.util.List;

public interface MenuService {
    List<Menu> getMenuList();

    Menu getDishById(int dishesId);

    Menu getDishByName(String dishesName);

    List<Menu> getDishBySuffixName(String dishesName);

    int addDish(Menu dish);

    int updateDish(Menu dish);

    int deleteDish(int dishesId);
}
