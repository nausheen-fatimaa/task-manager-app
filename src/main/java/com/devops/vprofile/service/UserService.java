package com.devops.vprofile.service;

import com.devops.vprofile.model.User;
import com.devops.vprofile.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UserService {

private final UserRepository userRepository;

public UserService() {
    this.userRepository = new UserRepository();
}

public boolean registerUser(
        String name,
        String email,
        String password) {

    // Check whether the email already exists
    User existingUser =
            userRepository.findByEmail(email);

    if (existingUser != null) {
        return false;
    }

    // Hash the password before saving
    String hashedPassword =
            BCrypt.hashpw(
                    password,
                    BCrypt.gensalt(10)
            );

    User user =
            new User(
                    name,
                    email,
                    hashedPassword
            );

    return userRepository.createUser(user);
}


public User loginUser(
        String email,
        String password) {

    User user =
            userRepository.findByEmail(email);

    if (user == null) {
        return null;
    }

    boolean passwordMatches =
            BCrypt.checkpw(
                    password,
                    user.getPassword()
            );

    if (passwordMatches) {
        return user;
    }

    return null;
}


public List<User> getAllUsers() {

    return userRepository.findAll();

}

}
