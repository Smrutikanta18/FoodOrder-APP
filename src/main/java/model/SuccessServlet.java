package model;

        import db.Database;
        import jakarta.servlet.ServletException;
        import jakarta.servlet.annotation.WebServlet;
        import jakarta.servlet.http.HttpServlet;
        import jakarta.servlet.http.HttpServletRequest;
        import jakarta.servlet.http.HttpServletResponse;

        import java.io.IOException;
        import java.sql.Connection;
        import java.sql.PreparedStatement;

@WebServlet("/successservlet")
public class SuccessServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        String userEmail = request.getParameter("userEmail");

        try {
            Connection conn = Database.getCon();
            String sql = "UPDATE `order` SET status = 'success' WHERE oid = ? and uemail = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(orderId));
            stmt.setString(2,userEmail);

            int updatedRows = stmt.executeUpdate();

            if (updatedRows > 0) {
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

}

