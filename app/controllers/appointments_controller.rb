class AppointmentsController < ApplicationController
  def index
    @doctor = Doctor.find(params[:doctor_id])
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

  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = Appointment.find(params[:id])
    @appointment.doctor = @doctor
    @appointment.destroy
    redirect_to doctor_appointments_path(@doctor)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:date, :patient_id)
  end
end
