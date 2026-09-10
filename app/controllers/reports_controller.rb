class ReportsController < ApplicationController
  def index
    @patient_count = Patient.count
    @doctor_count = Doctor.count
    @appointment_count = Appointment.count
    @invoice_total = Invoice.sum(:amount)
    @monthly_visits = MedicalRecord.group_by_month(:visit_date, format: "%b %Y").count
  end
end
