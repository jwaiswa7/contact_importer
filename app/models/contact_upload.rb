class ContactUpload < ApplicationRecord
  belongs_to :user

  include FileUploader::Attachment[:file]

  validates :file, presence: true

  include AASM

  aasm column: :status do
    state :on_hold, initial: true
    state :processing
    state :failed
    state :finished

    event :process do
      transitions from: :on_hold, to: :processing
    end

    event :fail do
      transitions from: :processing, to: :failed
    end

    event :finish do
      transitions from: :processing, to: :finished
    end
  end

  store_accessor :data_columns, :email, :name, :date_of_birth, :telephone, :address, :credit_card

  has_defaults(
    data_columns: proc {
      {
        "name": nil,
        "email": nil, 
        "date_of_birth": nil,
        "telephone": nil,
        "address": nil,
        "credit_card": nil
      }
    },
  )
end
