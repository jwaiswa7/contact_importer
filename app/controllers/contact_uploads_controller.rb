class ContactUploadsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: %i[edit update]

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

  def edit; end

  def update
    if @contact_upload.update(contact_upload_params)
      ProcessFileJob.perform_async(@contact_upload.id)
      format.html { redirect_to contacts_path, notice: "Processing File" }
    else
    end

  end

  private

  def set_contact
    @contact_upload = ContactUpload.find(params[:id])
  end

  def contact_upload_params
    params.require(:contact_upload).permit(:file, :name, :email,  :date_of_birth, :telephone, :address, :credit_card)
  end
end
