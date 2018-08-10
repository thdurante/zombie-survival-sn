module Zssn
  module Docs
    module Resources
      class Error
        include Swagger::Blocks

        swagger_schema :Error do
          key :required, :errors

          property :errors do
            key :type, :array
            items do
              key :type, :string
            end
          end
        end
      end
    end
  end
end
