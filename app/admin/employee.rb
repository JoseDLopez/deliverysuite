ActiveAdmin.register Employee do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :email, :password, :name, :lastname, :phone, :emergencyphone, :rut, :birthday, :afp, :ensurance, :genre, :position, :bikemodel, :bikeplate, :bank, :account, :accounttype
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
		column :id
		column :name
		column :lastname
		column :position
		column :phone
		column :email
		column :updated_at
		actions
	end

	form do |f|
		inputs "Add a new employee" do
			input :name
			input :lastname
			input :rut
			input :email
			input :birthday
			input :position
			input :phone
			input :emergencyphone
			input :afp
			input :ensurance
			input :genre
			input :bank
			input :account
			input :accounttype
			input :bikeplate
			input :bikemodel
			input :password
		end
		actions
	end

	filter :email
	filter :name
	# filter :id
	filter :position, as: :select

end
