class AddRutToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :rut, :string
  end
end
