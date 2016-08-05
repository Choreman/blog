package com.doing.blog.service.impl;

import com.doing.blog.mapper.BlogAdminMapper;
import com.doing.blog.model.BlogAdmin;
import com.doing.blog.service.BlogAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogAdminServiceImpl implements BlogAdminService {

    @Autowired
    private BlogAdminMapper blogAdminMapper;

    public List<BlogAdmin> selectAdmin() throws Exception {
        //调用mapper类中的selectByExample方法，如果传入类型为null，则表示无条件查找
        List<BlogAdmin> blogAdmins = blogAdminMapper.selectByExample(null);
        return blogAdmins;
    }
}
