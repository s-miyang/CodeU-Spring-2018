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

import codeu.model.data.Conversation;
import codeu.model.data.Message;
import codeu.model.data.User;
import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.MessageStore;
import codeu.model.store.basic.UserStore;
import java.io.IOException;
import java.time.Instant;
import java.util.List;
import java.util.UUID;
import java.util.Comparator;
import java.util.Collections;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

/** Servlet class responsible for the chat page. */
public class ChatServlet extends HttpServlet {

  /** Store class that gives access to Conversations. */
  private ConversationStore conversationStore;

  /** Store class that gives access to Messages. */
  private MessageStore messageStore;

  /** Store class that gives access to Users. */
  private UserStore userStore;

  /** Set up state for handling chat requests. */
  @Override
  public void init() throws ServletException {
    super.init();
    setConversationStore(ConversationStore.getInstance());
    setMessageStore(MessageStore.getInstance());
    setUserStore(UserStore.getInstance());
  }

  /**
   * Sets the ConversationStore used by this servlet. This function provides a common setup method
   * for use by the test framework or the servlet's init() function.
   */
  void setConversationStore(ConversationStore conversationStore) {
    this.conversationStore = conversationStore;
  }

  /**
   * Sets the MessageStore used by this servlet. This function provides a common setup method for
   * use by the test framework or the servlet's init() function.
   */
  void setMessageStore(MessageStore messageStore) {
    this.messageStore = messageStore;
  }

  /**
   * Sets the UserStore used by this servlet. This function provides a common setup method for use
   * by the test framework or the servlet's init() function.
   */
  void setUserStore(UserStore userStore) {
    this.userStore = userStore;
  }

  /**
   * This function fires when a user navigates to the chat page. It gets the conversation title from
   * the URL, finds the corresponding Conversation, and fetches the messages in that Conversation.
   * It then forwards to chat.jsp for rendering.
   */
  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    String requestUrl = request.getRequestURI();
    String conversationTitle = requestUrl.substring("/chat/".length());

    Conversation conversation = conversationStore.getConversationWithTitle(conversationTitle);
    if (conversation == null) {
      // couldn't find conversation, redirect to conversation list
      System.out.println("Conversation was null: " + conversationTitle);
      response.sendRedirect("/conversations");
      return;
    }

    UUID conversationId = conversation.getId();

    List<Message> messages = messageStore.getMessagesInConversation(conversationId);
    Collections.sort(messages, new SortByTime());

    request.setAttribute("conversation", conversation);
    request.setAttribute("messages", messages);
    request.getRequestDispatcher("/WEB-INF/view/chat.jsp").forward(request, response);
  }

  /**
   * This function fires when a user submits the form on the chat page. It gets the logged-in
   * username from the session, the conversation title from the URL, and the chat message from the
   * submitted form data. It creates a new Message from that data, adds it to the model, and then
   * redirects back to the chat page.
   */
  @Override
  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    String username = (String) request.getSession().getAttribute("user");
    if (username == null) {
      // user is not logged in, don't let them add a message
      response.sendRedirect("/login");
      return;
    }

    User user = userStore.getUser(username);
    if (user == null) {
      // user was not found, don't let them add a message
      response.sendRedirect("/login");
      return;
    }

    String requestUrl = request.getRequestURI();
    String conversationTitle = requestUrl.substring("/chat/".length());

    Conversation conversation = conversationStore.getConversationWithTitle(conversationTitle);
    if (conversation == null) {
      // couldn't find conversation, redirect to conversation list
      response.sendRedirect("/conversations");
      return;
    }

    String messageContent = request.getParameter("message");

    // making pseudo-HTML color tags into real HTML
    messageContent = this.parseColorTags(messageContent);
    


    // this removes any HTML from the message content
    String cleanedMessageContent = Jsoup.clean(messageContent, Whitelist.basicWithImages​().addAttributes(":all", "class"));

    Message message =
        new Message(
            UUID.randomUUID(),
            conversation.getId(),
            user.getId(),
            cleanedMessageContent,
            Instant.now());

    messageStore.addMessage(message);

    // redirect to a GET request
    response.sendRedirect("/chat/" + conversationTitle);
    // response.sendRedirect("/users/" + user.getName());
  }

  // replace pseudo-HTML color tags with actual HTML that works
  // ugly, but has to be hardcoded since using hardcoded names
  String parseColorTags(String messageContent) {
    String a = messageContent.replace("<green>","<span class=\"green\">");
    a = a.replace("</green>","</span>");
    a = a.replace("<blue>","<span class=\"blue\">");
    a = a.replace("</blue>","</span>");
    a = a.replace("<yellow>","<span class=\"yellow\">");
    a = a.replace("</yellow>","</span>");
    a = a.replace("<orange>","<span class=\"orange\">");
    a = a.replace("</orange>","</span>");
    a = a.replace("<pink>","<span class=\"pink\">");
    a = a.replace("</pink>","</span>");
    a = a.replace("<black>","<span class=\"black\">");
    a = a.replace("</black>","</span>");
    a = a.replace("<white>","<span class=\"white\">");
    a = a.replace("</white>","</span>");
    a = a.replace("<red>","<span class=\"red\">");
    a = a.replace("</red>","</span>");
    a = a.replace("<purple>","<span class=\"purple\">");
    a = a.replace("</purple>","</span>");
    a = a.replace("<violet>","<span class=\"violet\">");
    a = a.replace("</violet>","</span>");
    a = a.replace("<teal>","<span class=\"teal\">");
    a = a.replace("</teal>","</span>");
    a = a.replace("<turquoise>","<span class=\"turquoise\">");
    a = a.replace("</turquoise>","</span>");
    a = a.replace("<tan>","<span class=\"tan\">");
    a = a.replace("</tan>","</span>");
    a = a.replace("<plum>","<span class=\"plum\">");
    a = a.replace("</plum>","</span>");
    a = a.replace("<maroon>","<span class=\"maroon\">");
    a = a.replace("</maroon>","</span>");
    a = a.replace("<lime>","<span class=\"lime\">");
    a = a.replace("</lime>","</span>");
    a = a.replace("<lavender>","<span class=\"lavender\">");
    a = a.replace("</lavender>","</span>");
    a = a.replace("<indigo>","<span class=\"indigo\">");
    a = a.replace("</indigo>","</span>");
    a = a.replace("<grey>","<span class=\"grey\">");
    a = a.replace("</grey>","</span>");
    a = a.replace("<gray>","<span class=\"gray\">");
    a = a.replace("</gray>","</span>");
    a = a.replace("<gold>","<span class=\"gold\">");
    a = a.replace("</gold>","</span>");
    a = a.replace("<cyan>","<span class=\"cyan\">");
    a = a.replace("</cyan>","</span>");
    a = a.replace("<crimson>","<span class=\"crimson\">");
    a = a.replace("</crimson>","</span>");
    a = a.replace("<brown>","<span class=\"brown\">");
    a = a.replace("</brown>","</span>");
    a = a.replace("<azure>","<span class=\"azure\">");
    a = a.replace("</azure>","</span>");
    a = a.replace("<aqua>","<span class=\"aqua\">");
    a = a.replace("</aqua>","</span>");

    return a;
  }
}

class SortByTime implements Comparator<Message> {
    // Used for sorting in ascending order of
    // roll number
    public int compare(Message a, Message b)
    {
        return a.getCreationTime().toString().compareTo(b.getCreationTime().toString());
    }
}
