class Lead < ActiveRecord::Base
	validates :email, :device, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	after_save :suscribe

	def suscribe
		# For mailchimp 
		# 
		@list_id = "824042cb7d"

		gb = Gibbon::API.new

		gb.lists.subscribe({
			:id => @list_id,
			:email => {:email => self.email},
			:merge_vars => {
				:DEVICE => self.device,
				:COUNTRY => self.country,
				:DATES => DateTime.now.to_date
			},
			:double_optin => false,
			:send_welcome => false
		})

		# End
	end	
		
end
