require "rails_helper"

RSpec.describe UploadError, type: :model do
  let(:upload_error) { FactoryBot.create :upload_error }

  it "is not valid without details" do
    upload_error.details = nil
    expect(upload_error).not_to be_valid
  end

  it "is not valid without contact upload" do
    upload_error.contact_upload = nil
    expect(upload_error).not_to be_valid
  end

  it "is not valid without a row" do
    upload_error.upload_row = nil
    expect(upload_error).not_to be_valid
  end

  it "is valid" do
    expect(upload_error).to be_valid
  end
end
