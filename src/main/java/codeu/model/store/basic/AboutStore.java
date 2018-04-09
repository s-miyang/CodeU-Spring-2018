package codeu.model.store.basic;

import codeu.model.data.Conversation;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.util.ArrayList;
import java.util.List;

/**
 * Store class that uses in-memory data structures to hold values and automatically loads from and
 * saves to PersistentStorageAgent. It's a singleton so all servlet classes can access the same
 * instance.
 */
public class AboutStore {

  /** Singleton instance of ConversationStore. */
  private static AboutStore instance;

  /**
   * Returns the singleton instance of ConversationStore that should be shared between all servlet
   * classes. Do not call this function from a test; use getTestInstance() instead.
   */
  public static AboutStore getInstance() {
    if (instance == null) {
      instance = new AboutStore(PersistentStorageAgent.getInstance());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
   *
   * @param persistentStorageAgent a mock used for testing
   */
  public static AboutStore getTestInstance(PersistentStorageAgent persistentStorageAgent) {
    return new AboutStore(persistentStorageAgent);
  }

  /**
   * The PersistentStorageAgent responsible for loading Conversations from and saving Conversations
   * to Datastore.
   */
  private PersistentStorageAgent persistentStorageAgent;

  /** The in-memory list of Conversations. */
  private Map<User, About> abouts;

  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private AboutStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    abouts = new HashMap<>();
  }

  /** Access the current set of conversations known to the application. */
  public Map<About> getAllAbouts() {
    return abouts;
  }

  /** Add a new conversation to the current set of conversations known to the application. */
  public void addAbout(User user, About about) {
    abouts.add(user, about);
    persistentStorageAgent.writeThrough(about);
  }

  /** Sets the List of Conversations stored by this ConversationStore. */
  public void getAbout(User user) {
    abouts.get(user);
  }
}
