require 'rails_helper'

RSpec.describe "UploadErrors", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/upload_errors/index"
      expect(response).to have_http_status(:success)
    end
  end

end
