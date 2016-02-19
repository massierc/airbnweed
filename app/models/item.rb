class Item < ActiveRecord::Base
  belongs_to :user
  has_many :deals
  validates :name, inclusion: { in: DRUGS }
  validates :name, uniqueness: { scope: "user_id", message: "You can't deal the same drug twice" }
  validates :price, presence: true
end
