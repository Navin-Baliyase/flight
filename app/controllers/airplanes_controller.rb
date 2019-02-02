class AirplanesController < ApplicationController
	protect_from_forgery
  def new
		@airplane = Airplane.new
	end

	def create
		@airplane = Airplane.new(airplane_params)
		if @airplane.save
			redirect_to airplanes_path
		else
			flash.now.alert = "Something went wrong ! try again!!"
			render 'new'
		end
	end

  def index
  	@airplanes = Airplane.all
  end

  private
	
	def airplane_params
		params.require(:airplane).permit(:name, :category, :seats, :rows)
	end
end
