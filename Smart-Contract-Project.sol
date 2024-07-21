// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract TaskManager {
    // Structure to hold task details
    struct Task {
        string description;
        bool isCompleted;
    }
    
    // Mapping from task ID to Task
    mapping(uint256 => Task) public tasks;
    
    // Counter for generating unique task IDs
    uint256 public taskCounter;
    
    // Event to log when a task is created
    event TaskCreated(uint256 taskId, string description);
    
    // Event to log when a task is marked as completed
    event TaskCompleted(uint256 taskId);
    
    // Function to create a new task
    function createTask(string memory description) public {
        // Require that description is not empty
        require(bytes(description).length > 0, "Task description cannot be empty.");
        
        // Increment the task counter to get a new task ID
        uint256 taskId = taskCounter++;
        
        // Create the new task
        tasks[taskId] = Task(description, false);
        
        // Emit an event for the new task creation
        emit TaskCreated(taskId, description);
    }
    
    // Function to get details of a task
    function getTask(uint256 taskId) public view returns (string memory description, bool isCompleted) {
        // Ensure the task exists
        require(bytes(tasks[taskId].description).length > 0, "Task does not exist.");
        
        // Return the task details
        Task memory task = tasks[taskId];
        return (task.description, task.isCompleted);
    }
    
    // Function to mark a task as completed
    function completeTask(uint256 taskId) public {
        // Ensure the task exists
        require(bytes(tasks[taskId].description).length > 0, "Task does not exist.");
        
        // Ensure the task is not already completed
        require(!tasks[taskId].isCompleted, "Task is already completed.");
        
        // Mark the task as completed
        tasks[taskId].isCompleted = true;
        
        // Emit an event for the task completion
        emit TaskCompleted(taskId);
    }
    
    // Function to check if a task exists
    function taskExists(uint256 taskId) public view returns (bool) {
        // Ensure the task exists
        bool exists = bytes(tasks[taskId].description).length > 0;
        
        // Return whether the task exists
        return exists;
    }
    
    // Function to get the total number of tasks
    function getTotalTasks() public view returns (uint256) {
        // Return the total number of tasks
        return taskCounter;
    }
    
    // Function demonstrating assert() usage
    function validateTaskCount() public view {
        // Assert that taskCounter should always be non-negative
        assert(taskCounter >= 0);
    }
    
    // Function demonstrating revert() usage
    function deleteTask(uint256 taskId) public {
        // Ensure the task exists
        require(bytes(tasks[taskId].description).length > 0, "Task does not exist.");
        
        // Delete the task
        delete tasks[taskId];
        
        // Revert if task is not deleted properly
        if (bytes(tasks[taskId].description).length > 0) {
            revert("Task deletion failed.");
        }
    }
}
