class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:linkedin]
  acts_as_taggable_on :tags
  has_many :messages

  def self.find_for_linkedin_oauth(auth)
    #TODO Add
    user_params = auth.to_h.slice(:uid, :provider)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:linkedin_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    # user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
     user.update(user_params)
    else
     user = User.new(user_params)
     user.password = Devise.friendly_token[0,20]  # Fake password for validation
     user.save
    end

    return user
  end
end
