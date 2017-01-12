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
		column :created_at
		actions
	end

	form do |f|
		inputs "Add a new employee" do
			input :name, :label => "Nombre" 
			input :lastname, :label => "Apellido" 
			input :rut, :label => "RUT" 
			input :email, :label => "Correo Electrónico" 
			input :birthday, as: :date_time_picker, :label => "Fecha de Nacimiento" 
			input :position, :label => "Cargo" 
			input :phone, :label => "Número celular" 
			input :emergencyphone, :label => "Número de Emergencia" 
			input :afp, :label => "AFP" 
			input :ensurance, :label => "Salud" 
			input :genre, :label => "Género" 
			input :bank, :label => "Banco" 
			input :account, :label => "Número de cuenta" 
			input :accounttype, :label => "Tipo de Cuenta" 
			input :bikeplate, :label => "Patente Moto" 
			input :bikemodel, :label => "Modelo Moto" 
			input :password, :label => "Contraseña" 
		end
		actions
	end

	filter :email
	filter :name
	# filter :id
	filter :position, as: :select
	filter :created_at

end
