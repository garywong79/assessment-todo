require_relative 'config/application'
require_relative 'app/models/todo'
require_relative 'app/controllers/todos_controller.rb'
require 'date'
# p Todo.column_names 
# p Todo.all

# puts "Put your application code in #{File.expand_path(__FILE__)}"

command = ARGV.shift.downcase
options = ARGV.join(" ")
TodosController.routing(command, options)
