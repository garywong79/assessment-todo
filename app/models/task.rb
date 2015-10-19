class Task < ActiveRecord::Base

	def self.list
		Task.all.each_with_index do |task,index|
			puts "#{index+1}. #{task.status} #{task.description} #{[task.date_created]}"
		end
	end

	def self.add(task_detail)
		Task.create(description: task_detail, status: "[]", date_created: Date.today)
		puts "Task: #{[task_detail]} is added on #{Time.now}!"
	end

	def self.delete(num)
		todo = Task.all
		todo.delete(todo[num-1])
		puts "Task No. #{num}. #{todo[num-1].description} was deleted on #{Time.now} !"
	end

	def self.complete
	end

end
