module Api
  module V1
    class InfectionAlertsController < ::ApplicationController
      before_action :check_author_existence, only: :create
      before_action :check_infected_survivor_existence, only: :create

      rescue_from ArgumentError, with: :rescue_wrong_params

      def create
        @infection_alert = InfectionAlert.new(infection_alert_params)
        @infection_alert.save ? success_response : error_response(@infection_alert.errors)
      end

      private

      def infection_alert_params
        params.require(:infection_alert).permit(:author_id, :infected_survivor_id)
      end

      def check_author_existence
        @author = Survivor.find_by(id: infection_alert_params.fetch(:author_id))
        raise_error(:author_id) unless @author
      end

      def check_infected_survivor_existence
        @infected_survivor = Survivor.find_by(id: infection_alert_params.fetch(:infected_survivor_id))
        raise_error(:infected_survivor_id) unless @infected_survivor
      end

      def success_response
        render json: @infection_alert, status: :created, location: api_v1_survivor_url(@infected_survivor)
      end

      def error_response(errors)
        render json: { errors: Array(errors) }, status: :unprocessable_entity
      end

      def raise_error(param)
        raise ArgumentError, I18n.t('infection_alerts.wrong_id_param', param: param)
      end

      def rescue_wrong_params(error)
        error_response(error.message)
      end
    end
  end
end
