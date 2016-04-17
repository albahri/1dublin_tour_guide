class CreateTourists < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
