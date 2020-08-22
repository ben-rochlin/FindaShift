class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]
  before_action :check_for_existing_manager, only: [:new, :create]
  before_action :current_user


def index
  if current_user.manager
    redirect_to current_user.manager
  end
end  


def new
    @manager = Manager.new
end
 




  # GET /managers/1/edit
  def edit
    @manager = current_user.manager
  end

  def show
    # @manager = Manager.find(params[:id])
    @manager = current_user.manager
  end

  # POST /managers
  # POST /managers.json
  def create
    @manager = Manager.new(manager_params.merge(user_id: current_user.id))
    if @manager.save
      redirect_to @manager
    end
   

    # respond_to do |format|
    #   if @manager.save
    #     format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
    #     format.json { render :show, status: :created, location: @manager }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @manager.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update 
  @manager.update(manageredit_params)
  redirect_to @manager
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = current_user.manager
    end

    def check_for_existing_manager
      if current_user.manager
        redirect_to current_user.manager, notice: "You have already created a profile."
      end
    end

    # Only allow a list of trusted parameters through.
    def manager_params
      params.require(:manager).permit(:name, :user_id)
    end

    def manageredit_params
      params.require(:manager).permit(:name, :user_id)
    end
end
