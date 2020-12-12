package com.xu.service;

import com.xu.dao.BillMapper;
import com.xu.pojo.Bill;
import com.xu.pojo.BillToShow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImpl implements BillService{


    private BillMapper billMapper;

    @Autowired
    public void setBillMapper(BillMapper billMapper) {
        this.billMapper = billMapper;
    }

    @Override
    public List<BillToShow> getBillList() {
        return billMapper.getBillList();
    }

    @Override
    public int deleteBill(int billId) {
        return billMapper.deleteBill(billId);
    }

    @Override
    public List<BillToShow> getBillsByName(String userName) {
        return billMapper.getBillsByName(userName);
    }

    @Override
    public int addBill(Bill bill) {
        return billMapper.addBill(bill);
    }
}
