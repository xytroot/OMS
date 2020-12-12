package com.xu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ordering {
    private Integer orderId;
    private int tableId;
    private int userId;
    private int dishesId;
    private int dishesNum;
    private Date orderTime;

}
