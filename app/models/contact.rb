class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_birth, :phone, :address, :credit_card, :franchise, :email, presence: true

  validates :user, uniqueness: { scope: :email }

  validates :phone, length: { minimum: 19, maximum: 19 }

  validates :name, format: { with: /\A[a-zA-Z0-9 -]+\z/ }
  validates :email, format: { with: Devise.email_regexp }
  validates :phone, format: { with: /\A[- +()0-9]+\z/ }

  before_validation :set_franchise, on: :create

  protected

  def set_franchise
    return if credit_card.nil?

    detector = CreditCardValidations::Detector.new(credit_card)
    self.franchise = detector.brand
  end
end
