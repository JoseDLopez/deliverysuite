ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Ultimos Productos Agregados" do
          ul do
            Product.last(5).map do |p|
              li link_to(p.name, admin_product_path(p))
            end
          end
        end
      end

      column do
        panel "Ultimos Pedidos" do
          ul do
            Order.last(5).map do |o|
              li link_to(o.client.name, admin_product_path(o))
            end
          end
        end
      end


    end
  end # content
end
