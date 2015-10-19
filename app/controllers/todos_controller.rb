class TodosController

	def self.routing(command, options)
		case command
		when 'list'
			Todo.list
		when 'add'
			Todo.add(options)
		when 'delete'
			Todo.delete(options.to_i)
		when 'complete'
			Todo.complete(options.to_i)
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
	end
end