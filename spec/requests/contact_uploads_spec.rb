require "rails_helper"

RSpec.describe "ContactUploads", type: :request do
  describe "GET /new" do
    it "returns http success" do
      user = FactoryBot.create :user
      sign_in user
      get "/contact_uploads/new"
      expect(response).to have_http_status(:success)
    end
  end
end
