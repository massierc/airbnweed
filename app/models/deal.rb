class Deal < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :item_id
end
