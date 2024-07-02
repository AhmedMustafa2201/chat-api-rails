require 'swagger_helper'

RSpec.describe 'chats', type: :request do

  path '/applications/{application_token}/chats' do
    # You'll want to customize the parameter types...
    parameter name: 'application_token', in: :path, type: :string, description: 'application_token'

    post('create chat') do
      response(200, 'successful') do
        let(:application_token) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
