package com.doing.blog.controller;

import com.doing.blog.model.BlogAdmin;
import com.doing.blog.service.BlogAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/blogAdmin")
public class BlogAdminController {

    @Autowired
    private BlogAdminService blogAdminService;

    @RequestMapping("/selectAdmin")
    public ModelAndView selectAdmin() throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        //调用service方法得到管理员列表
        List<BlogAdmin> blogAdmins = blogAdminService.selectAdmin();
        //将得到的管理员列表内容添加到ModelAndView中
        modelAndView.addObject("blogAdmins", blogAdmins);
        //设置响应的视图页面
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("testAction")
    public String testAction(){
        return "error/404";
//        return "error/500";
    }

}
