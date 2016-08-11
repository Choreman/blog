package com.doing.blog.controller;

import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 管理员控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController<Admin, Long> {

    @Autowired
    private AdminService adminService;



}
