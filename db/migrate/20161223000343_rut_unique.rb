class RutUnique < ActiveRecord::Migration[5.0]
  def change
  	change_column :employees, :rut, :string, unique: true
  end
end
