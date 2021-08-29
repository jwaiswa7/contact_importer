require "rails_helper"

RSpec.describe "Contacts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      user = FactoryBot.create :user
      sign_in user
      get "/contacts"
      expect(response).to have_http_status(:success)
    end
  end
end
