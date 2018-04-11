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
  <link rel="stylesheet" href="css/index.css" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
  <p class="title">w e l c o m e &nbsp;&nbsp; t o &nbsp;&nbsp; T o a d <span class="special">B l u e</span></p>
  <div align="center" id="container">
      <form action="/login" method="POST">
        <label class="pls" for="username">U S E R N A M E</label>
        <br/>
        <input type="text" class="text-line" name="username" id="username">
        <br/>
        <label for="password">P A S S W O R D</label>
        <br/>
        <input type="password" class="text-line" name="password" id="password">
        <br/><br/>
        <button type="submit">S I G N &nbsp;&nbsp; I N</button>
      </form>
      </br>
      <p><a href="/register">R&nbsp;E&nbsp;G&nbsp;I&nbsp;S&nbsp;T&nbsp;E&nbsp;R</a></p>
  </div>
</body>
</html>
