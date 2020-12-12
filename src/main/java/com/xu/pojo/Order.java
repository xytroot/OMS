package com.xu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Comparable<Order>{
    private Integer orderId;
    private int tableId;
    private int dishesNum;

    private User user;
    private Menu menu;

    private Date orderTime;

    @Override
    public int compareTo(Order o) {
        if(this.orderId > o.orderId)
            return 1;
        else if(this.orderId < o.orderId)
            return -1;
        else
            return 0;
    }
}
