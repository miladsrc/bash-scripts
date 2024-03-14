

todo_file="todo.txt"
done_file="done.txt"
deleted_file="deleted.txt"

function add_todo() {
    read -p "Enter the task title: " title
    read -p "Enter the task description: " description
    read -p "Enter the priority (Low, Medium, High): " priority
    read -p "Enter the due date and time (YYYY-MM-DD HH:MM): " due_date
    echo "$title: $description | Priority: $priority | Due: $due_date" >> "$todo_file"
    echo "Task added successfully."
}

function show_todo() {
    echo "Tasks to do:"
    cat "$todo_file"
}

function mark_done() {
    read -p "Enter the task number to mark as done: " task_num
    task=$(sed -n "${task_num}p" "$todo_file")
    
echo "$task" >> "$done_file"
    sed -i "${task_num}d" "$todo_file"
    echo "Task marked as done."
}

function show_done() {
    echo "Tasks done:"
    cat "$done_file"
}

function delete_task() {
    read -p "Enter the task number to delete: " task_num
    task=$(sed -n "${task_num}p" "$todo_file")
    echo "$task" >> "$deleted_file"
    sed -i "${task_num}d" "$todo_file"
    echo "Task deleted."
}


function show_deleted() {
    echo "Tasks deleted:"
    cat "$deleted_file"
}


function search_tasks() {
    read -p "Enter a keyword to search for: " keyword
    echo "Results for '$keyword':"
    grep -i "$keyword" "$1"
}

function search_done() {
    search_tasks "$done_file"
}

function search_todo() {
    search_tasks "$todo_file"
}

function search_deleted() {
    search_tasks "$deleted_file"
}

while true; do
    echo "1. Add new task"
    echo "2. Show tasks to do"
    echo "3. Mark a task as done"
    echo "4. Show tasks done"
    echo "5. Delete a task"
    echo "6. Show tasks deleted"
    echo "7. Search tasks done"
    echo "8. Search tasks to do"
    echo "9. Search tasks deleted"
    echo "10. Exit"

    read -p "Choose an option: " choice

    case $choice in
        1)
            add_todo;;
        2)
            show_todo;;
        3)
            mark_done;;
        4)
            show_done;;
        5)
            delete_task;;
        6)
            show_deleted;;
        7)
            search_done;;
        8)
          search_todo;;
        9)
          search_deleted;;
        10)
          break ;;
        *)
          echo "Invalid option. Please try again.";;

    esac
done



