class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :omniauthable

     	before_save :ensure_authentication_token

		validates :password, length: {minimum: 6}

		def skip_confirmation!
		  self.confirmed_at = Time.now
		end
end
