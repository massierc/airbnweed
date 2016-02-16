class DeleteWorkingHoursFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :working_hours, :string
  end
end
