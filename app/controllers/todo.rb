class Todo < ActiveRecord::Base
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
		puts "Task No. #{num}. #{todo[num-1].description} is deleted on #{Time.now} !"
	end

	def self.complete(num)
		todo = Task.all
		todo[num-1].status = "[X]"
		puts "Task No. #{num}. #{todo[num-1].description} is completed on #{Time.now}"
		todo[num-1].save
	end

	def self.sort
		Task.all.order(:date_created).each_with_index do |task,index|
			puts "#{index+1}. #{task.status} #{task.description} #{[task.date_created]}"
		end
	end

	def self.summary
		total_task_created = Task.all.count
		total_task_completed = Task.where(status: "[X]").count
		task_completion_rate = ((total_task_completed)/(total_task_created).to_f).round(2)*100
		task_due_more_than_3_days = Task.where(date_created: 3.days.ago..Date.today).count

		puts "Your Todo Summary as below:"
		puts " - Total tasks created: #{total_task_created}"
		puts " - Total tasks completed: #{total_task_completed}, completion rate: #{task_completion_rate}%"
	
		puts " - Task due more than 3 days: #{task_due_more_than_3_days}"

	end
end