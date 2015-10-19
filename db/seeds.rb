require 'faker'
require_relative '../app/models/task'

10.times do 
	Task.create(:description => Faker::Commerce.product_name,
							:status => "[]",
							:date_created => Faker::Date.between(10.days.ago, Date.today)
							)
end