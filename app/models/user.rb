class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
				 :confirmable

  # Setup accessible (or protected) attributes for your model
	include ActiveModel::MassAssignmentSecurity

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :as => :admin

	def to_s
		"#{email} (#{admin? ? "Admin" : "User"})"
	end

	def assign_attributes(values, options = {})
		sanitize_for_mass_assignment(values, options[:as]).each do |k, v|
			send("#{k}=", v)
		end
	end

end
