package com.xu.dao;

import com.xu.pojo.Menu;

import java.util.List;

public interface MenuMapper {
    List<Menu> getMenuList();

    Menu getDishById(int dishesId);

    Menu getDishByName(String dishesName);

    List<Menu> getDishBySuffixName(String dishesName);

    int addDish(Menu dish);

    int updateDish(Menu dish);

    int deleteDish(int dishesId);

}
