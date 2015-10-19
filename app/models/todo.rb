class Todo < ActiveRecord::Base

	def self.list
		Todo.all.each_with_index do |todo, index|
			todo.print_todo(index)
		end
	end

	def self.add(task_detail)
		Todo.create(description: task_detail, status: "[]", date_created: Date.today)
		puts "Todo: #{[task_detail]} is added on #{Time.now}!"
	end

	def self.delete(num)
		todo = Todo.all
		todo.delete(todo[num-1])
		puts "Todo No. #{num}. #{todo[num-1].description} is deleted on #{Time.now} !"
	end

	def self.complete(num)
		todo = Todo.all
		todo[num-1].status = "[X]"
		puts "Todo No. #{num}. #{todo[num-1].description} is completed on #{Time.now}"
		todo[num-1].save
	end

	def self.sort
		Todo.all.order(:date_created).each_with_index do |todo,index|
			todo.print_todo(index)
		end
	end

	def self.summary
		total_task_created = Todo.all.count
		total_task_completed = Todo.where(status: "[X]").count
		task_completion_rate = ((total_task_completed)/(total_task_created).to_f).round(2)*100
		task_due_more_than_3_days = Todo.where(date_created: 3.days.ago..Date.today).count

		puts "Your Todo Summary as below:"
		puts " - Total tasks created: #{total_task_created}"
		puts " - Total tasks completed: #{total_task_completed}, completion rate: #{task_completion_rate}%"
	
		puts " - Todo due more than 3 days: #{task_due_more_than_3_days}"
	end

	def print_todo(index)
		puts "#{index+1}. #{status} #{description} #{[date_created]}"
	end
end