package com.xu.config;

import com.xu.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User info = (User) request.getSession().getAttribute("userLoginInfo");
        if(info != null && info.getAuthorization() == 0 && request.getRequestURI().contains("client"))
            return true;

        if(info != null && info.getAuthorization() == 1 && !request.getRequestURI().contains("client"))
            return true;

        if(request.getRequestURI().contains("goLogin") || request.getRequestURI().contains("login") || request.getRequestURI().contains("goSignup") || request.getRequestURI().contains("signup") || request.getRequestURI().contains("logout"))
            return true;

        if(request.getRequestURI().contains("validation"))
            return true;

        String link = "goLogin";
        if(info != null && info.getAuthorization() == 0)
            link = "clientOrder";
        else if(info != null && info.getAuthorization() == 1)
            link = "allUser";
        response.sendRedirect(link);
        return false;
    }
}
