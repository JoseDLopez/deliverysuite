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


	show do
		panel "Datos básicos" do
			table_for employee do
				column :name, :label => "Nombre"
				column :lastname, :label => "Apellido"
				column :rut, :label => "RUT"
				column :email, :label => "Correo Electrónico"
				column :birthday, as: :date_time_picker, :label => "Fecha de Nacimiento"
				column :position, :label => "Cargo" 
				column :phone, :label => "Número celular" 
			end
		end

		panel "Datos varios" do
			table_for employee do
				column :emergencyphone, :label => "Número de Emergencia" 
				column :genre, :label => "Género" 
				column :bikeplate, :label => "Patente Moto" 
				column :bikemodel, :label => "Modelo Moto" 
			end
		end
		active_admin_comments
	end

	sidebar "Details", only: :show do
		attributes_table_for employee do
			row :afp, :label => "AFP" 
			row :ensurance, :label => "Salud" 
			row :genre, :label => "Género" 
			row :bank, :label => "Banco" 
			row :account, :label => "Número de cuenta"
			row :accounttype, :label => "Tipo de Cuenta" 
		end
	end



end
