package com.doing.blog.controller;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.been.PageBean;
import com.doing.blog.model.Admin;
import com.doing.blog.model.Article;
import com.doing.blog.model.UserComment;
import com.doing.blog.service.AdminService;
import com.doing.blog.service.ArticleService;
import com.doing.blog.service.UserCommentService;
import com.doing.blog.util.CommonDateParseUtil;
import com.doing.blog.util.Encrypt;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
import java.util.Map;

/**
 * 管理员控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/admin")
public class AdminController extends BaseController<Admin, Long> {

    @Autowired
    private AdminService adminService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserCommentService userCommentService;

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

            adminService.updateByPrimaryKeySelective(admin);
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
            adminService.updateByPrimaryKeySelective(admin);     //然后重新保存进数据库
            return successResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return failResult;
    }

    /**
     * 发表博客页面
     * @return
     */
    @RequestMapping("/article")
    public String article(){
        return TEMPLATE_PATH + "article";
    }

    /**
     * 发表博客文章
     * @param article
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/addArticle")
    public String addArticle(Article article, RedirectAttributes redirectAttributes){
        try {
            articleService.insertArticle(article);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "发表文章成功"));
            return REDIRECT_URL + "list";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "发表失败，请重新发表"));
            return REDIRECT_URL + "article";
        }
    }

    /**
     * 跳转到查看博文管理页面
     * @return
     */
    @RequestMapping("/showArticle")
    public String showArticle(){
        return TEMPLATE_PATH + "showArticle";
    }


    @RequestMapping(value="/articleShow/{articleId}")
    public String articleShow(@PathVariable Long articleId, Model model,
                              @RequestParam(required=true,defaultValue="1") Integer page,
                              @RequestParam(required=false,defaultValue="10") Integer pageSize ){
        PageHelper.startPage(page, pageSize);
        try {
            //要想PageHelper插件能使用，则要分页的数据的查询数据语句必须放在最上面，否则会出错
            List<UserComment> userCommentList = userCommentService.selectUsercommentUserByArticleId(articleId); //根据博客文章的id查询相关的用户评论
            Article article = articleService.selectArticleAdminUsercommentUserById(articleId);
            PageInfo<UserComment> p = new PageInfo<UserComment>(userCommentList);
            model.addAttribute("page", p);
            model.addAttribute("userCommentList", userCommentList);
            model.addAttribute("article", article);
            return TEMPLATE_PATH + "articleShow";
        } catch (Exception e) {
            e.printStackTrace();
            return TEMPLATE_PATH + "showArticle";
        }
    }

    /**
     * 删除博客文章
     * @param articleId
     * @return
     */
    @RequestMapping(value="/deleteArticle/{articleId}")
    @ResponseBody
    public AjaxResult deleteArticle(@PathVariable Long articleId){
        try {
            articleService.deleteByPrimaryKey(articleId);
            return successResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return failResult;
    }

    /**
     * 异步获取dataTable来展示所有博文
     * @param searchText
     * @param sEcho
     * @param pageBean
     * @return
     */
    @RequestMapping("/dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        return adminService.dataTable(searchText, sEcho, pageBean);
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
