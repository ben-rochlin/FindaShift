class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :check_for_existing_company, only: [:new, :create]
  before_action :current_user


def index
  if current_user.company
    redirect_to current_user.company
  end
end  


def new
    @company = Company.new
end
 




  # GET /companys/1/edit
  def edit
    @company = current_user.company
  end

  def show
    # @company = company.find(params[:id])
    @company = current_user.company
  end

  # POST /companys
  # POST /companys.json
  def create
    @company = Company.new(company_params.merge(user_id: current_user.id))
    if @company.save
      redirect_to @company
    end
   

    # respond_to do |format|
    #   if @company.save
    #     format.html { redirect_to @company, notice: 'company was successfully created.' }
    #     format.json { render :show, status: :created, location: @company }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @company.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /companys/1
  # PATCH/PUT /companys/1.json
  def update 
  @company.update(company_params)
  redirect_to @company
  end

  # DELETE /companys/1
  # DELETE /companys/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companys_url, notice: 'company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = current_user.company
    end

    def check_for_existing_company
      if current_user.company
        redirect_to current_user.company, notice: "You have already created a profile."
      end
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :website, :email, :city, :state, :about, :logo, :user_id)
    end

  
end

