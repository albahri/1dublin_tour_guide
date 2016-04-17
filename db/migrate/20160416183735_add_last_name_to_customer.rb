class AddLastNameToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :lastName, :string
  end
end
