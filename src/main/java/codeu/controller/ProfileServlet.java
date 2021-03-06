// Copyright 2017 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package codeu.controller;

import codeu.model.data.User;
import codeu.model.data.Message;
import codeu.model.store.basic.UserStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.persistence.PersistentDataStoreException;
import java.io.IOException;
import java.time.Instant;
import java.util.UUID;
import java.util.List;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Collections;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.*;

/** Servlet class responsible for the login page. */
public class ProfileServlet extends HttpServlet {

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

  /**
   * Set up state for handling login-related requests. This method is only called when running in a
   * server, not when running in a test.
   */
  @Override
  public void init() throws ServletException {
    super.init();
    setUserStore(UserStore.getInstance());
    setMessageStore(MessageStore.getInstance());
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * Sets the MessageStore used by this servlet. This function provides a common setup method for
   * use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }

  /**
   * This function fires when a user requests the /users URL. It simply forwards the request to
   * profile.jsp.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    String requestUrl = request.getRequestURI();
    String user = requestUrl.substring("/users/".length());
    request.setAttribute("user", user);

    User thisUser = userStore.getUser(user);
    if (thisUser == null) {
      // couldn't find conversation, redirect to conversation list
      System.out.println("User was null: " + user);
      response.sendRedirect("/users");
      return;
    }
    
    String bio = thisUser.getBio();
    request.setAttribute("bio", bio);
    
    //*>>???
    String pic = thisUser.getPic();
    if (pic == null) {
        System.out.println("ProfileServlet issue pic is null");
    }
    request.setAttribute("pic", pic);
    //>>???
    
    String school = thisUser.getSchool();
    request.setAttribute("school", school);
    
    int gradYear = thisUser.getGradYear();
    request.setAttribute("grad_year", gradYear);

    List<Message> messages = messageStore.retMessages();
    List<Message> myMessages = new ArrayList<>();
    for (Message message: messages) {
        if (message.getAuthorId().equals(thisUser.getId())) {
          myMessages.add(message);
        }
    }
    Collections.sort(myMessages, new SortByTime());
    request.setAttribute("messages", myMessages);
    request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
  }

  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
		  	throws IOException, ServletException {

    String username = (String) request.getSession().getAttribute("user");
    if (username == null) {
      response.sendRedirect("/users");
      return;
    }
    User user = userStore.getUser(username);
    
    
    // changed since might not contain all parameters?
    if (request.getParameter("about_text") != null) {
        user.setBio((String) request.getParameter("about_text"));
    }
    if (request.getParameter("pic") != null) {
        user.setPic((String) request.getParameter("pic"));
    }
    if (request.getParameter("school") != null) {
        user.setSchool((String) request.getParameter("school"));
    }
    if (request.getParameter("grad_year") != null) {
        user.setGradYear(Integer.parseInt(request.getParameter("grad_year")));
    }
    
    System.out.println("please work. thanks. " + (String)request.getParameter("pic") );
    System.out.println("\n\nlmao someone plsssss help: " + (String) request.getParameter("about_text") + "\n\n");
    userStore.editUser(user);
		response.sendRedirect("/users/" + user.getName());
  }
}
