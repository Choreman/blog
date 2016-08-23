package com.doing.blog.service.impl;

import com.doing.blog.mapper.UserMapper;
import com.doing.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

}
