class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:facebook]
  
	def self.from_omniauth(auth)
	      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	        user.email = auth.info.email
	        user.password = Devise.friendly_token[0,20]
	        user.first_name = auth.info.first_name
	        user.last_name = auth.info.last_name
	      end
	end

	def sudo?
		self.type == "Sudo" ? true : false
	end 

end


class Sudo < User
	#TODO 
	#I'm going to use SUDO Sper-User-DO becuase Admin module is being used with the Administrate gem
end 