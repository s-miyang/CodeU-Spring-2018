<%--



Need to add stuff for our profile page
Currently this is just exactly the same as login.jsp-- need to go through and
change all the things that don't relate to the profile (logging in, etc)
and add the things we do need (changing picture, bio)
See User.java for all the methods to call -Michelle

	- Limit biography to only 180 characters long (changeable in User.java)
	- Need to create a new class to parse the image to store in the picture
	- Grad year is limited to 2018 <= year <= 2024 (changeable in User.java)

	private String bio;
  	private byte[] pic; // pictures can be stored as byte arrays
 	private String school; // name of their school
 	private int gradYear; // year they'll graduate




--%>

<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
 <link rel="stylesheet" href="/css/main.css">
 <style>
   label {
     display: inline-block;
     width: 100px;
   }
 </style>

 <%-- <script language="JavaScript">
    function showInput() {
        document.getElementById("display").innerHTML = document.getElementById("about_text").value;
    }
  </script> --%>

  <style type="text/css">
  input:focus
  {
    outline:none;
  }
  </style>
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/login">Login</a>
    <a href="/register">Register</a>
    <a href="/about.jsp">About</a>
    <%-- <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a> --%>
  </nav>

  <p> You have successfully logged out! Please log in or register.</p>

</body>
</html>
