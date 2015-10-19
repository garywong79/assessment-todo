require_relative '../../config/application'


class CreateTasks < ActiveRecord::Migration

  def change
    
    	create_table :tasks do |t|
    		t.string :description
    		t.string :status
    		t.date :date_created
    	end

  end
end    