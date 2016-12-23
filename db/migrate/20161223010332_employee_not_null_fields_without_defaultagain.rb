class EmployeeNotNullFieldsWithoutDefaultagain < ActiveRecord::Migration[5.0]
  def change
  	  change_column :employees, :name, :string, :default => nil, :null => false
  	change_column :employees, :lastname, :string, :default => nil, :null => false
  	change_column :employees, :phone, :string, :default => nil, :null => false
  	change_column :employees, :position, :string, :default => nil, :null => false
  end
end
