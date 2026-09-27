package com.devops.vprofile.repository;

import com.devops.vprofile.config.DatabaseConfig;
import com.devops.vprofile.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository {

public boolean createUser(User user) {

    String sql =
            "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPassword());

        return statement.executeUpdate() > 0;

    } catch (SQLException e) {

        e.printStackTrace();

        return false;
    }
}


public User findByEmail(String email) {

    String sql =
            "SELECT * FROM users WHERE email = ?";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setString(1, email);

        ResultSet result =
                statement.executeQuery();

        if (result.next()) {

            return new User(
                    result.getInt("id"),
                    result.getString("name"),
                    result.getString("email"),
                    result.getString("password")
            );
        }

    } catch (SQLException e) {

        e.printStackTrace();
    }

    return null;
}


public List<User> findAll() {

    List<User> users =
            new ArrayList<>();

    String sql =
            "SELECT * FROM users";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql);

            ResultSet result =
                    statement.executeQuery()
    ) {

        while (result.next()) {

            User user = new User(
                    result.getInt("id"),
                    result.getString("name"),
                    result.getString("email"),
                    result.getString("password")
            );

            users.add(user);
        }

    } catch (SQLException e) {

        e.printStackTrace();
    }

    return users;
}

}
