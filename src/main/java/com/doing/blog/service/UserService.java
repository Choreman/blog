package com.doing.blog.service;

import com.doing.blog.model.User;

public interface UserService {

    /**
     * 插入用户
     * @param user
     * @return
     * @throws Exception
     */
    int insertUser(User user) throws Exception;

    /**
     * 根据登陆名查找是否有相关的记录
     * @param loginName
     * @return
     * @throws Exception
     */
    User selectByLoginName(String loginName) throws Exception;

    /**
     * 用户登陆
     * @param user
     * @return
     * @throws Exception
     */
    User login(User user) throws Exception;

}
