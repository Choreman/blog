package com.doing.blog.service;

import com.doing.blog.model.Admin;

import java.util.List;

public interface AdminService {

    /**
     * 管理员登陆
     * @param admin
     * @return
     * @throws Exception
     */
    Admin login(Admin admin) throws Exception;

}
