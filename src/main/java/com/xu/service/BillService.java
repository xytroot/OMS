package com.xu.service;

import com.xu.pojo.Bill;
import com.xu.pojo.BillToShow;

import java.util.List;

public interface BillService {
    List<BillToShow> getBillList();

    int deleteBill(int billId);

    List<BillToShow> getBillsByName(String userName);

    int addBill(Bill bill);
}
