<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Homepage</title>
<link rel=”stylesheet” href=”https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css”>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    background: #f2f2f2;  
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}  
.search {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
  width: 100%;
  
  border: 3px solid#58D68D  ;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color:#58D68D  ;
}

.searchTerm:focus{
  color: #00B4CC;
}

.searchButton {
  width: 40px;
  height: 36px;
  border: 1px solid #58D68D ;
  background:#58D68D  ;
  opacity: 0.5;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 30%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
img {
  opacity: 0.6;
}

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
}
.img1 {
opacity: 0.6;
z-index:-1;
}
</style>
</head>
<body style="background-image: url('bck.jpg'); background-repeat: no-repeat;background-attachment: fixed;background-size: 100%;">
   

<div class="topnav" style="color: white;" >
  <a class="active" href="index.jsp" >Home</a>
  <a href="login.jsp">Login</a>
  <a href="book_package.jsp">Book Package</a>
  <a href="about.html">About Us</a>
</div>
<div class="wrap">
    <form action="package_info.jsp" method="get">
    <div class="search">
       <input type="text" class="searchTerm" name="package" placeholder="Enter your package id">
       <button type="submit" class="searchButton" style="background-image:url('search.png'); background-position: center; background-repeat: no-repeat;background-size: 130%;">
         <i class="fa fa-search"></i>
      </button>
    </div>
         </form>
 </div>


</body>
</html>
