class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    loop do
      puts "What would you like to do?"
      puts "1. List all the tasks"
      puts "2. Add a task"
      puts "3. Mark a task as done"
      puts "0. Exit"
      choice = gets.chomp.to_i
  
      case choice
      when 1 then @controller.list
      when 2 then @controller.create
      when 3 then @controller.mark_task_complete
      when 0 then break
      else
        puts "Wrong input. Please enter a valid number."
      end
    end
  end
end