<%-- 
    Document   : package_info
    Created on : 28 May, 2021, 12:15:24 AM
    Author     : Sarfraz Ahmad
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package Info</title>
    </head>
    <body style="background-color:#323232; background-image:url('bck.jpg'); background-repeat: no-repeat; background-size: 100%;">
    <link rel="stylesheet" type="text/css" href="sign.css">
<div id="login-box">
  <form action="#" method="GET">
  <div class="left">
    <h1 style="font-size: large; color:#03989e; text-shadow:0.8px 0.8px #cccccc; ">Package update info !!</h1>
    <br>
    <%
        session=request.getSession();
        String pkg=request.getParameter("package");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?zeroDateTimeBehavior=convertToNull","root","");
        Statement st=con.createStatement();
        Statement st2=con.createStatement();
        try
        {
        ResultSet rs=st.executeQuery("select Pickup,Destination,Status,time from package where Pkg_ID='"+pkg+"'");
        rs.next();
        if(rs.getString("Status").equals("Delivered"))
        {
            out.print("<p>Package ID: "+pkg+"</p>");
            out.print("<p>Package already delivered</p>");
            out.print("Delivery Time:"+rs.getString("time"));
        }
        else
        {
        ResultSet rs2=st2.executeQuery("select * from tracking where pkg_ID='"+pkg+"'");
        rs2.last();
        String cur=rs2.getString("Location").toUpperCase();
        out.print("<p>Package ID: "+pkg+"</p>");
        out.print("<p>Source: "+rs.getString("Pickup").toUpperCase()+"</p>");
        out.print("<p>Destination: "+rs.getString("Destination").toUpperCase()+"</p>");
        out.print("<p>Current Location: "+cur+"</p>");
        out.print("<p>Package Status: "+rs.getString("Status")+"</p>");
        }
        }catch(Exception e)
        {
            if(e.toString().equals("java.sql.SQLException: Illegal operation on empty result set."))
                out.print("<p>No Package Found<p>");
        }
    %>    
  </div> 
  <div class="right" style="background-image:url('logo2.png');">
  
</div>
</div>
</body>
</html>
