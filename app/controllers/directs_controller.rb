class DirectsController < ApplicationController
	before_action :set_direct, only: [:destroy]

	# GET /directs
	# GET /directs.json
	def index
		@directs = Direct.where user_id: current_user.id
	end

	# POST /directs
	# POST /directs.json
	def create
		@direct = Direct.new(direct_params.merge({user_id: current_user.id}))
		@direct.save
		respond_with @direct, status: :created
	end

# DELETE /directs/1
# DELETE /directs/1.json
	def destroy
		@direct.destroy
		respond_with @direct
	end

	private
# Use callbacks to share common setup or constraints between actions.
	def set_direct
		@direct = Direct.find([current_user.id, params[:id]])
	end

# Never trust parameters from the scary internet, only allow the white list through.
	def direct_params
		params.require(:direct).permit(:direct_id)
	end

end
