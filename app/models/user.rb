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

  def self.create_from_omniauth(params)
    user = find_or_create_by(email: params.info.email)
    me = Facebook.get_object(params.credentials.token, "me")
    user.update({
      uid: params.info.uid,
      token: params.credentials.token,
      name: params.info.name,
      avatar: params.info.image,
      confirmed_at: DateTime.now
    })
    user
  end

  private
    def take_name
      self.name = self.email.split("@")[0]
    end
end
