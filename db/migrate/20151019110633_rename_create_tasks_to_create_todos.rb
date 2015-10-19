require_relative '../../config/application'

class RenameCreateTasksToCreateTodos< ActiveRecord::Migration
  def change
    rename_table :tasks, :todos
  end 
end