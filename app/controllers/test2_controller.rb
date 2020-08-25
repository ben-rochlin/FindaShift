class Test2Controller < ApplicationController

    def show
    end

    def listings
      @jobs = Job.where(company_id: current_user.company.id)
    
    end

    def view
      @job = Job.find(params[:id])
    
      
    end

end