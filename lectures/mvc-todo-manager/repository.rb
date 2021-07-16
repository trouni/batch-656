class Repository
  def initialize
    @tasks = []
  end

  # CRUD
  def add(task)
    @tasks << task
  end

  def all
    @tasks
  end
end