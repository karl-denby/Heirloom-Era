class AddActivationToCustomers < ActiveRecord::Migration[4.2]
  def change
    add_column :customers, :activation_digest, :string
    add_column :customers, :activated, :boolean, default: false
    add_column :customers, :activated_at, :datetime
  end
end
