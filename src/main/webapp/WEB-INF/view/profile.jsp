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
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

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
   input:focus
   {
     outline:none;
   }
   #messages {
     background-color: white;
     height: 500px;
     overflow-y: scroll
   }
 </style>
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
  </nav>

 <div id="container">
   <h1><%= request.getSession().getAttribute("user") %>'s Profile Page</h1>
   <hr>

   <form action="/users/<%=request.getSession().getAttribute("user")%>" id="about_form" method="POST">
     <h5>Edit your profile:</h5>
     <input type="text" autocomplete="off" name="about_text" id="about_text"></input>
     <button type="submit">Submit</button>
   </form>
   <h4>About <%= request.getSession().getAttribute("user") %></h4>
   <p> <%= UserStore.getInstance().getUser((String) request.getSession().getAttribute("user")).getBio() %></p>
   <hr>

   <h4><%= request.getSession().getAttribute("user") %>'s Sent Messages</h4>
   <div id="messages">
     <ul>
     <% for (Message message : messages) {
          if (message.getAuthorId() == UserStore.getInstance().getUser((String) request.getSession().getAttribute("user")).getId()) {
       %>
        <li><strong> <%= message.getCreationTime() %>: </strong> <%=  message.getContent() %> </li>
      <%
          }
        }
     %>
     </ul>
   </div>

   <hr/>

   <form action="/index.jsp" method="link">
     <button type="submit">Log Out</button>
   </form>

 </div>
</body>
</html>
