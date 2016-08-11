package com.doing.blog.service;

import com.doing.blog.model.Admin;

import java.util.List;

public interface AdminService {
    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    List<Admin> selectAdmin() throws Exception;
}
