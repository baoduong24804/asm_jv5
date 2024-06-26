package com.main.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.main.model.NguoiDung;
import com.main.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class MemberInterceptor implements HandlerInterceptor {
    @Autowired
    SessionService session;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        NguoiDung user = (NguoiDung) session.get("user"); // lấy từ session
        String error = "";
        if (user == null) { // chưa đăng nhập
            error = "Vui lòng đăng nhập";
        }
        
        //System.out.println(uri);
        if (error.length() > 0 && !uri.equals("/animu/login")) { // có lỗi và không ở trang login
            session.set("error", error);
            session.set("security-uri", uri);
            response.sendRedirect("/animu/login");
            return false;
        }

        return true;
    }
}
