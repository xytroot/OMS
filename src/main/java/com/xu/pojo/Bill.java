package com.xu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bill {
    private Integer billId;
    private int userId;
    private double totalPrice;
    private Date billTime;

}
