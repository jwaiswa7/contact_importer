class UploadError < ApplicationRecord
  belongs_to :contact_upload

  validates :details, :upload_row, presence: true
  validates :upload_row, numericality: { greater_than: 0 }
end
