package model;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//@WebServlet("/userLogout")
//public class LogoutServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        try{
//            if(req.getSession().getAttribute("users")!=null){
//                req.getSession().removeAttribute("users");
//                res.sendRedirect("login.jsp");
//            }else{
//                res.sendRedirect("welcome");
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//    }
//}
@WebServlet("/userLogout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // Get the current session without creating a new one
        if (session != null) {
            session.invalidate();  // Invalidate session on logout
        }
        response.sendRedirect("welcome");
    }
}
