class RenameNameToAddressNameInAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :name, :address_name
  end
end
