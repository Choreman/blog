package com.doing.blog.service.impl;

import com.doing.blog.mapper.AdminMapper;
import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import com.doing.blog.util.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public Admin login(Admin admin) {
        admin.setPassword(Encrypt.e(admin.getPassword()));
        return adminMapper.login(admin);
    }

    public Admin selectByPrimaryKey(String aid) throws Exception {
        Admin admin = adminMapper.selectByPrimaryKey(aid);
        return admin;
    }

    public int updateByPrimaryKeySelective(Admin admin) throws Exception {
        return adminMapper.updateByPrimaryKeySelective(admin);
    }
}
