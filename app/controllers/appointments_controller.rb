class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.doctor = @doctor
    if @appointment.save
      redirect_to doctor_path(@doctor)
    else
      render :new
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
