class EmployeeNotNullFieldsWithoutDefault < ActiveRecord::Migration[5.0]
  def change
  	change_column :employees, :name, :string, null: false
  	change_column :employees, :lastname, :string, null: false
  	change_column :employees, :phone, :string, null: false
  	change_column :employees, :position, :string, null: false
  end
end
