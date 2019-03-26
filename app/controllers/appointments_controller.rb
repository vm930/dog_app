class AppointmentsController < ApplicationController
    def index
        if params[:appt_search]
            @appointments = Appointment.where(title:  params[:appt_search])
        else
            @appointments = Appointment.all
        end
    end

    def new
      if current_user.class.model_name.name == "Dog"
        @appointment = Appointment.new
        @dogs = Dog.all
        render :new
      else
        flash[:appt_notice] = "You do not have access to create appointment"
        redirect_to appointments_path
      end
    end

    def show
        @appointment = Appointment.find(params[:id])
        @users = User.all
    end

    def create
        appointment = Appointment.create(appointment_params)
        if appointment.valid?
            redirect_to appointments_path
        else
            flash[:appt_errors] = appointment.errors.full_messages
            redirect_to new_appointment_path
        end

    end

    def edit
        @appointment = Appointment.find(params[:id])
        @dogs = Dog.all
    end

    def update
        appointment = Appointment.find(params[:id])
        appointment.update(appointment_params)
        if appointment.valid?
            redirect_to appointment_path(appointment)
        else
            flash[:appt_errors] = appointment.errors.full_messages
            redirect_to edit_appointment_path
        end
    end

    def destroy
      @appointment = Appointment.find(params[:id])
      if current_user[:id] == @appointment.dog_id
        @appointment.destroy
        redirect_to appointments_path
      else
        flash[:cant_delete] = "This dog can not delete this appointment"
        redirect_to appointment_path(@appointment.id)
      end
    end

    def appointment_toggle
      @appointment = Appointment.find(params[:id])
      @appointment.user_id = current_user[:id]
      @appointment.save
      redirect_to appointment_path(@appointment.id)
    end

    private
    def appointment_params
        params.require(:appointment).permit(:title,:category,:dog_id,:location,:price,:description,:user_id, :date)
    end
end
