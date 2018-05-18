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
List<Message> messages = (List<Message>) request.getAttribute("messages");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/css/main.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>

  <nav>
    <%-- <a id="navTitle" href="/">Home</a> --%>
    <%-- <% if(user != null){ %>
      <a>Hello <%=request.getSession().getAttribute("user")%>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %> --%>
    <a href="/conversations">C O N V E R S A T I O N S</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">M Y &nbsp;&nbsp; P R O F I L E</a>
    <a href="/about.jsp">A B O U T</a>
  </nav>

 <div id="container">
   <h1><%= user %>'s Profile Page</h1>
   <hr>

   <img src=<%= UserStore.getInstance().getUser(user).getPic() %> alt=<%= user %> + "'s profile picture" style="float:left;width:100px;">

   <h4>About <%= user %></h4>
   <% if (request.getSession().getAttribute("user") != null) { %>
  		<p> <%= bio %></p>

  		<p> Studies at <%= UserStore.getInstance().getUser(user).getSchool() %> </p>
  		<p> Graduation Year: <%= UserStore.getInstance().getUser(user).getGradYear() %> </p>

  		<% if (UserStore.getInstance().getUser(user).getId().equals(UserStore.getInstance().getUser((String) request.getSession().getAttribute("user")).getId())) { %>
  			<hr>
  			<form action="/users/<%=user%>" id="about_form" method="POST">
     		<h5>Edit your profile:</h5>
     		<input type="text" autocomplete="off" name="about_text" id="about_text"></input>
     		<button type="submit">P U B L I S H</button>
   			</form>

   			<form action="/users/<%=user%>" id="What" method="POST">
   			<h5>Change profile picture: link to a picture online</h5>
   			<input type="text" autocomplete="off" name="pic" id="pic"></input>
   			<button type="submit">C H A N G E</button>
   			</form>

   			<form action="/users/<%=user%>" id="who knows" method="POST">
   			<h5>Change graduation year</h5>
   			<select class="text-line" name="grad_year" id="grad_year">
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
              <option value="2022">2022</option>
         	</select>
         	<button type="submit">C H A N G E</button>
         	</form>

         	<form action="/users/<%=user%>" id="idk" method="POST">
         	<h5>Update your school</h5>
         	<input type="text" autocomplete="off" name="school" id="school"></input>
         	<button type="submit">U P D A T E</button>
         	</form>

   		<% } %>
   <% } else { %>
   		<p>User is null. Sorry something went wrong :( </p>
   		<p>Please log out and try again! (It should work!) If something's still wrong, comment! </p>
   <% } %>

   <hr>


   <%-- <h4><%= user %>'s Sent Messages</h4>
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

   <hr/> --%>

   <form action="/logout" method="POST">
     <button class="logout" type="submit">L O G &nbsp;&nbsp; O U T</button>
   </form>

 </div>
</body>
</html>
