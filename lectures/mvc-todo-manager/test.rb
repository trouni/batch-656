require_relative 'task'
require_relative 'repository'
require_relative 'controller'

task1 = Task.new("Learn about MVC")
task2 = Task.new("Get some drinks tonight")

repository = Repository.new

controller = Controller.new(repository)

controller.create
controller.create

controller.mark_task_complete

controller.list