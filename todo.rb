require_relative 'config/application'
require_relative 'app/models/task'
require_relative 'app/controllers/todo'
require 'date'
# p Todo.column_names 
# p Todo.all

# puts "Put your application code in #{File.expand_path(__FILE__)}"

command = ARGV.shift.downcase

case command

	when 'list'
		Todo.list
	when 'add'
		Todo.add(ARGV.join(" "))
	when 'delete'
		Todo.delete(ARGV.join(" ").to_i)
	when 'complete'
		Todo.complete(ARGV.join(" ").to_i)
	when "summary"
		Todo.summary
	when "sort"
		Todo.sort
	else
		puts "Invalid Command !"
		puts "Please enter the following [command]!"
		puts "[LIST] - list all your tasks"
		puts "[ADD] task name - create a new task"
		puts "[DELETE] task number - delete the task"
		puts "[COMPLETE] task number - set task to complete"
		puts "[SORT] - sort the task date in ascending order!"
		puts "[SUMMARY] - display task statistic"

	end
