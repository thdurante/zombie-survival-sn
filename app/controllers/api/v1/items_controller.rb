module Api
  module V1
    class ItemsController < ::ApplicationController
      def trade
        TraderService.call(trade_params)
        render json: fetch_items, status: :ok
      rescue ActiveRecord::RecordNotFound => error
        error_response(error.message, :unprocessable_entity)
      rescue Zssn::InfectedSurvivors, Zssn::DifferentTradePoints, Zssn::InsuficientTradeItems => error
        error_response(error.message, :forbidden)
      end

      private

      def error_response(message, status)
        render json: { errors: Array(message) }, status: status
      end

      def trade_params
        params.require(:trade).permit(
          survivor_1: %i(id water food medication ammunition),
          survivor_2: %i(id water food medication ammunition)
        ).to_h
      end

      def fetch_items
        @survivor_1 = Survivor.find(trade_params.fetch(:survivor_1, {}).fetch(:id, nil))
        @survivor_2 = Survivor.find(trade_params.fetch(:survivor_2, {}).fetch(:id, nil))

        @survivor_1.reload.items + @survivor_2.reload.items
      end
    end
  end
end
