class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :items
  has_many :deals, through: :items
  has_many :orders, class_name:'Deal'

  def name
    return self.first_name + " " + self.last_name
  end
end
