module Api
  module V1
    class SurvivorsController < ::ApplicationController
      before_action :set_survivor, only: %i(show update destroy)

      def index
        @survivors = Survivor.all
        render json: @survivors
      end

      def show
        render json: @survivor
      end

      def create
        @survivor = Survivor.new(create_survivor_params)
        @survivor.save ? (render json: @survivor, status: :created, location: survivor_location) : error_response
      end

      def update
        @survivor.update(update_survivor_params) ? (render json: @survivor) : error_response
      end

      def destroy
        @survivor.destroy
      end

      private

      def survivor_location
        api_v1_survivor_url(@survivor)
      end

      def set_survivor
        @survivor = Survivor.find(params[:id])
      end

      def create_survivor_params
        params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude, items_attributes: [:kind])
      end

      def update_survivor_params
        params.require(:survivor).permit(:latitude, :longitude)
      end

      def error_response
        render json: { errors: @survivor.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
end
