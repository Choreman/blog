package com.doing.blog.controller;

import com.alibaba.fastjson.JSON;
import com.doing.blog.been.AjaxResult;
import com.doing.blog.been.HeadPortraitResult;
import com.doing.blog.model.User;
import com.doing.blog.service.UserService;
import com.doing.blog.util.CommonDateParseUtil;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

/**
 * 用户控制器，继承基础的控制器
 */
@Controller
@RequestMapping("/admin/user")
public class UserController extends BaseController<User, Long>{

    @Autowired
    private UserService userService;

    /**
     * 跳转到用户注册页面
     * @return
     */
    @RequestMapping("/register")
    public String register(){
        return TEMPLATE_PATH + "register";
    }


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
     * 跳转到测试页面的映射
     * @return
     */
    @RequestMapping("/head_portrait")
    public String test(){
        return TEMPLATE_PATH + "head_portrait";
    }


    @RequestMapping("/headPortraitResult")
    @ResponseBody
    public HeadPortraitResult headPortraitResult(HttpServletRequest request) throws IOException, FileUploadException {
        String contentType = request.getContentType();

        if (contentType.indexOf("multipart/form-data") >= 0) {
            HeadPortraitResult result = new HeadPortraitResult();
            result.avatarUrls = new ArrayList();
            result.success = false;
            result.msg = "Failure!";

            String userid;
            String username;

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            FileItemIterator fileItems = null;
            fileItems = upload.getItemIterator(request);
            //定义一个变量用以储存当前头像的序号
            int avatarNumber = 1;
            //取服务器时间+8位随机码作为部分文件名，确保文件名无重复。
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssS");
            String fileName = simpleDateFormat.format(new Date());
            Random random = new Random();
            String randomCode = "";
            for (int i = 0; i < 8; i++) {
                randomCode += Integer.toString(random.nextInt(36), 36);
            }
            fileName = fileName + randomCode;
            //基于原图的初始化参数
            String initParams = "";
            BufferedInputStream inputStream;
            BufferedOutputStream outputStream;
            //遍历表单域
            while (fileItems.hasNext()) {
                FileItemStream fileItem = fileItems.next();
                String fieldName = fileItem.getFieldName();
                //是否是原始图片 file 域的名称（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）
                Boolean isSourcePic = fieldName.equals("__source");
                //当前头像基于原图的初始化参数（只有上传原图时才会发送该数据，且发送的方式为POST），用于修改头像时保证界面的视图跟保存头像时一致，提升用户体验度。
                //修改头像时设置默认加载的原图url为当前原图url+该参数即可，可直接附加到原图url中储存，不影响图片呈现。
                if (fieldName.equals("__initParams")) {
                    inputStream = new BufferedInputStream(fileItem.openStream());
                    byte[] bytes = new byte[inputStream.available()];
                    inputStream.read(bytes);
                    initParams = new String(bytes, "UTF-8");
                    inputStream.close();
                }
                //如果是原始图片 file 域的名称或者以默认的头像域名称的部分“__avatar”打头(默认的头像域名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names)
                else if (isSourcePic || fieldName.startsWith("__avatar")) {
                    String virtualPath = "/WEB-INF/user/upload/jsp_avatar" + avatarNumber + "_" + fileName + ".jpg";
                    //原始图片（默认的 file 域的名称是__source，可在插件配置参数中自定义。参数名：src_field_name）。
                    if (isSourcePic) {
                        //文件名，如果是本地或网络图片为原始文件名（不含扩展名）、如果是摄像头拍照则为 *FromWebcam
                        //fileName = fileItem.getName();
                        result.sourceUrl = virtualPath = "/WEB-INF/user/upload/jsp_source_" + fileName + ".jpg";
                    }
                    //头像图片（默认的 file 域的名称：__avatar1,2,3...，可在插件配置参数中自定义，参数名：avatar_field_names）。
                    else {
                        result.avatarUrls.add(virtualPath);
                        avatarNumber++;
                    }
                    inputStream = new BufferedInputStream(fileItem.openStream());
                    ServletContext application = request.getSession().getServletContext();
                    outputStream = new BufferedOutputStream(new FileOutputStream(application.getRealPath("/") + virtualPath.replace("/", "\\")));
                    Streams.copy(inputStream, outputStream, true);
                    inputStream.close();
                    outputStream.flush();
                    outputStream.close();
                } else {
                    //注释① upload_url中传递的查询参数，如果定义的method为post请使用下面的代码，否则请删除或注释下面的代码块并使用注释②的代码
                    inputStream = new BufferedInputStream(fileItem.openStream());
                    byte[] bytes = new byte[inputStream.available()];
                    inputStream.read(bytes);
                    inputStream.close();
                    if (fieldName.equals("userid")) {
                        result.userid = new String(bytes, "UTF-8");
                    } else if (fieldName.equals("username")) {
                        result.username = new String(bytes, "UTF-8");
                    }
                }
            }
            //注释② upload_url中传递的查询参数，如果定义的method为get请使用下面注释的代码
            /*
            result.userid = request.getParameter("userid");
            result.username = request.getParameter("username");
            */

            if (result.sourceUrl != null) {
                result.sourceUrl += initParams;
            }
            result.success = true;
            result.msg = "Success!";
            /*
            To Do...可在此处处理储存事项
            */
            //返回图片的保存结果（返回内容为json字符串，可自行构造，该处使用fastjson构造）
            System.out.println(JSON.toJSONString(result));
            return result;
        }
        return null;
    }
}