class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :total_price
      t.integer :rating
      t.references :item, index: true, foreign_key: true
      t.string :status

      t.timestamps null: false
    end
  end
end
