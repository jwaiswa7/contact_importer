class ProcessFileJob
  include Sidekiq::Worker
  sidekiq_options queue: "default"

  def perform(contact_upload_id)
    ProcessContactFile.new(contact_upload_id).call
  end
end
