class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

def new
  @manager = Manager.new
end



  # GET /managers/1/edit
  def edit
  end

  def show
    @manager = Manager.find(params[:id])
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
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
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
      @manager = Manager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manager_params
      params.require(:manager).permit(:name, :user_id)
    end
end
