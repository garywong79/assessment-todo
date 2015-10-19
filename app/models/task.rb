class Task < ActiveRecord::Base

	def self.list
		Task.all.each_with_index do |task,index|
			puts "#{index+1}. #{task.status} #{task.description} #{[task.date_created]}"
		end
	end

	def self.add
	end

	def self.delete
	end

	def self.complete
	end

end
