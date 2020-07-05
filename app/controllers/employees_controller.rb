class EmployeesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @query = current_user.employees.ransack(params[:q])
    @query.sorts = 'created_at desc' if @query.sorts.empty?
    @pagy, @employees = pagy(@query.result, items: ApplicationRecord::PER_PAGE)
  end

  def show; end

  def new
    @employee = current_user.employees.new
  end

  def create
    @employee = current_user.employees.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: "Employee successfully created."}
      else
        flash.now[:errors] = "Invalid record"
        format.html { render 'new'}
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: "Employee successfully updated."}
      else
        flash.now[:errors] = "Invalid record"
        format.html { render 'edit'}
      end
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = current_user.employees.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:age, :designation, :first_name, :gender, :last_name,)
  end

end
