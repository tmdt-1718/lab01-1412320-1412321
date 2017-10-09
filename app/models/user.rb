class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :images, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  before_create :take_name

  def self.create_from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.avatar = auth.info.image + "?type=large"
      user.uid = auth.info.uid
      user.confirmed_at = DateTime.now
      user.save
      user.name = auth.info.name
      user.save
    end
  end


  private
    def take_name
      self.name = self.email.split("@")[0]
    end
end
