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

    /**
     * 通过aid查询
     * @param aid
     * @return
     * @throws Exception
     */
    Admin selectByPrimaryKey(String aid) throws Exception;

    /**
     * 修改管理员信息通过id
     * @param admin
     * @return
     * @throws Exception
     */
    int updateByPrimaryKey(Admin admin) throws Exception;

}
