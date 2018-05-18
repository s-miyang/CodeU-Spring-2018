<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <link rel="stylesheet" href="/css/index.css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <%-- <style>
            label {
            display: inline-block;
            width: 100px;
         }
        </style> --%>

    </head>

    <body>
      <%-- <nav>
         <a id="navTitle" href="/">Home</a>
         <% if(request.getSession().getAttribute("user") != null){ %>
           <a>Hello <%= request.getSession().getAttribute("user") %>!</a>
         <% } else{ %>
           <a href="/login">Login</a>
           <a href="/register">Register</a>
           }
         <a href="/conversations">Conversations</a>
         <a href="/about.jsp">About</a>
         <a href="/users/<%=request.getSession().getAttribute("user")%>">My Profile</a>
      </nav> --%>

      <div align="center" id="container">
         <p class="title">T o a d <span class="special">R e g i s t e r</span></p>

         <% if(request.getAttribute("error") != null){ %>
         	<h2 style="color:red"><%= request.getAttribute("error") %></h2>
         <% } %>

         <form action="/register" method="POST">
           <label for="username">U S E R N A M E</label>
           <input type="text" required="required" class="text-line" name="username" id="username">
           <br/>
           <label for="password">P A S S W O R D</label>
           <input type="password" required="required" class="text-line" name="password" id="password">
           <br/>
           <label for="school">S C H O O L</label>
           <input type="text" required="required" class="text-line" name="school" id="school">
           <br/>
           <label for="grad_year">G R A D U A T I O N &nbsp;&nbsp; Y E A R</label>
           <br><br/>
           <select class="text-line" required="required" name="grad_year" id="grad_year">
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
              <option value="2022">2022</option>
          </select>
           <br/><br/><br/>
           <button type="submit">S I G N &nbsp;&nbsp; U P</button>
         </form>
         </br>
         <p>A L R E A D Y &nbsp;&nbsp; H A V E &nbsp;&nbsp; A N &nbsp;&nbsp; A C C O U N T ? &nbsp;&nbsp;<a href="/login">S I G N &nbsp;&nbsp; I N</a></p>
      </div>
    </body>
</html>
