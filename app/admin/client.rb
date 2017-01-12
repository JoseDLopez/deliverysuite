ActiveAdmin.register Client do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :name, :address, :email, :phone, :latitude, :longitude, :lastname, :rut
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do
		selectable_column
		column :name
		column :lastname
		column :address
		column :phone
		column :rut
		column :email
		column :latitude
		column :longitude
		column :created_at
		actions
	end

	form do |f|
		inputs "Add a new Client" do
			input :name
			input :lastname
			input :email
			input :phone
			input :rut
			input :address
		end
		actions
	end

	filter :email
	filter :name
	filter :lastname
	filter :rut
	filter :phone
	filter :created_at



	show do
  	panel "Ubicación del Cliente en el Mapa:" do
	  	# renders app/views/admin/posts/_some_partial.html.erb
	  	render 'show_client_map', {latitude: client.latitude, longitude: client.longitude, name: client.name}
	    
  	end

  end

  sidebar "Details", only: :show do
    attributes_table_for client do
      row :name
      row :lastname
      row :email
      row :phone
      row :address
      row :latitude
      row :longitude
      row :created_at
    end
  end

end
