class DashboardController < ApplicationController
  def index
    @appointments = Appointment.includes(:patient, :doctor).order(:appointment_date, :start_time).limit(5)
    @patients = Patient.active.order(:created_at).limit(6)
    @doctors = Doctor.order(:name).limit(4)
    @revenue = Invoice.sum(:amount)
    @pending_payments = Invoice.where(payment_status: ["pending", "partial"]).count
    @today_appointments = Appointment.for_today.count
  end
end
