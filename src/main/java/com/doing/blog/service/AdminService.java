package com.doing.blog.service;

import com.doing.blog.been.PageBean;
import com.doing.blog.model.Admin;

import java.util.List;
import java.util.Map;

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
    int updateByPrimaryKeySelective(Admin admin) throws Exception;

    /**
     * @param searchText 模糊查询内容
     * @param sEcho
     * @param pageBean 分页实体
     * @return
     */
    Map dataTable(String searchText, int sEcho, PageBean pageBean);

}
