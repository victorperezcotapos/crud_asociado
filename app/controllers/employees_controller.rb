class EmployeesController < ApplicationController

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee.company, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to @employee.company, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def employee_params
    params.require(:employee).permit(:first_name,:last_name,:email,:company_id,:area_id)
  end
end
