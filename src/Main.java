import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    private static ArrayList<TodoItem> todoList = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.util.Scanner.in);

    public static void main(String[] args) {
        boolean running = true;

        System.out.println("=== Welcome to Your Java Todo App ===");

        while (running) {
            printMenu();
            int choice = getUserChoice();

            switch (choice) {
                case 1:
                    addTodo();
                    break;
                case 2:
                    viewTodoList();
                    break;
                case 3:
                    markTodoComplete();
                    break;
                case 4:
                    running = false;
                    System.out.println("Goodbye!");
                    break;
                default:
                    System.out.println("Invalid option. Please try again.");
            }
        }
        scanner.close();
    }

    private static void printMenu() {
        System.out.println("\n--- Options ---");
        System.out.println("1. Add a task");
        System.out.println("2. View all tasks");
        System.out.println("3. Mark a task as complete");
        System.out.println("4. Exit");
        System.out.print("Choose an option: ");
    }

    private static int getUserChoice() {
        try {
            return Integer.parseInt(scanner.nextLine());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private static void addTodo() {
        System.out.print("Enter task description: ");
        String description = scanner.nextLine();
        if (!description.trim().isEmpty()) {
            todoList.add(new TodoItem(description));
            System.out.println("Task added successfully!");
        } else {
            System.out.println("Task description cannot be empty.");
        }
    }

    private static void viewTodoList() {
        System.out.println("\n--- Your Todo List ---");
        if (todoList.isEmpty()) {
            System.out.println("No tasks found. Add some!");
            return;
        }
        for (int i = 0; i < todoList.size(); i++) {
            System.out.println((i + 1) + ". " + todoList.get(i));
        }
    }

    private static void markTodoComplete() {
        viewTodoList();
        if (todoList.isEmpty()) return;

        System.out.print("Enter the number of the task to complete: ");
        try {
            int index = Integer.parseInt(scanner.nextLine()) - 1;
            if (index >= 0 && index < todoList.size()) {
                todoList.get(index).markAsDone();
                System.out.println("Task marked as complete!");
            } else {
                System.out.println("Invalid task number.");
            }
        } catch (NumberFormatException e) {
            System.out.println("Please enter a valid number.");
        }
    }
}