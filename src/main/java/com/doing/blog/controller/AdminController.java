package com.doing.blog.controller;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 管理员控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController<Admin, Long> {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }

    /**
     * 访问管理员登陆页面
     * @return
     */
    @RequestMapping("/loginUI")
    public String login(){
        return TEMPLATE_PATH + "loginUI";
    }

    /**
     * 管理员登陆
     * @param admin
     * @param session
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="/login", method= RequestMethod.POST)
    public String login(Admin admin, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            Admin loginAdmin = adminService.login(admin);
            if(loginAdmin != null){     //如果输入的用户名和密码存在
                session.setAttribute("loginAdmin", loginAdmin);     //把登陆的用户存进session
                return REDIRECT_URL + "admin/list";    //通过访问controller的list方法进入后台管理页
            }else{      //如果输入的用户名和密码不存在
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return REDIRECT_URL + "admin/loginUI";        //返回到登陆页重新登陆
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "出现错误"));
            return REDIRECT_URL + "admin/loginUI";
        }
    }

}
