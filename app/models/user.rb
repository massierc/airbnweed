class User < ActiveRecord::Base
  has_attachment :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :items
  has_many :deals, through: :items
  has_many :orders, class_name:'Deal'

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def name
    self.first_name = nil if self.first_name == ""
    self.last_name = nil if self.last_name == ""
    if self.first_name.nil? || self && self.last_name.nil?
      return "Anonymous"
    elsif self.first_name.nil?
      return self.last_name
    elsif self.last_name.nil?
      return self.first_name
    else
      return self.first_name + " " + self.last_name
    end
  end

  def full_address
    "#{address}, #{zipcode} #{city}"
  end

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

end
