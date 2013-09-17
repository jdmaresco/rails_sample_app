class MicropostsController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: :destroy

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		redirect_to root_url
	end

	private
		def micropost_params
			params.require(:micropost).permit(:content)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])	# find_by returns nil when micropost doesn't exist
			redirect_to root_url if @micropost.nil?
		end

		################### alternate correct_user function using find and exceptions
		# def correct_user
		# 	@micropost = current_user.microposts.find(params[:id])			# find raises an exception when micropost doesn't exist
		# rescue
		#  	redirect_to root_url
		# end
end