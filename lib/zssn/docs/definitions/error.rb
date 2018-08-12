module Zssn
  module Docs
    module Definitions
      class Error
        include Swagger::Blocks

        swagger_schema :Error do
          key :required, %i(errors)

          property :errors, type: :array do
            items do
              key :type, :string
            end
          end
        end
      end
    end
  end
end
