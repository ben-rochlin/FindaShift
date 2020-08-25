class ListingsController < ApplicationController

    def index
        @jobs = Job.where(company_id: current_user.company.id)
      
    end


end