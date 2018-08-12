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

    tag do
      key :name, 'Survivor'
      key :description, 'Survivors operations'
    end

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
    ::Zssn::Docs::Controllers::SurvivorsController,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
