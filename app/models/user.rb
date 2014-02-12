class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	def to_s
		if admin?
			"#{email} (Admin)"
		else
			"#{email} (User)"
		end	
    end
end
