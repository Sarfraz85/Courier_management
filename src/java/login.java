/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sarfraz Ahmad
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try
           {
            HttpSession session = request.getSession();
            session.setAttribute("user",request.getParameter("user"));
            String user=request.getParameter("user");
            String pass=request.getParameter("pass");
            
            Class.forName("com.mysql.jdbc.Driver");
            out.print("<h1> Connection attempt</h1>");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?zeroDateTimeBehavior=convertToNull","root","");
            Statement st=con.createStatement();
            out.print("<h1> Done connection</h1>");
            ResultSet rs=st.executeQuery("select * from sign_up");
            out.print("<h1> Done fetch</h1>");
            int flag=0;
            while(rs.next())
            {
            if(user.equals(rs.getString("Location_ID")) && pass.equals(rs.getString("Password")))
            {
                flag=1;
                response.sendRedirect("package.jsp");
                //out.print("<h1> Login done</h1>");
            }
            }
            if(flag==0)
            {
                request.setAttribute("message", "Wrong Username or password");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
                
            }
           } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
