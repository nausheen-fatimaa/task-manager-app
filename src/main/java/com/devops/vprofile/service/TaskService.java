package com.devops.vprofile.service;

import com.devops.vprofile.model.Task;
import com.devops.vprofile.repository.TaskRepository;

import java.util.List;

public class TaskService {

private final TaskRepository taskRepository;

public TaskService() {
    this.taskRepository =
            new TaskRepository();
}


public boolean createTask(
        int userId,
        String title,
        String description) {

    if (title == null ||
        title.trim().isEmpty()) {

        return false;
    }

    Task task =
            new Task(
                    userId,
                    title.trim(),
                    description,
                    "PENDING"
            );

    return taskRepository.createTask(task);
}


public List<Task> getUserTasks(int userId) {

    return taskRepository.findByUserId(userId);

}


public boolean completeTask(int taskId) {

    return taskRepository.updateStatus(
            taskId,
            "COMPLETED"
    );

}


public boolean reopenTask(int taskId) {

    return taskRepository.updateStatus(
            taskId,
            "PENDING"
    );

}


public boolean deleteTask(int taskId) {

    return taskRepository.deleteTask(taskId);

}


}
