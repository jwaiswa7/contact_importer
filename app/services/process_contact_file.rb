class ProcessContactFile
  require "csv"

  def initialize(contact)
    @contact_upload = ContactUpload.find(contact)
    if Rails.env.production?
      @file = @contact_upload.file_url
    else
      @file = Rails.root.join("public#{@contact_upload.file_url}")
    end
  end

  def call
    @contact_upload.process! unless @contact_upload.status == "processing"
    
    file = File.open(@file, "r:ISO-8859-1")
    rows = CSV.parse(file)
    errors = []
    rows.each_with_index do |contact_row, index|
      contact = Contact.new(
        name: contact_row[@contact_upload.name.to_i],
        date_of_birth: contact_row[@contact_upload.date_of_birth.to_i],
        phone: contact_row[@contact_upload.telephone.to_i],
        address: contact_row[@contact_upload.address.to_i],
        credit_card: contact_row[@contact_upload.credit_card.to_i],
        email: contact_row[@contact_upload.email.to_i],
        user_id: @contact_upload.user_id,
      )
      contact.save!
    rescue StandardError => e
      errors << e
      UploadError.create(details: e, upload_row: index, contact_upload: @contact_upload)
    end

    if rows.count == errors.count
      @contact_upload.fail!
    else
      @contact_upload.finish!
    end
  end
end
