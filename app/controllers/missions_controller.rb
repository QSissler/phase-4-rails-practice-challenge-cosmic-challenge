class MissionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

    def create
        mission = Mission.create!(mission_params)
        render json: mission.planet, status: :created
    end

    private

    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end

    def invalid(error)
        render json: { "errors": [error.message] }, status: :unprocessable_entity
    end

end
