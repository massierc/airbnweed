class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :photo
      t.boolean :in_stock
      t.integer :price
      t.references :user_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
