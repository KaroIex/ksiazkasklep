package ovh.devnote.hello18.dao;

import ovh.devnote.hello18.entity.User;


public interface UserDAO {
    User getUser(String username);

    void saveUser(User user);
}
