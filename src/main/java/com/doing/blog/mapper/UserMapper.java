package com.doing.blog.mapper;

import com.doing.blog.model.User;
import com.doing.blog.model.UserExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int countByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int deleteByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int deleteByPrimaryKey(Long uId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int insert(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int insertSelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    List<User> selectByExample(UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    User selectByPrimaryKey(Long uId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int updateByPrimaryKeySelective(User record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table blog_user
     *
     * @mbggenerated Tue Aug 23 21:42:21 CST 2016
     */
    int updateByPrimaryKey(User record);

    /**
     * 根据登陆名查找相关用户记录
     * @param loginName
     * @return
     */
    User selectByLoginName(String loginName);

    /**
     * 用户登陆
     * @param user
     * @return
     */
    User login(User user);

    /**
     *  计算所有用户的记录数
     * @param getPageBean 封装了排序字段。排序方式，查询值，分页值，分页页数
     * @return 管理员集的条数
     */
    public int countAll(Map<String,Object> getPageBean);

    /**
     * 查询所有的用户
     * @param getPageBean 封装了排序字段。排序方式，查询值，分页值，分页页数
     * @return 查询后的管理员集
     */
    public List<User> selectAllUser(Map<String,Object> getPageBean);
}