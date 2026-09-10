class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :patient, :doctor, :appointment_date, :start_time, :end_time, :appointment_type, :reason_for_visit, presence: true
  validates :status, inclusion: { in: %w[scheduled confirmed in_progress completed cancelled no_show] }

  scope :upcoming, -> { where("appointment_date >= ?", Date.current).order(:appointment_date, :start_time) }
  scope :for_today, -> { where(appointment_date: Date.current).order(:start_time) }

  def duration_minutes
    ((end_time - start_time) / 60).to_i
  end
end
