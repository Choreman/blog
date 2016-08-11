package com.doing.blog.service.impl;

import com.doing.blog.mapper.AdminMapper;
import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> selectAdmin() throws Exception {
        //调用mapper类中的selectByExample方法，如果传入类型为null，则表示无条件查找
        List<Admin> admins = adminMapper.selectByExample(null);
        return admins;
    }
}
