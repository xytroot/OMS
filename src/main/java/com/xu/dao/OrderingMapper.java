package com.xu.dao;

import com.xu.pojo.Order;
import com.xu.pojo.Ordering;
import com.xu.pojo.User;

import java.util.List;

public interface OrderingMapper {
    List<Order> getOrderingList();

    int deleteOrdering(int orderId);

    List<Order> getOrderingsByName(String userName);


    List<Order> getOrderingsByDishName(String dishesName);

    int addOrdering(Ordering ordering);

}
