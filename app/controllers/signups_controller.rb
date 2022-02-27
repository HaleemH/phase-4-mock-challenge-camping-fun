class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  def create
    signup = Signup.create!(signup_params)
    render json: Activity.find_by(id: params[:activity_id]) , status: :created
  end

  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end

  def invalid_entry(invalid)
    render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
