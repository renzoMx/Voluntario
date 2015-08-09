class LeadsController < ApplicationController
	def create 			
		@lead = Lead.new lead_params

		respond_to do |format|
			if @lead.save
				cookies[:save_lead] = true
				format.html { redirect_to root_path }
				format.js							
			else
				format.html { redirect_to root_path, alert: "No pudo registrarse" }	
			end
		end
	end 

	private 

	def lead_params
		params.require(:lead).permit(:email, :device, :country)			
	end
	
end