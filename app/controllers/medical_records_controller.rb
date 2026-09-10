class MedicalRecordsController < ApplicationController
  before_action :set_medical_record, only: %i[show edit update destroy]

  def index
    @medical_records = MedicalRecord.includes(:patient, :doctor).order(visit_date: :desc)
  end

  def show
  end

  def new
    @medical_record = MedicalRecord.new
  end

  def create
    @medical_record = MedicalRecord.new(medical_record_params)

    if @medical_record.save
      redirect_to @medical_record, notice: "Medical record saved."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @medical_record.update(medical_record_params)
      redirect_to @medical_record, notice: "Medical record updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medical_record.destroy
    redirect_to medical_records_path, notice: "Medical record removed."
  end

  private

  def set_medical_record
    @medical_record = MedicalRecord.find(params[:id])
  end

  def medical_record_params
    params.require(:medical_record).permit(:patient_id, :doctor_id, :visit_date, :chief_complaint, :symptoms, :diagnosis, :treatment, :clinical_notes, :follow_up_instructions)
  end
end
