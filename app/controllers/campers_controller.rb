class CampersController < ApplicationController
# rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_bad_message
# rescue_from ActiveRecord::RecordNotFound, with: :record_invalid_bad_message

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_bad_message
rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_bad_message
    # GET /campers
    def index
        campers = Camper.all
        render json: campers
    end

    # GET /campers/:id
def show
    camper = Camper.find(params[:id])
    render json: camper
end

# POST /campers
def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
end


private

def camper_params
    params.permit(:name, :age)
end


# def record_not_found_bad_message(invalid)
#     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
# end

# def record_invalid_bad_message(invalid)
#     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
# end

def record_not_found_bad_message(exception)
    render json: { error: "#{exception.model} not found" }, status: :not_found
end

def record_invalid_bad_message(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
end


end