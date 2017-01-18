class AddRemarkToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :remark, :text
  end
end
