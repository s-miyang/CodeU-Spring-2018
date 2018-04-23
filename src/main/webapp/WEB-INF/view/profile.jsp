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

<%@ page import="java.util.List" %>
<%@ page import="codeu.model.data.Message" %>
<%@ page import="codeu.model.store.basic.UserStore" %>
<%
String user = (String) request.getAttribute("user");
String bio = (String) request.getAttribute("bio");
String pic = request.getAttribute("profile_pic");
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
 <title>Login</title>
 <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <% if(user != null){ %>
      <a>Hello <%=request.getSession().getAttribute("user")%>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
    <a href="/about.jsp">About</a>
  </nav>

 <div id="container">
   <h1><%= user %>'s Profile Page</h1>
   <hr>
   <% if (UserStore.getInstance().getUser(user).getId().equals(UserStore.getInstance().getUser((String) request.getSession().getAttribute("user")).getId())) { %>
   <form action="/users/<%=user%>" id="about_form" method="POST">
     <h5>Edit your profile:</h5>
     <input type="text" autocomplete="off" name="about_text" id="about_text"></input>
     <button type="submit">Publish</button>
   </form>
   <% } %>
   
   <img src=pic alt=user + "'s profile picture">

   <h4>About <%= user %></h4>
   <% System.out.println("\n\n crying: " + UserStore.getInstance().getUser((String) request.getSession().getAttribute("user")).getBio()); %>
   <p> <%= bio %></p>

   <hr>

   <h4><%= user %>'s Sent Messages</h4>
   <div id="messages">
     <ul>
     <% for (Message message : messages) {
       %>
        <li><strong> <%= message.getCreationTime() %>: </strong> <%=  message.getContent() %> </li>
      <%
        }
     %>
     </ul>
   </div>

   <hr/>

   <form action="/logout" method="POST">
     <button type="submit">Log Out</button>
   </form>

 </div>
</body>
</html>
