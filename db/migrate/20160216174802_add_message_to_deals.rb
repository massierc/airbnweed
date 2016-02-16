class AddMessageToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :message, :text
  end
end
