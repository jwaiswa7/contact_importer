class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :date_of_birth, :phone, :address, :credit_card, :franchise, :email, presence: true

  validates :user, uniqueness: { scope: :email }

  validates :phone, length: { minimum: 19, maximum: 19 }

  validates :name, format: { with: /\A[a-zA-Z0-9 -]+\z/ }
  validates :email, format: { with: Devise.email_regexp }
  validates :phone, format: { with: /\A[- +()0-9]+\z/ }

  before_validation :set_franchise, on: :create

  validate :valid_credit_card_number

  private

  def valid_credit_card_number
    errors.add(:credit_card, 'is invalid') if branch.nil?
  end

  def set_franchise
    self.franchise = branch
  end

  def branch
    case credit_card
    when /4[0-9]{12}(?:[0-9]{3})?/
      "Visa"
    when /5[1-5][0-9]{14}/
      "MasterCard"
    when /6(?:011|5[0-9][0-9])[0-9]{12}/
      "Discover"
    when /3[47][0-9]{13}/
      "American Express"
    when /3(?:0[0-5]|[68][0-9])[0-9]{11}/
      "Diners"
    when /(?:2131|1800|35\d{3})\d{11}/
      "JCB"
    end
  end
end
