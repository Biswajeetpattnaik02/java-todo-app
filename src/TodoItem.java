public class TodoItem {
    private String description;
    private boolean isDone;

    // Constructor
    public TodoItem(String description) {
        this.description = description;
        this.isDone = false; // Tasks are incomplete by default
    }

    // Getters and Setters
    public String getDescription() {
        return description;
    }

    public boolean isDone() {
        return isDone;
    }

    public void markAsDone() {
        this.isDone = true;
    }

    // Custom string representation for printing
    @Override
    public String toString() {
        String statusIcon = isDone ? "[X]" : "[ ]";
        return statusIcon + " " + description;
    }
}