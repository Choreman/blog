package com.doing.blog.model;

import java.util.Date;

public class BlogAdmin {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.u_id
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private String uId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.login_name
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private String loginName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.username
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.password
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private String password;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.create_date
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private Date createDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column blog_admin.phone
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    private String phone;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.u_id
     *
     * @return the value of blog_admin.u_id
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public String getuId() {
        return uId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.u_id
     *
     * @param uId the value for blog_admin.u_id
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setuId(String uId) {
        this.uId = uId == null ? null : uId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.login_name
     *
     * @return the value of blog_admin.login_name
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public String getLoginName() {
        return loginName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.login_name
     *
     * @param loginName the value for blog_admin.login_name
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.username
     *
     * @return the value of blog_admin.username
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.username
     *
     * @param username the value for blog_admin.username
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.password
     *
     * @return the value of blog_admin.password
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.password
     *
     * @param password the value for blog_admin.password
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.create_date
     *
     * @return the value of blog_admin.create_date
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.create_date
     *
     * @param createDate the value for blog_admin.create_date
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column blog_admin.phone
     *
     * @return the value of blog_admin.phone
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public String getPhone() {
        return phone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column blog_admin.phone
     *
     * @param phone the value for blog_admin.phone
     *
     * @mbggenerated Fri Aug 05 13:27:49 CST 2016
     */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}