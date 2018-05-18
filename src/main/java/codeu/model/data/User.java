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

package codeu.model.data;

import java.time.Instant;
import java.util.UUID;

/** Class representing a registered user. */
public class User {
  private final UUID id;
  private final String name;
  private final String password;
  private final Instant creation;

// Added for profile pages. See profile.jsp
  private String bio;
  private String pic;
  private String school; // name of their school
  private int gradYear; // year they'll graduate

  /**
   * Constructs a new User.
   *
   * @param id the ID of this User
   * @param name the username of this User
   * @param password the password of this user
   * @param creation the creation time of this User
   */
  public User(UUID id, String name, String password, Instant creation) {
    this.id = id;
    this.name = name;
    this.password = password;
    this.creation = creation;

    //added for profile
    this.bio = "Hello! My name is " + this.name + ".";
    this.pic = "http://www.readersdigest.ca/wp-content/uploads/2011/01/4-ways-cheer-up-depressed-cat.jpg";
    this.school = "<You're a legacy user! You made an account before we could take down your info :) Go ahead and change the school/grad year!>";
    this.gradYear = 0;
  }

/** Returns the ID of this User. */
  public UUID getId() {
    return id;
  }

  /** Returns the username of this User. */
  public String getName() {
    return name;
  }

  /** Returns the password of this user */
  public String getPassword() {
	  return password;
  }

  /** Returns the creation time of this User. */
  public Instant getCreationTime() {
    return creation;
  }

/* -----------------------------------------ADDED FOR PROFILE PAGES-------------------------------------------*/

  /*
   * Sets the bio of the user to be s
   * @requires s.length <= 180
   * @returns boolean of whether it was successful
   * 	true = success, false = failure
   * */
  public void setBio(String s) {
	  // if (s.length() <= 180) {
		//   this.bio = s;
		//   return true;
	  // }
	  // return false;
    bio = s;
  }

  /* returns the bio associated with the user*/
  public String getBio() {
	  return bio;
  }
  
  public void setPic(String p) {
      pic = p;
  }
  public String getPic() {
      System.out.println("User.java: getPic() returned " + pic);
      return pic;
  }
  
  public void setSchool(String s) {
      school = s;
  }

  public String getSchool() {
      return school;
  }

  /*
   * returns true if success, false if fail
   * success = year that's between 2018 and 2024 ***SUBJECT TO CHANGE***
   */
  public boolean setGradYear(int year) {
      if (year < 2018 || year > 2024) {
          return false;
      }
      gradYear = year;
      return true;
  }

  public int getGradYear() {
      return gradYear;
  }

}
