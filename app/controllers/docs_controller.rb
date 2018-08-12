class DocsController < ApplicationController
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'

    info do
      key :version, '1.0.0'
      key :title, 'ZSSN Api Docs'
      key :description, 'Detailed description: https://github.com/thdurante/zombie-survival-sn'

      contact do
        key :name, 'Thiago Durante - https://github.com/thdurante'
      end
    end

    tag name: 'Survivor', description: 'Survivors operations'
    tag name: 'Infection Alert', description: 'Infection alerts operations'

    key :host, ENV.fetch('CANONICAL_HOST', 'localhost:3000')
    key :basePath, '/api/v1/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    ::Zssn::Docs::Definitions::Survivor,
    ::Zssn::Docs::Definitions::Item,
    ::Zssn::Docs::Definitions::InflectionAlert,
    ::Zssn::Docs::Definitions::Error,
    ::Zssn::Docs::Params::Survivor::CreateParams,
    ::Zssn::Docs::Params::Survivor::UpdateParams,
    ::Zssn::Docs::Params::Survivor::ItemAttribute,
    ::Zssn::Docs::Params::InfectionAlert::CreateParams,
    ::Zssn::Docs::Controllers::SurvivorsController,
    ::Zssn::Docs::Controllers::InfectionAlertsController,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
