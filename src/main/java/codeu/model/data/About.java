package codeu.model.data;

/** Class representing a registered user. */
public class About {
  private final String about;

  /**
   * Constructs a new profile About field content.
   *
   * @param about Information about the user
   */
  public About(String about) {
    this.about = about;
  }

/** Returns the ID of this User. */
  public void setAbout(String newAbout) {
    this.about = newAbout;
  }

  /** Returns the username of this User. */
  public String getAbout() {
    return this.about;
  }
}
