class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :check_for_existing_employee, only: [:new, :create]
  


def index
  if current_user.employee
    redirect_to current_user.employee
  end
end  


def new
    @employee = Employee.new
end
 




  # GET /employees/1/edit
  def edit
    @employee = current_user.employee
  end

  def show
    # @employee = employee.find(params[:id])
    @employee = current_user.employee
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params.merge(user_id: current_user.id))
    if @employee.save
      redirect_to @employee
    end
   

    # respond_to do |format|
    #   if @employee.save
    #     format.html { redirect_to @employee, notice: 'employee was successfully created.' }
    #     format.json { render :show, status: :created, location: @employee }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @employee.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update 
  @employee.update(employee_params)
  redirect_to @employee
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def addimage
   @employee.image.attach(params[:image])
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = current_user.employee
    end

    def check_for_existing_employee
      if current_user.employee
        redirect_to current_user.employee, notice: "You have already created a profile."
      end
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :city, :state, :about, :user_id, :image)
    end

   
end
