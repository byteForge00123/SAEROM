class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: %i[show edit update destroy]

  def index
    @prescriptions = Prescription.includes(:patient, :doctor).order(prescribed_on: :desc)
  end

  def show
  end

  def new
    @prescription = Prescription.new
    @prescription.prescription_items.build
  end

  def create
    @prescription = Prescription.new(prescription_params)
    if @prescription.save
      redirect_to @prescription, notice: "Prescription created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @prescription.update(prescription_params)
      redirect_to @prescription, notice: "Prescription updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @prescription.destroy
    redirect_to prescriptions_path, notice: "Prescription removed."
  end

  private

  def set_prescription
    @prescription = Prescription.find(params[:id])
  end

  def prescription_params
    params.require(:prescription).permit(:patient_id, :doctor_id, :prescribed_on, :notes, prescription_items_attributes: %i[id medication dosage frequency duration instructions _destroy])
  end
end
