<%-- 
    Document   : success
    Created on : 27 May, 2021, 10:28:22 PM
    Author     : Sarfraz Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
<body style="background-color:#323232; background-image:url('bck.jpg'); background-repeat: no-repeat; background-size: 100%;">
    <link rel="stylesheet" type="text/css" href="sign.css">
<div id="login-box">
  <form action="#" method="GET">
  <div class="left">

    <br>
   <p> PAYMENT SUCCESSFUL !</p>
    <p>Package ID is:: 
        <%
            session=request.getSession();
            String s=session.getAttribute("pkgid").toString();
            out.print(s);
            %>
    </p>
        <p>Please note the above package Id for any further assistance !!</p>   
  </div> 
  <div class="right" style="background-image:url('tick.png');">
  
</div>
</div>
</body>
</html>
