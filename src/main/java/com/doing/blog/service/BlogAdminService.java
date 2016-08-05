package com.doing.blog.service;

import com.doing.blog.model.BlogAdmin;

import java.util.List;

public interface BlogAdminService {
    /**
     * 查询所有用户
     * @return
     * @throws Exception
     */
    List<BlogAdmin> selectAdmin() throws Exception;
}
