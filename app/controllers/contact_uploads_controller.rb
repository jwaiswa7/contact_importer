class ContactUploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @pagy, @contact_uploads = pagy current_user.contact_uploads.order("created_at DESC")
  end

  def new
    @contact_upload = ContactUpload.new
  end

  def create
    @contact_upload = current_user.contact_uploads.new(contact_upload_params)

    respond_to do |format|
      if @contact_upload.save
        format.html { redirect_to contact_uploads_path, notice: "File successfuly uploaded" }
      else
        format.html { render :new }
        format.json { render json: @contact_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_upload_params
    params.require(:contact_upload).permit(:file)
  end
end
