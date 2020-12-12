package com.xu.service;

import com.xu.dao.MenuMapper;
import com.xu.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {


    private MenuMapper menuMapper;

    @Autowired
    public void setMenuMapper(MenuMapper menuMapper) {
        this.menuMapper = menuMapper;
    }

    @Override
    public List<Menu> getMenuList() {
        return menuMapper.getMenuList();
    }

    @Override
    public Menu getDishById(int dishesId) {
        return menuMapper.getDishById(dishesId);
    }

    @Override
    public Menu getDishByName(String dishesName) {
        return menuMapper.getDishByName(dishesName);
    }

    @Override
    public List<Menu> getDishBySuffixName(String dishesName) {
        return menuMapper.getDishBySuffixName(dishesName);
    }

    @Override
    public int addDish(Menu dish) {
        return menuMapper.addDish(dish);
    }

    @Override
    public int updateDish(Menu dish) {
        return menuMapper.updateDish(dish);
    }

    @Override
    public int deleteDish(int dishesId) {
        return menuMapper.deleteDish(dishesId);
    }
}
