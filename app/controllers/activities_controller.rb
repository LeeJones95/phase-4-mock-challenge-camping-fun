class ActivitiesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_bad_message
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_bad_message
        
    def index
        
            render json: Activity.all
        end
    
        def destroy
            activity = Activity.find(params[:id])
            activity.destroy

            head :no_content
        end


    private
    
    # def record_not_found_bad_message(invalid)
    #     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    # end

    def record_not_found_bad_message(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end


end
