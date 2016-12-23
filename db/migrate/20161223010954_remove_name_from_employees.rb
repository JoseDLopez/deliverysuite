class RemoveNameFromEmployees < ActiveRecord::Migration[5.0]
  def change
  	remove_column :employees, :name
  	remove_column :employees, :lastname
  	remove_column :employees, :phone
  	remove_column :employees, :position
  end
end
