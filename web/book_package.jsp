<%-- 
    Document   : book_package
    Created on : 26 May, 2021, 9:04:33 PM
    Author     : Sarfraz Ahmad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Package booking</title>
        <script>   
          function tocalculate() 
           {
             var weight=document.getElementById("weight").value;
              var pr = weight*100;
              parent._alert = new parent.Function("alert(arguments[0]);");
            parent._alert('The price of your package is '+pr + "\nIf you want to continue click OK and proceed for payment !!");
           }
           
           var Msg ='<%=request.getAttribute("message")%>';
    if (Msg != "null") {
 function alertName(){
 alert(Msg);
 } 
 }
        </script>
        <script type="text/javascript"> window.onload = alertName; </script>
        <style>
.topnav {
  overflow: hidden;
  background-color: #333;
  opacity: 0.8;
}

.topnav a {
  float: left;
  color: rgb(255, 255, 255);
  text-align: center;

  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #FFFF;
  color: black;
}

.topnav a.active {
  background-color: #58D68D ;
  color: white;
}</style>
</head>
<div class="topnav" style="color: white;" >
  <a href="index.jsp" >Home</a>
  <a href="login.jsp">Login</a>
  <a class="active" href="book_package.jsp">Book Package</a>
  <a href="about.html">About Us</a>
</div>
<body style="background-color:#000000;">

    <link rel="stylesheet" type="text/css" href="sign.css">
    
<div id="login-box" style="background-color:white;">
    <form action="book_package" method="get">
  <div class="left">
    <h1>Details</h1>
    <input type="text" name="pickup" placeholder="Pickup address" />
    <input type="text" name="phn1" placeholder="Pickup contact" />
    <input type="text" name="deladdr" placeholder="Delivery address" />
    <input type="text" name="phn2" placeholder="Delivery contact" />
    <input type="text" name="weight" id="weight" placeholder="Weight of package" />
    <input type="radio" name="fragile" value="fragile"> Fragile <br>
    <input type="radio" style="display:none;" name="fragile" value="not-fragile" checked >
    <input type="button" onclick="tocalculate()" name="price" value="Calculate Amt."/>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <input style="position: absolute;" type="submit" value="Pay" />
  </div>
        </form>

  <div class="right">
  
  </div>
      
</div>
  <html>  
    <head>
        
     </head>
     <body>
     </body>
  </html>

</body>
</html>
