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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
@WebServlet(urlPatterns = {"/book_package"})
public class book_package extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
            HttpSession session = request.getSession();
            String pick_add=request.getParameter("pickup").toLowerCase();
            String ph1=request.getParameter("phn1");
            String del_add=request.getParameter("deladdr").toLowerCase();
            String ph2=request.getParameter("phn2");
            String wajan=request.getParameter("weight");
            String frag=request.getParameter("fragile");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            if(pick_add.equals("")||ph1.equals("")||del_add.equals("")||ph2.equals("")||wajan.equals(""))
            {
                request.setAttribute("message", "Critical details missing please fill all the details");
                RequestDispatcher dispatcher = request.getRequestDispatcher("book_package.jsp");
                dispatcher.forward(request, response);
            }
            else
            {
            int frag_int;
            if(frag.equals("fragile"))
                frag_int=1;
            else
                frag_int=0;
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?zeroDateTimeBehavior=convertToNull","root","");
            Statement st=con.createStatement();
            Statement st2=con.createStatement();
            out.print("first");
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            st.execute("insert into package values('','"+pick_add+"','"+ph1+"','"+del_add+"','"+ph2+"','"+wajan+"',"+frag_int+",'in-transit','"+sdf.format(timestamp).toString()+"');");
            out.print("Secount");
            ResultSet rs=st2.executeQuery("select * from package where time='"+sdf.format(timestamp).toString()+"';");
            out.print("third");
            rs.next();
            session.setAttribute("pkgid",rs.getString("Pkg_ID"));
            response.sendRedirect("success.jsp");
            }
            }catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(book_package.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
