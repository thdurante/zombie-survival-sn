module Api
  module V1
    class ReportsController < ::ApplicationController
      before_action :load_report_data

      def infected_survivors
        render json: @data, each_serializer: SurvivorSerializer, status: :ok
      end

      def non_infected_survivors
        render json: @data, each_serializer: SurvivorSerializer, status: :ok
      end

      def average_amount_of_trade_items
        render json: @data, status: :ok
      end

      def points_lost_due_to_infection
        render json: @data, status: :ok
      end

      private

      def load_report_data
        @data = (action_name.camelize + 'Report').constantize.try(:data)
      end
    end
  end
end
