package com.doing.blog.controller;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.util.JsonMapper;
import com.doing.blog.util.Reflections;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/8/11.
 * 基本的抽象的controller，封装了url、path、ajax返回结果、以及json返回结果
 * 其他的controller继承这个controller
 */
public abstract class BaseController<T, ID extends Serializable> {

    protected Class<T> entityClass = Reflections.getClassGenricType(getClass());    //获取泛型
    protected String className = entityClass.getName().substring(entityClass.getName().lastIndexOf(".") + 1);
    protected String TEMPLATE_NAME = className.substring(0, 1).toLowerCase() + className.substring(1);  //类名

    protected String dir = "/WEB-INF/";     //后台的jsp目录，因为所有的文件直接放在WEB-INF下，所以直接用WEB-INF
    protected String TEMPLATE_PATH = dir + TEMPLATE_NAME + "/";     //每个模块的页面地址
    protected String REDIRECT_URL = "redirect:/" + TEMPLATE_NAME + "/";     //重定向的地址

    protected static JsonMapper jsonMapper = JsonMapper.nonNullMapper();    //json工具
    protected static AjaxResult ajaxResult = new AjaxResult();      //把json封装进这里

    protected final static AjaxResult failResult = new AjaxResult(false, "操作失败！");
    protected final static AjaxResult successResult = new AjaxResult(true, "操作成功！");

    protected final static String RESULT_SUCCESS;
    protected final static String RESULT_fail;

    static{
        RESULT_SUCCESS = jsonMapper.toJson(successResult);      //java对象转换成json对象
        RESULT_fail = jsonMapper.toJson(failResult);      //java对象转换成json对象
    }

}
