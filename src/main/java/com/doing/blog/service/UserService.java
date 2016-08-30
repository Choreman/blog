package com.doing.blog.service;

import com.doing.blog.model.User;

import javax.servlet.http.HttpSession;

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

    /**
     * 通过id查找相关用户记录
     * @param uId
     * @return
     * @throws Exception
     */
    User selectByPrimaryKey(Long uId) throws Exception;

    /**
     * 修改用户信息
     * @param user
     * @return
     * @throws Exception
     */
    int updateByPrimaryKeySelective(User user) throws Exception;

    /**
     * 判断用户是否登陆
     * @param session
     * @return
     * @throws Exception
     */
    boolean isLogin(HttpSession session) throws Exception;

}
