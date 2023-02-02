<%-- 
    Document   : package
    Created on : 26 May, 2021, 10:49:50 PM
    Author     : Sarfraz Ahmad
--%>

<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package</title>
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <style>
    textarea  
    {  
   font-family:"Times New Roman", Times, serif;  
   font-size: 20px;   
    }
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 16px;
      color: #eee;
      }
      body {
      background: url("/uploads/media/default/0001/01/b5edc1bad4dc8c20291c8394527cb2c5b43ee13c.jpeg") no-repeat center;
      background-size: cover;
      }
      h1, h2 {
      text-transform: uppercase;
      font-weight: 400;
      }
      h2 {
      margin: 0 0 0 8px;
      }
     .main-block {
      display: flex;
      flex-direction:column;
      justify-content:center;
      align-items: center;
      height:100%;
      padding:25px;
      background: rgba(0, 0, 0, 0.5); 
      }
      .left-part, form {
      padding: 25px;
      }
      .left-part {
      text-align: center;
      }
      .fa-graduation-cap {
      font-size: 72px;
      }
      form {
      background: rgba(0, 0, 0, 0.7); 
      }
      .title {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
      }
      .info {
      display: flex;
      flex-direction: column;
      }
      input, select {
      padding: 5px;
      margin-bottom: 30px;
      background: transparent;
      border: none;
      border-bottom: 1px solid #eee;
      }
      input::placeholder {
      color: #eee;
      }
      option:focus {
      border: none;
      }
      option {
      background: black; 
      border: none;
      }
      .checkbox input {
      margin: 0 10px 0 0;
      vertical-align: middle;
      }
      .checkbox a {
      color: #26a9e0;
      }
      .checkbox a:hover {
      color: #85d6de;
      }
      .btn-item, button {
      padding: 10px 5px;
      margin-top: 20px;
      border-radius: 5px; 
      border: none;
      background: #26a9e0; 
      text-decoration: none;
      font-size: 15px;
      font-weight: 400;
      color: #fff;
      }
      .btn-item {
      display: inline-block;
      margin: 20px 5px 0;
      }
      button {
      width: 100%;
      }
      button:hover, .btn-item:hover {
      background: #85d6de;
      }
      @media (min-width: 568px) {
      html, body {
      height: 100%;
      }
      .main-block {
      flex-direction: row;
      height: calc(100% - 50px);
      }
      .left-part, form {
      flex: 1;
      height: auto;
      }
      }
    </style>
  </head>
  <body style="background-image: url('bck2.jpg');">
    <div class="main-block">
      <div class="left-part">        
      </div>
      <form action="package.jsp" method="get">
        <div class="title">
          <i class="fas fa-pencil-alt"></i> 
          <h2>Enter package ID:  </h2><br><br><br><br>
        </div>

        <div class="info">
          <input class="fname" type="text" name="track" placeholder="Enter Package ID">
          <button type="submit" style="width:100px; height:40px;">Submit</button><br><br><br>
         <%
             session=request.getSession();
           session.setAttribute("user",session.getAttribute("user"));
           String user=session.getAttribute("user").toString();
           String pkg=request.getParameter("track");
           SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
           Timestamp timestamp = new Timestamp(System.currentTimeMillis());
           if(pkg!=null)
           {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/user?zeroDateTimeBehavior=convertToNull","root","");
           Statement st=con.createStatement();
           Statement st2=con.createStatement();
           try
           {
           ResultSet rs=st.executeQuery("select * from package where Pkg_ID='"+pkg+"';");
           rs.next();
           String dest=rs.getString("Destination").toLowerCase();
           String src=rs.getString("Pickup").toUpperCase();
           int frag=rs.getInt("Fragile");
           ResultSet rs2=st2.executeQuery("select * from tracking where pkg_ID='"+pkg+"' and Location='"+user+"'");
            if(dest.equals(user))
            {
                st.execute("delete from tracking where pkg_ID='"+pkg+"'");
                st.execute("update package set Status='Delivered',time='"+sdf.format(timestamp).toString()+"' where Pkg_ID='"+pkg+"'");
                out.print("<p>Package Reached its destination<br>Changing Status to delivered...</p><br>");
            }
            else if(rs2.absolute(1))
            {
                out.print("<p>Package already Scanned at this location</p><br>");
            }
            else
                st.execute("insert into tracking values('"+pkg+"','"+user+"')");
           out.print("<p style=\" font-family:Roboto, Arial, sans-serif; font-size:medium;\">Source:"+src+"</p><br><br>");
           out.print("<p style=\" font-family:Roboto, Arial, sans-serif; font-size:medium;\">Destination:"+dest.toUpperCase()+"</p><br><br>");
           if(frag==1)
               out.print("<p>Package is Fragile<br>Handle with care</p>");
           }
           catch(Exception e)
                   {
                   out.print("<p>Wrong package number entered</p>" );
                   }
           }
             %> 
        </div>
      </form>
    </div>
  </body>
</html>
