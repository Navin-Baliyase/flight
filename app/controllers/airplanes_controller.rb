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

	def show
		@airplane = Airplane.find(params[:id])
	end

	def book
		@airplane = Airplane.find(params[:booking][:airplane_id])
		if @airplane
			@booking = Booking.create!(booking_params)
			if @booking.save
				NotificationMailer.notification_mailer(@booking,@airplane,current_user).deliver
				flash.now.notice = "Your booking was successfull, An email has been sent to you with the booking details."
				if @airplane.seats*50/100 < @airplane.bookings.count
			       @airplane.update_columns(price: @airplane.price + @airplane.price*10/100) 
			    end
			else
				flash.now.alert = "Seats are already filled"
				redirect_to root_path
			end
		else
			flash.now.alert = "Flight has been chancelled"
			redirect_to root_path
		end
	end


	def ticket
		respond_to do |format|
			format.html
			format.pdf do
        render pdf: "ticket"   # Excluding ".pdf" extension.
    end
end
end

def search
	@airplanes = Airplane.search(params[:search])
end


private

def airplane_params
	params.require(:airplane).permit(:name, :category, :seats, :rows, :source, :destination, :price)
end

def booking_params
	params.require(:booking).permit(:name, :status, :airplane_id, :pnr, :passport_id, :passenger1, :passenger2, :age)
end
end
