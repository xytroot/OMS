package com.xu.service;

import com.xu.dao.OrderingMapper;
import com.xu.pojo.Order;
import com.xu.pojo.Ordering;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderingServiceImpl implements OrderingService{

    private OrderingMapper orderingMapper;

    @Autowired
    public void setOrderingMapper(OrderingMapper orderingMapper) {
        this.orderingMapper = orderingMapper;
    }

    @Override
    public List<Order> getOrderingList() {
        return orderingMapper.getOrderingList();
    }

    @Override
    public int deleteOrdering(int orderId) {
        return orderingMapper.deleteOrdering(orderId);
    }

    @Override
    public List<Order> getOrderingsByName(String userName) {
        return orderingMapper.getOrderingsByName(userName);
    }

    @Override
    public List<Order> getOrderingsByDishName(String dishesName) {
        return orderingMapper.getOrderingsByDishName(dishesName);
    }

    @Override
    public int addOrdering(Ordering ordering) {
        return orderingMapper.addOrdering(ordering);
    }
}
