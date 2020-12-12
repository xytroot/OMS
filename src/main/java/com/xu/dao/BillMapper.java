package com.xu.dao;

import com.xu.pojo.Bill;
import com.xu.pojo.BillToShow;
import com.xu.pojo.Order;
import com.xu.pojo.Ordering;

import java.util.List;

public interface BillMapper {
    List<BillToShow> getBillList();

    int deleteBill(int billId);

    List<BillToShow> getBillsByName(String userName);

    int addBill(Bill bill);
}
