package com.devops.vprofile.repository;

import com.devops.vprofile.config.DatabaseConfig;
import com.devops.vprofile.model.Task;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskRepository {

public boolean createTask(Task task) {

    String sql =
            "INSERT INTO tasks " +
            "(user_id, title, description, status) " +
            "VALUES (?, ?, ?, ?)";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setInt(1, task.getUserId());
        statement.setString(2, task.getTitle());
        statement.setString(3, task.getDescription());
        statement.setString(4, task.getStatus());

        return statement.executeUpdate() > 0;

    } catch (SQLException e) {

        e.printStackTrace();

        return false;
    }
}


public List<Task> findByUserId(int userId) {

    List<Task> tasks =
            new ArrayList<>();

    String sql =
            "SELECT * FROM tasks " +
            "WHERE user_id = ? " +
            "ORDER BY id DESC";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setInt(1, userId);

        ResultSet result =
                statement.executeQuery();

        while (result.next()) {

            Task task = new Task(
                    result.getInt("id"),
                    result.getInt("user_id"),
                    result.getString("title"),
                    result.getString("description"),
                    result.getString("status")
            );

            tasks.add(task);
        }

    } catch (SQLException e) {

        e.printStackTrace();
    }

    return tasks;
}


public boolean updateStatus(int taskId,
                            String status) {

    String sql =
            "UPDATE tasks SET status = ? " +
            "WHERE id = ?";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setString(1, status);
        statement.setInt(2, taskId);

        return statement.executeUpdate() > 0;

    } catch (SQLException e) {

        e.printStackTrace();

        return false;
    }
}


public boolean deleteTask(int taskId) {

    String sql =
            "DELETE FROM tasks WHERE id = ?";

    try (
            Connection connection =
                    DatabaseConfig.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
    ) {

        statement.setInt(1, taskId);

        return statement.executeUpdate() > 0;

    } catch (SQLException e) {

        e.printStackTrace();

        return false;
    }
}

}
