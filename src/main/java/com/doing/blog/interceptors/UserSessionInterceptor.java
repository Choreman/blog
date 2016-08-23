package com.doing.blog.interceptors;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.model.User;
import com.doing.blog.model.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 用户session拦截器
 */
public class UserSessionInterceptor implements HandlerInterceptor{

    private List<String> excludeUrls;

    public List<String> getExcludeUrls() {
        return excludeUrls;
    }

    public void setExcludeUrls(List<String> excludeUrls) {
        this.excludeUrls = excludeUrls;
    }

    /**
     * 在调用controller具体方法前拦截
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        if (excludeUrls.contains(url)) {
            System.out.println("通过了用户session拦截器");
            return true;
        } else {
            User loginUser = (User) request.getSession().getAttribute("loginUser");
            if (loginUser != null && loginUser.getuId()!= null && !loginUser.getuId().equals("")) {
                return true;
            } else {
                System.out.println("未通过用户session拦截器");
                request.setAttribute("result", new AjaxResult(false, "您还没有登录或登录已超时，请重新登录"));
                request.getRequestDispatcher("/WEB-INF/user/loginUI.jsp").forward(request, response);
                return false;
            }
        }
    }

    /**
     * 在调用controller具体方法后拦截
     */
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 完成页面render后调用
     */
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
