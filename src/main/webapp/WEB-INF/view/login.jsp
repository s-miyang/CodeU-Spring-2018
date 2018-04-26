<%--
  Copyright 2017 Google Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="/css/index.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>

  <%-- <nav>
    <a id="navTitle" href="/">Home</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/conversations">Conversations</a>
    <a href="/about.jsp">About</a>
    <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
  </nav> --%>

  <p class="title">T o a d <span class="special">L o g i n</span></p>
  <div align="center" id="container">
      <% if(request.getAttribute("error") != null){ %>
          <h2 style="color:red"><%= request.getAttribute("error") %></h2>
      <% } %>
      <form action="/login" method="POST">
        <label for="username">U S E R N A M E</label>
        <br/>
        <input type="text" required="required" class="text-line" name="username" id="username">
        <br/>
        <label for="password">P A S S W O R D</label>
        <br/>
        <input type="password" required="required" class="text-line" name="password" id="password">
        <br/><br/>
        <button type="submit">S I G N &nbsp;&nbsp; I N</button>
      </form>
      </br>
      <p>N O &nbsp;&nbsp; A C C O U N T ? &nbsp;&nbsp; <a href="/register">R&nbsp;E&nbsp;G&nbsp;I&nbsp;S&nbsp;T&nbsp;E&nbsp;R</a></p>
  </div>

</body>
</html>
