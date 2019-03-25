class AppointmentsController < ApplicationController
    def index 
        @appointments = Appointment.all
    end 

    def new 
        @appointment = Appointment.new
        @dogs = Dog.all
    end 

    def show 
        @appointment = Appointment.find(params[:id])
        @users = User.all
    end 


    def create 
        appointment = Appointment.create(appointment_params)
        if appointment.valid?
            redirect_to appointment_path(appointment.id)
        else
            flash[:appt_errors] = appointment.errors.full_messages
            redirect_to new_appointment_path
        end
        
    end 

    def update 
        @appointment = Appointment.find(params[:id])
        @appointment.update(appointment_params)
        redirect_to appointment_path(@appointment)
    end

   

    private
    def appointment_params
        params.require(:appointment).permit(:title,:category,:dog_id,:location,:price,:description,:user_id)
    end 
end 
