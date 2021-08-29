require 'rails_helper'

RSpec.describe "ContactUploads", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/contact_uploads/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/contact_uploads/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /process" do
    it "returns http success" do
      get "/contact_uploads/process"
      expect(response).to have_http_status(:success)
    end
  end

end
