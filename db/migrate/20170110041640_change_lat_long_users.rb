class ChangeLatLongUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column :clients, :latitude, 'float USING CAST(latitude AS float)'
  	change_column :clients, :longitude, 'float USING CAST(longitude AS float)'

  end
end
