ActiveAdmin.register Client do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
permit_params :name, :address, :email, :phone, :latitude, :longitude
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
		column :address
		column :phone
		column :email
		column :latitude
		column :longitude
		column :created_at
		actions
	end

	form do |f|
		inputs "Add a new Client" do
			input :name
			input :email
			input :phone
			input :address
		end
		actions
	end

	filter :email
	filter :name
	filter :phone
	filter :created_at

end
