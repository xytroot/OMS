package com.xu.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer userId;
    private String userName;
    private String password;
    private double balance;
    private int authorization;

    public User(Integer userId, String userName, String password, double balance) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.balance = balance;
    }
}
