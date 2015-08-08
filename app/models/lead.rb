class Lead < ActiveRecord::Base
	validates :email, :device, presence: true
end
