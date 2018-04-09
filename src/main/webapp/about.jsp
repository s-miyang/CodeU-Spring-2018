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
  <link rel="stylesheet" href="/css/main.css">
</head>
<body>

  <nav>
    <a id="navTitle" href="/">CodeU Chat App</a>
    <a href="/conversations">Conversations</a>
    <% if(request.getSession().getAttribute("user") != null){ %>
      <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
    <% } else{ %>
      <a href="/login">Login</a>
      <a href="/register">Register</a>
    <% } %>
    <a href="/about.jsp">About</a>
    <a href="/users">My Profile</a>
  </nav>

  <div id="container">
    <div
      style="width:75%; margin-left:auto; margin-right:auto; margin-top: 50px;">

      <h1>[Insert Name of Messaging App] User Manual</h1>
      <p>
        This is an example chat application designed to be a starting point
        for your CodeU project team work. Here's some stuff to think about:
      </p>

      <ul>
        <li><strong>Algorithms and data structures:</strong> We've made the app
            and the code as simple as possible. You will have to extend the
            existing data structures to support your enhancements to the app,
            and also make changes for performance and scalability as your app
            increases in complexity.</li>
        <li><strong>Look and feel:</strong> The focus of CodeU is on the Java
          side of things, but if you're particularly interested you might use
          HTML, CSS, and JavaScript to make the chat app prettier.</li>
        <li><strong>Customization:</strong> Think about a group you care about.
          What needs do they have? How could you help? Think about technical
          requirements, privacy concerns, and accessibility and
          internationalization.</li>
      </ul>

      <p>
        This is your code now. Get familiar with it and get comfortable
        working with your team to plan and make changes. Start by updating the
        homepage and this about page to tell your users more about your team.
        This page should also be used to describe the features and improvements
        you've added.
      </p>
      <h1>Our Team</h1>
      <p>
        Hi there! We're Team ToadBlue.

        <br></br>
        <h3>Meet the Team:</h3>
        <br></br>
        <b>Vikas Mahajan</b>
        <br></br>
        Role: Project Advisor
        <br></br>
        About: Vikas currently works at Google as a Program Manager.
        <br></br>
        Fun Fact: Vikas drives 150 miles every day in an electric car.

        <br></br>
        <br></br>

        <b>Emily Zhu</b>
        <br></br>
        Role: Programmer
        <br></br>
        About: Emily is currently a sophomore at UC Berkeley studying computer science.
        <br></br>
        Fun Fact: Emily used to play competitive chess.

        <br></br>
        <br></br>

        <b>Michelle Yang</b>
        <br></br>
        Role: Programmer
        <br></br>
        About: Michelle is a sophomore at the University of Washington studying computer science.
        <br></br>
        Fun Fact: Michelle really likes MacGyver.

        <br></br>
        <br></br>

        <b>Adelaide Punt</b>
        <br></br>
        Role: Programmer
        <br></br>
        About: Adelaide is a sophomore at Harvey Mudd College majoring in computer science and mathematics.
        <br></br>
        Fun Fact: Adelaide is a contemporary and ballet dancer.

        <br></br>
        <br></br>

        <b>Paolo Takagi-Atilano</b>
        <br></br>
        Role: Programmer
        <br></br>
        About: Paolo is a junior at Dartmouth College majoring in computer science.
        <br></br>
        Fun Fact: Paolo is on the varsity cross-conutry ski team.
      </p>

    </div>
  </div>
</body>
</html>
