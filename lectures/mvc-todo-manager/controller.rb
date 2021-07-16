require_relative 'view'
require_relative 'task'

class Controller
  def initialize(repository)
    @view = View.new
    @repository = repository
  end

  def create
    # 1. Ask the user what the task description is
    description = @view.ask_user_for_description
    # 2. Instantiate the task with the description
    task = Task.new(description)
    # 3. Add the task to the repository
    @repository.add(task)
  end

  def list
    display_tasks
  end

  def mark_task_complete
    # 1. Ask the view to display the tasks to the user
    display_tasks
    # 2. Tell the view to ask the user for the task to mark
    index = @view.ask_user_for_task_index
    # 3. Mark the task as done
    task_to_mark = @repository.all[index]
    task_to_mark.mark_as_done!
  end

  private

  def display_tasks
    # 1. Get all the tasks from the repository
    tasks = @repository.all
    # 2. Ask the view to display the tasks
    @view.display(tasks)
  end
end