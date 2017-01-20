ActiveAdmin.register Zone do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
	permit_params :name, :description, :price, :dots
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	index do |zone|
		selectable_column
		column :id
		column :name
		column :price	
		column :description
		column :created_at
		actions
	end
	filter :name
	filter :price
	filter :created_at

  show do
  	panel "Ubicación en el Mapa:" do
	  	# renders app/views/admin/posts/_some_partial.html.erb
	    render 'show_zone_map', {puntos: zone.dots}
  	end

  end

  sidebar "Details", only: :show do
    attributes_table_for zone do
      row :name
      row :price
      row :description
      row :created_at
      row :dots
    end
  end

	form partial: 'new_zone_form'



end
