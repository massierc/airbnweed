DRUGS = ["cocaïne", "weed", "MDMA", "Cartes Pokémon"]

class Item < ActiveRecord::Base
  belongs_to :user
  has_many :deals
  validates :name, inclusion: { in: DRUGS }
end
