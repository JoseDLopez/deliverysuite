class Addcolumnsnonnulltoemployee < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :name, :string, :null => false
  	add_column :employees, :lastname, :string, :null => false
  	add_column :employees, :phone, :string, :null => false
  	add_column :employees, :position, :string, :null => false
  end
end
