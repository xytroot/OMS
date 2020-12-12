package com.xu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BillToShow {
    private Integer billId;
    private double totalPrice;
    private User user;
    private Date billTime;
}
