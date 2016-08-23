package com.doing.blog.interceptors;

import com.doing.blog.been.AjaxResult;
import com.doing.blog.model.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 管理员session拦截器
 */
public class AdminSessionInterceptor implements HandlerInterceptor {


	private List<String> excludeUrls;

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

    /**
	 * 完成页面的render后调用
	 */
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception exception) throws Exception {

	}

	/**
	 * 在调用controller具体方法后拦截
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView) throws Exception {

	}

    /**
     * 在调用controller具体方法前拦截
     */
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String requestUri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url = requestUri.substring(contextPath.length());
        if (excludeUrls.contains(url)) {
            System.out.println("通过了管理员session拦截器");
            return true;
        } else {
            Admin loginAdmin = (Admin) request.getSession().getAttribute("loginAdmin");
            if (loginAdmin != null && loginAdmin.getaId()!= null && !loginAdmin.getaId().equals("")) {
                return true;
            } else {
                System.out.println("未通过管理员session拦截器");
                request.setAttribute("result", new AjaxResult(false, "您还没有登录或登录已超时，请重新登录"));
                request.getRequestDispatcher("/WEB-INF/admin/loginUI.jsp").forward(request, response);
                return false;
            }
        }
    }

}
