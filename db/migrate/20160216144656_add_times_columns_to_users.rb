class AddTimesColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :start_time, :integer
    add_column :users, :end_time, :integer
  end
end
