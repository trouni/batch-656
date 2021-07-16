class View
  def ask_user_for_description
    puts "What is your task?"
    print "> "
    gets.chomp
  end

  def display(tasks)
    puts '=' * 30
    tasks.each_with_index do |task, index|
      x = task.done? ? 'x' : ' '
      puts "#{index + 1}. [#{x}] #{task.description}"
    end
    puts '=' * 30
  end

  def ask_user_for_task_index
    puts "What is the number of the task you want to mark as complete?"
    print "> "
    gets.chomp.to_i - 1
  end
end