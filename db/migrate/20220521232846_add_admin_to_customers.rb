class AddAdminToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :admin, :boolean, default: falseboolean
  end
end
