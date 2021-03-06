ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description
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
	column :description
	column 'Cantidad de Productos' do |cat|
      cat.products.count
    end
	actions
end

filter :products
filter :name
filter :description
filter :created_at


end
