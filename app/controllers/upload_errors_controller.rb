class UploadErrorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact_upload

  def index
    @pagy, @upload_errors = pagy @contact_upload.upload_errors
  end

  private

  def set_contact_upload
    @contact_upload = ContactUpload.find(params[:upload_id])
  end
end
