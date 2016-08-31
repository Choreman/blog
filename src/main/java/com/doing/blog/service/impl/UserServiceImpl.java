package com.doing.blog.service.impl;

import com.doing.blog.mapper.UserMapper;
import com.doing.blog.model.User;
import com.doing.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    public int insertUser(User user) throws Exception {
        Date createDate = new Date();       //创建时间
        user.setCreateDate(createDate);
        return userMapper.insert(user);
    }

    public User selectByLoginName(String loginName) throws Exception {
        User user = userMapper.selectByLoginName(loginName);
        return user;
    }

    public User login(User user) throws Exception {
        return userMapper.login(user);
    }

    public User selectByPrimaryKey(Long uId) throws Exception {
        User user = userMapper.selectByPrimaryKey(uId);
        return user;
    }

    public int updateByPrimaryKeySelective(User user) throws Exception {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    public boolean isLogin(HttpSession session) throws Exception {
        User loginUser = (User)session.getAttribute("loginUser");
        if(loginUser != null){
            return true;
        }else{
            return false;
        }
    }

    public int deleteByPrimaryKey(Long uId) throws Exception {
        return userMapper.deleteByPrimaryKey(uId);
    }
}
