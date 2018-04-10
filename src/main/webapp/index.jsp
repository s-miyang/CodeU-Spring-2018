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
  <title>CodeU Chat App</title>
  <link rel="stylesheet" href="/css/main.css" type="text/css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
      <a href="/conversations">Conversations</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
    <%-- <a href="/testdata">Load Test Data</a> --%>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">
      <h1>ToadBlue Messaging App</h1>
      <h2>Welcome!</h2>

      <ul>
        <li>If you do not have an account, please first <a href="/register">register</a> to get started.</li>
        <li>Otherwise, go ahead and <a href="/login">login</a>.</li>
        <li>Once logged in, go to the conversations page to
            create or join a conversation.</li>
        <li>View the <a href="/about.jsp">about</a> page to learn more about the
            messaging app.</li>
      </ul>
    </div>
  </div>
</body>
</html>
