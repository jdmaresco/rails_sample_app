class SessionsController < ApplicationController

	def new
	end 

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#sign in and redirect
		else
			#error msg and rerender
		end
	end
	
	def destroy
	end
end
