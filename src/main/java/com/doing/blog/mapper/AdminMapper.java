package com.doing.blog.mapper;

import com.doing.blog.model.Admin;
import com.doing.blog.model.AdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int countByExample(AdminExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int deleteByExample(AdminExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int deleteByPrimaryKey(String aId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int insert(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int insertSelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    List<Admin> selectByExample(AdminExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    Admin selectByPrimaryKey(String aId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int updateByExampleSelective(@Param("record") Admin record, @Param("example") AdminExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int updateByExample(@Param("record") Admin record, @Param("example") AdminExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int updateByPrimaryKeySelective(Admin record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_admin
     *
     * @mbggenerated Sat Aug 27 14:10:10 CST 2016
     */
    int updateByPrimaryKey(Admin record);

    /**
     * 管理员登陆
     * @param admin
     * @return
     */
    Admin login(Admin admin);
}