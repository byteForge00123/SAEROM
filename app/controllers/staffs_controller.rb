class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit update destroy]

  def index
    @staffs = Staff.includes(:user).order(:name)
  end

  def show
  end

  def new
    @staff = Staff.new
  end

  def create
    @staff = Staff.new(staff_params)
    if @staff.save
      redirect_to @staff, notice: "Staff profile created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @staff.update(staff_params)
      redirect_to @staff, notice: "Staff profile updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @staff.destroy
    redirect_to staffs_path, notice: "Staff entry removed."
  end

  private

  def set_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:user_id, :name, :role, :department, :email, :phone, :status)
  end
end
