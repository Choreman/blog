package com.doing.blog.controller;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.model.Admin;
import com.doing.blog.service.AdminService;
import com.doing.blog.util.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
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

    /**
     * 管理员退出
     * @param session
     * @return
     */
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("loginAdmin");
        return REDIRECT_URL + "admin/loginUI";
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
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            simpleDateFormat.format(admin.getBirthday());
            admin.setBirthday(null);
            //todo
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
    public String updateUI(Admin admin, RedirectAttributes redirectAttributes){
        try {
            admin.setPassword(Encrypt.e(admin.getPassword()));  //把密码加密
            adminService.updateByPrimaryKey(admin);
            redirectAttributes.addFlashAttribute("msg", RESULT_SUCCESS);
            return REDIRECT_URL + "admin/show/" + admin.getaId();
        } catch (Exception e) {
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_fail);
        return REDIRECT_URL + "admin/list";
    }

}
