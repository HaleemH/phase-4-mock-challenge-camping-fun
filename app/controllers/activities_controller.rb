class ActivitiesController < ApplicationController
  def index
    render json: Activity.all, status: :ok
  end

  def destroy
    delete = Activity.find_by(id: params[:id])
    if delete
      delete.destroy
      render json: delete, status: :ok
    else
        render json: {error: "Activity not found"}, status: :not_found
    end
  end
end
