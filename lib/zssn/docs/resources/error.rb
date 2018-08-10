module Zssn
  module Docs
    module Resources
      class Error
        include Swagger::Blocks

        swagger_schema :Error do
          property :errors, type: :array, required: true do
            items do
              key :type, :string
            end
          end
        end
      end
    end
  end
end
