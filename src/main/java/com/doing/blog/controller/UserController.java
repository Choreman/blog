package com.doing.blog.controller;

import com.alibaba.fastjson.JSON;
import com.doing.blog.been.AjaxResult;
import com.doing.blog.been.HeadPortraitResult;
import com.doing.blog.model.Article;
import com.doing.blog.model.User;
import com.doing.blog.model.UserComment;
import com.doing.blog.service.ArticleService;
import com.doing.blog.service.UserCommentService;
import com.doing.blog.service.UserService;
import com.doing.blog.util.CommonDateParseUtil;
import com.doing.blog.util.HeadPortraitUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 用户控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController<User, Long>{

    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserCommentService userCommentService;

    /**
     * 获取首页数据
     * @param mv
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping(value="/index", method=RequestMethod.GET)
    public ModelAndView index(ModelAndView mv, @RequestParam(required=true,defaultValue="1") Integer page,
                              @RequestParam(required=false,defaultValue="10") Integer pageSize ){
        PageHelper.startPage(page, pageSize);   //调用分页方法，默认为一页显示10条
        try {
            List<Article> articleList = articleService.selectAll();  //查询所有的博客文章
            PageInfo<Article> p = new PageInfo<Article>(articleList);   //页面信息
            for(Article article : articleList){
                String content = article.getContent();
                if(content.length() > 200){
                    String str = content.substring(0, 200);
                    content = str + "...";
                    article.setContent(content);
                }
            }
            mv.addObject("articleList", articleList);
            mv.addObject("page", p);
            mv.setViewName("index");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mv;
    }

    /**
     * 跳转到用户注册页面
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return TEMPLATE_PATH + "register";
    }


    /**
     * 添加用户信息到数据库
     * @param user
     * @param birthday_time
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/insertUser")
    public String insertUser(User user, String birthday_time, RedirectAttributes redirectAttributes){
        try {
            if(birthday_time != null){  //判断从前台传过来的生日是否为空，若为空则不修改
                //此处意思是，从前台传字符串类型的“生日”过来，在此处进行 String-->Date 类型转换，进行保存进数据库
                //局限于现在的技术，只能采取如此办法进行保存
                Date birthday = CommonDateParseUtil.string2date(birthday_time, "yyyy-MM-dd HH:mm:ss");
                user.setBirthday(birthday);
            }
            userService.insertUser(user);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "注册成功"));
            return REDIRECT_URL + "loginUI";
        } catch (Exception e) {
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "注册失败，请重新注册"));
        return REDIRECT_URL + "register";
    }

    /**
     * 访问用户登陆页面
     * @return
     */
    @RequestMapping("/loginUI")
    public String loginUI(){
        return TEMPLATE_PATH + "loginUI";
    }

    /**
     * 用户登陆
     * @param user
     * @param session
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="/login", method= RequestMethod.POST)
    public String login(User user, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            User loginUser = userService.login(user);
            if(loginUser != null){      //如果输入的用户名和密码存在
                session.setAttribute("loginUser", loginUser);     //把登陆的用户存进session
                return REDIRECT_URL + "index";
            }else{      //如果输入的用户名和密码不存在
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return REDIRECT_URL + "loginUI";        //返回到登陆页重新登陆
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "出现错误"));
            return REDIRECT_URL + "loginUI";    //返回到登陆页重新登陆
        }
    }

    /**
     * 用户退出
     * @param session
     * @return
     */
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("loginUser");
        return REDIRECT_URL + "index";
    }

    @RequestMapping(value="/show/{uId}")
    public String show(@PathVariable Long uId, Model model){
        try {
            User user = userService.selectByPrimaryKey(uId);
            String headPortraitPath = HeadPortraitUtil.avatarName(user.getHeadPortrait());
            model.addAttribute("user", user);
            model.addAttribute("headPortraitPath", headPortraitPath);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return TEMPLATE_PATH + "show";
    }

    /**
     * 修改用户信息
     * @param user
     * @param birthday_time
     * @param session
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="/updateUI", method=RequestMethod.POST)
    public String updateUI(User user, String birthday_time, HttpSession session, RedirectAttributes redirectAttributes){
        try {
            if(birthday_time != null){  //判断从前台传过来的生日是否为空，若为空则不修改
                //此处意思是，从前台传字符串类型的“生日”过来，在此处进行 String-->Date 类型转换，进行保存进数据库
                //局限于现在的技术，只能采取如此办法进行保存
                Date birthday = CommonDateParseUtil.string2date(birthday_time, "yyyy-MM-dd HH:mm:ss");
                user.setBirthday(birthday);
            }
            userService.updateByPrimaryKeySelective(user);      //修改用户信息
            User loginUser = userService.selectByPrimaryKey(user.getuId()); //确保存进session中的为最新数据
            session.setAttribute("loginUser", loginUser);  //修改用户信息后，把新的信息保存进session中
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "保存修改成功"));
            return REDIRECT_URL + "show/" + user.getuId();
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "修改失败，请重新修改"));
            return REDIRECT_URL + "show/" + user.getuId();
        }
    }

    /**
     * 修改用户密码
     * @param uId
     * @param password
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value="/updatePassword/{uId}")
    @ResponseBody
    public AjaxResult updatePassword(@PathVariable Long uId, String password, RedirectAttributes redirectAttributes){
        try {
            User user = userService.selectByPrimaryKey(uId);     //根据id查出对应的记录
            user.setPassword(password);        //再修改其密码
            userService.updateByPrimaryKeySelective(user);     //然后重新保存进数据库
            return successResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return failResult;
    }

    /**
     * 展示博客文章详细信息包括评论信息
     * @param mv
     * @param articleId
     * @param redirectAttributes
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping("/articleShow")
    public ModelAndView articleShow(ModelAndView mv, @RequestParam(required = true) Long articleId, RedirectAttributes redirectAttributes,
                              @RequestParam(required=true,defaultValue="1") Integer page,
                              @RequestParam(required=false,defaultValue="10") Integer pageSize ){
        PageHelper.startPage(page, pageSize);
        try {
            //要想PageHelper插件能使用，则要分页的数据的查询数据语句必须放在最上面，否则会出错
            List<UserComment> userCommentList = userCommentService.selectUsercommentUserByArticleId(articleId); //根据博客文章的id查询相关的用户评论
            Article article = articleService.selectArticleAdminUsercommentUserById(articleId);
            PageInfo<UserComment> p = new PageInfo<UserComment>(userCommentList);
            mv.addObject("userCommentList", userCommentList);
            mv.addObject("page", p);
            mv.addObject("article", article);
            mv.setViewName(TEMPLATE_PATH + "articleShow");
            return mv;
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "查看失败，请重新查看"));
            mv.setViewName(REDIRECT_URL + "index");
            return mv;
        }
    }

    /**
     * 插入用户评论
     * @param session
     * @param content
     * @param articleId
     * @return
     */
    @RequestMapping("/insertUsercomment")
    @ResponseBody
    public AjaxResult insertUsercomment(HttpSession session, String content, Long articleId){
        try {
            boolean flag = userService.isLogin(session);    //判断用户是否登陆
            if(flag){
                User loginUser = (User) session.getAttribute("loginUser");  //获取session中的loginUser
                UserComment userComment = new UserComment();
                userComment.setContent(content);
                userComment.setArticleId(articleId);
                userComment.setUserId(loginUser.getuId());  //把loginUser的id设置进去
                userCommentService.insertUsercomment(userComment);
                return successResult;   //此处返回了AjaxResult类型数据，不知道前台应如何接受显示，为一个bug
            }else {
                return failResult;   //此处返回了AjaxResult类型数据，不知道前台应如何接受显示，为一个bug
            }
        } catch (Exception e) {
            e.printStackTrace();
            return failResult;   //此处返回了AjaxResult类型数据，不知道前台应如何接受显示，为一个bug
        }
    }

    /**
     * 查询数据库中是否有相同登陆名的记录，用于登陆时的异步查询
     * @param loginName
     * @param response
     */
    @RequestMapping("/checkLoginName")
    public void checkLoginName(String loginName, HttpServletResponse response){
        try {
            User user = userService.selectByLoginName(loginName);       //根据用户名到数据库查找记录
            if(user != null){       //如果查找的记录不为空
                response.getWriter().print(true);       //查找到有相关记录返回true，允许登陆
            }else{
                response.getWriter().print(false);      //查找不到有相关记录，返回false，不允许登陆
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询数据库中是否有相同登陆名的记录，用于注册时的异步查询
     * @param loginName
     * @param response
     */
    @RequestMapping("/selectByLoginName")
    public void selectByLoginName(String loginName, HttpServletResponse response){
        try {
            User user = userService.selectByLoginName(loginName);   //根据用户名到数据库查找记录
            if(user != null){       //如果查找的记录不为空
                response.getWriter().print(false);      //查找到有相关记录返回false，不允许注册
            }else{
                response.getWriter().print(true);       //查找不到有相关记录，则返回true，允许注册
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 跳转到修改头像页面
     * @return
     */
    @RequestMapping("/head_portrait")
    public String headPortrait(){
        return TEMPLATE_PATH + "head_portrait";
    }


    /**
     * 上传头像
     * @param session
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/headPortraitResult")
    @ResponseBody
    public HeadPortraitResult headPortraitResult(HttpSession session, HttpServletRequest request) throws Exception {
        HeadPortraitResult headPortraitResult = HeadPortraitUtil.uploadHeadPortrait(request);//上传头像
        User user = (User)session.getAttribute("loginUser");
        user.setHeadPortrait(headPortraitResult.fileName);  //把上传的头像的名称fileName保存进相应用户里
        userService.updateByPrimaryKeySelective(user);      //提交修改
        return headPortraitResult;
    }
}
