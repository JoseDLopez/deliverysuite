class EmployeeNotNullFields < ActiveRecord::Migration[5.0]
  def change
  	change_column :employees, :name, :string, :default => "", :null => false
  	change_column :employees, :lastname, :string, :default => "", :null => false
  	change_column :employees, :phone, :string, :default => "", :null => false
  	change_column :employees, :position, :string, :default => "", :null => false
  end
end
