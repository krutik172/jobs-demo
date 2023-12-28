class CreatePurchaseHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.string :stripe_charge_id
      t.timestamps
    end
  end
end
