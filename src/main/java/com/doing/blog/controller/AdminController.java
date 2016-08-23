package com.doing.blog.controller;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import com.doing.blog.util.CommonDateParseUtil;
import com.doing.blog.util.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 管理员控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController<Admin, Long> {

    @Autowired
    private AdminService adminService;

    /**
     * 后台管理员页面
     * @return
     */
    @RequestMapping("/list")
    public String list(){
        return TEMPLATE_PATH + "list";
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
                return REDIRECT_URL + "list";    //通过访问controller的list方法进入后台管理页
            }else{      //如果输入的用户名和密码不存在
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return REDIRECT_URL + "loginUI";        //返回到登陆页重新登陆
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "出现错误"));
            return REDIRECT_URL + "loginUI";
        }
    }

    /**
     * 管理员退出
     * @param session
     * @return
     */
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("loginAdmin");
        return REDIRECT_URL + "loginUI";
    }

    /**
     * 查看管理员个人信息
     * @param aId
     * @param model
     * @return
     */
    @RequestMapping(value="/show/{aId}")
    public String show(@PathVariable String aId, Model model){
        try {
            Admin admin = adminService.selectByPrimaryKey(aId);
            model.addAttribute("admin", admin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return TEMPLATE_PATH + "show";
    }

    /**
     * 跳转到修改管理员信息页面
     * @param aId
     * @param model
     * @return
     */
    @RequestMapping(value="/saveUI/{aId}")
    public String saveUI(@PathVariable String aId, Model model){
        try {
            Admin admin = adminService.selectByPrimaryKey(aId);
            model.addAttribute("admin", admin);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return TEMPLATE_PATH + "saveUI";
    }

    /**
     * 修改管理员信息
     * @param admin
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="/updateUI", method=RequestMethod.POST)
    public String updateUI(Admin admin, String birthday_time, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            if(birthday_time != null){  //判断从前台传过来的生日是否为空，若为空则不修改
                //此处意思是，从前台传字符串类型的“生日”过来，在此处进行 String-->Date 类型转换，进行保存进数据库
                //局限于现在的技术，只能采取如此办法进行保存
                Date birthday = CommonDateParseUtil.string2date(birthday_time, "yyyy-MM-dd HH:mm:ss");
                admin.setBirthday(birthday);
            }

            adminService.updateByPrimaryKey(admin);
            session.setAttribute("loginAdmin", admin);  //修改管理员信息后，把新的信息保存进session中
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "保存修改成功"));
            return REDIRECT_URL + "show/" + admin.getaId();
        } catch (Exception e) {
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "修改失败，请重新修改"));
        return REDIRECT_URL + "show/" + admin.getaId();
    }

    @RequestMapping(value="/updatePassword/{aId}")
    @ResponseBody
    public AjaxResult updatePassword(@PathVariable String aId, String password, RedirectAttributes redirectAttributes){
        try {
            Admin admin = adminService.selectByPrimaryKey(aId);     //根据id查出对应的记录
            admin.setPassword(Encrypt.e(password));        //再修改其密码
            adminService.updateByPrimaryKey(admin);     //然后重新保存进数据库
            return successResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return failResult;
    }


    /**
     * 跳转到测试页面的映射
     * @return
     */
    @RequestMapping("/test")
    public String test(){
        return TEMPLATE_PATH + "test";
    }

}
