ActiveAdmin.register Product do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
	permit_params :name, :description, :time, :price, :picture, category_ids:[]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


	form do |f|
		inputs "Agrega un nuevo producto" do
			input :name, :label => "Nombre"
			input :description, :label => "Descripción"
			input :price, :label => "Precio"
			input :time, :label => "Tiempo de Cocción"
			input :picture, as: :file, :label => "Imagen representativa"
			# input :category_ids, as: :select, collection: Category.all, multiple: true
			input :categories, as: :check_boxes, collection: Category.all, :label => "Categoría"
		end
		actions
	end

	show do
		panel "Tabla del Producto" do
			table_for product do
				column :name, :label => "Nombre"
				column :description, :label => "Descripción"
				column :picture do
				# image_tag product.picture, size: "300x200"
					link_to "#{product.picture}" do
						image_tag product.picture, size: "300x200"
					end
				end
			end
		end

		panel "Categorías del Producto" do
			table_for product.categories do
				column "name" do |category|
					link_to category.name, admin_category_path(category)
				end
				column :description
			end
		end
		active_admin_comments
	end

	sidebar "Details", only: :show do
		attributes_table_for product do
			row :name
			row :price
			row :time
			row :description
			row :picture do
				image_tag product.picture, size: "70x50"
			end
		end
	end

	filter :name, :label => "Nombre"
	filter :categories, :label => "Categorías"
	filter :time, :label => "Tiempo de Cocción"
	filter :price, :label => "Ṕrecio"
	filter :created_at, :label => "Fecha de Creación"

	index do |product|
		selectable_column
		column :id
		column :name
		column :description
		column :time
		column :price
		column :created_at
		actions
	end

	index as: :grid do |product|
		link_to "#{product.picture}" do
			image_tag product.picture, size: "100x80"
		end
	# link_to image_tag(product.picture), admin_product_path(product)
	end

end





