class LeadsController < ApplicationController
	def create 					
		@lead = Lead.new lead_params
		respond_to do |format|
			if Lead.find_by_email(@lead.email).blank?			
				if @lead.save				
					cookies[:save_lead] = true
					format.html { redirect_to root_path}
					format.js
				else
					format.html { redirect_to root_path }
					format.js
				end			
			else 
				format.html { redirect_to root_path, :alert => "Actualmente estas suscrito!"}
				format.js
			end
		end
	end 

	private 

	def lead_params
		params.require(:lead).permit(:email, :device, :country)			
	end	
	
end