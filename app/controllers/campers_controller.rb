class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_entity
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entity

  def index
    render json: Camper.all.to_json , status: :ok
  end

  def show
    render json: Camper.find_by!(id: params[:id]), status: :ok
   
  end

  def create
    camper = Camper.create!(camper_params)
      render json: camper, status: :created
  end

  private

  def not_found_entity
    render json: { error: 'Camper not found' }, status: :not_found
  end

  def invalid_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def camper_params
    params.permit(:name, :age)
  end
end
