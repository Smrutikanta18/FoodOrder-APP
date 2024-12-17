package model;

import db.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/editUserData")
public class EditUserDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        String firstname= request.getParameter("firstName");
        String lastname= request.getParameter("lastName");
        String email=request.getParameter("email");
        String number=request.getParameter("number");
        String gender=request.getParameter("gender");

        try{
            Connection con= Database.getCon();
            String  sql="UPDATE users SET firstname = ?, lastname = ?, email = ?, number = ?, gender = ? WHERE id = ?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,firstname);
            ps.setString(2,lastname);
            ps.setString(3,email);
            ps.setString(4,number);
            ps.setString(5,gender);
            ps.setInt(6,id);
            int result=ps.executeUpdate();

            if(result>0){
                request.getSession().setAttribute("successMessage", "updated successfully!");
            }
            else{
                request.getSession().setAttribute("errorMessage", "Failed to update!");
            }

            response.sendRedirect("editUserProfile.jsp?id="+id);

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
