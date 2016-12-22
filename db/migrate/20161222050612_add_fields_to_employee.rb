class AddFieldsToEmployee < ActiveRecord::Migration[5.0]
  def change
  	add_column :employees, :name, :string
  	add_column :employees, :lastname, :string
  	add_column :employees, :phone, :string
  	add_column :employees, :emergencyphone, :string
  	add_column :employees, :rut, :string
  	add_column :employees, :birthday, :date
  	add_column :employees, :afp, :string
  	add_column :employees, :ensurance, :string
  	add_column :employees, :genre, :string
  	add_column :employees, :position, :string
  	add_column :employees, :bikemodel, :string
  	add_column :employees, :bikeplate, :string
  	add_column :employees, :bank, :string
  	add_column :employees, :account, :string
  	add_column :employees, :accounttype, :string
  end
end
