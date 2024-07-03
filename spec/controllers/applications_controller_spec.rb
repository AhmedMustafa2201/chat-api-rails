require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do
  let(:valid_attributes) { { name: 'Test Application' } }
  let(:invalid_attributes) { { name: '' } }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Application" do
        expect {
          post :create, params: { application: valid_attributes }
        }.to change(Application, :count).by(1)
      end

      it "renders a JSON response with the new application token" do
        post :create, params: { application: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context "with invalid params" do
      it "does not create a new Application" do
        expect {
          post :create, params: { application: invalid_attributes }
        }.to change(Application, :count).by(0)
      end

      it "renders a JSON response with errors for the new application" do
        post :create, params: { application: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to have_key('name')
      end
    end
  end
end
