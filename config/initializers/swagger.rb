
# config/initializers/swagger.rb

class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "apidocs/#{path}"
  end

  def self.base_api_controller
    puts 'we are here'
    ActionController::API
  end
end

Swagger::Docs::Config.base_api_controller = ActionController::API

Swagger::Docs::Config.register_apis({
                                        'v1' => {
                                            controller_base_path: '/api/v1',
                                            api_file_path: 'public/api/v1',
#                                            base_path: 'http://localhost:3000/api/v1',
                                            clean_directory: true
                                        }
                                    })