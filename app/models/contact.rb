class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_birth, :phone, :address, :credit_card, :franchise, :email, presence: true

  validates :name, format: { with: /\A[a-zA-Z0-9 -]+\z/ }
  validates :email, format: { with: Devise.email_regexp }

  before_validation :set_franchise, on: :create

  private

  def set_franchise
  	return nil if self.credit_card.nil?
  	detector = CreditCardValidations::Detector.new(self.credit_card)
    self.franchise = detector.brand
  end
end
