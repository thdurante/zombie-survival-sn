SwaggerUiEngine.configure do |config|
  config.swagger_url = { v1: '/docs' }
  config.doc_expansion = 'list'
  config.json_editor = true
  config.validator_enabled = true
end
