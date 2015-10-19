require_relative 'config/application'
require_relative 'app/models/task'
require 'date'
# p Task.column_names 
p Task.all

# puts "Put your application code in #{File.expand_path(__FILE__)}"

command = ARGV.shift.downcase

case command

	when 'list'
		Task.list
	when 'add'
		Task.add(ARGV.join(" "))
	when 'delete'
		Task.delete(ARGV.join(" ").to_i)
	when 'complete'
		Task.complete(ARGV.join(" ").to_i)
	when "summary"
		Task.summary
	when "sort"
		Task.sort
	else
		puts "Invalid Command !"
		puts "Please enter the following [command]!"
		puts "[LIST] - list all your tasks"
		puts "[ADD] task name - create a new task"
		puts "[DELETE] task number - delete the task"
		puts "[COMPLETE] task number - set task to complete"
		puts "[SORT] - sort the task date ascending order!"
		puts "[SUMMARY] - display task statistic"

	end
