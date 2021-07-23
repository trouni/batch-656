class Task
  attr_reader :id
  attr_accessor :title, :description, :done

  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @title = attributes[:title] || attributes['title']
    @description = attributes[:description] || attributes['description']
    @done = attributes[:done] || attributes['done'] || false
  end

  def self.find(id)
    results = DB.execute('SELECT * FROM tasks WHERE id = ?', id)
    return nil if results.empty?

    new(results[0]) # same as Task.new
  end

  def self.all
    results = DB.execute('SELECT * FROM tasks')
    results.map { |result| new(result) }
  end

  def save
    if @id.nil?
      # CREATE
      query = <<-SQL
      INSERT INTO tasks (title, description, done)
      VALUES (?, ?, ?)
      SQL

      DB.execute(query, @title, @description, @done ? 1 : 0)
      @id = DB.last_insert_row_id
    else
      # UPDATE
      DB.execute(
        'UPDATE tasks SET title = ?, description = ?, done = ? WHERE id = ?',
        @title, @description, @done ? 1 : 0, @id
      )
    end
  end

  def destroy
    DB.execute('DELETE FROM tasks WHERE id = ?', @id)
  end
end
