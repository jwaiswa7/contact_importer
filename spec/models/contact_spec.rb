require "rails_helper"

RSpec.describe Contact, type: :model do
  let(:contact) do
    user = FactoryBot.create :user
    contact = FactoryBot.build :contact
    contact.user = user
    contact.save
    contact
  end

  it "is not valid without a name" do
    contact.name = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without a date of date_of_birth" do
    contact.date_of_birth = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without a phone" do
    contact.phone = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without an address" do
    contact.address = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without a credit card" do
    contact.credit_card = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without a franchise" do
    contact.franchise = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without an email" do
    contact.email = nil
    expect(contact).not_to be_valid
  end

  it "is not valid without a valid email" do
    contact.email = "wrong email"
    expect(contact).not_to be_valid
  end

  it "name should not have special characters" do
    contact.name = "John*Doe"
    expect(contact).not_to be_valid
  end

  it "has contact owner and email unique" do
    new_contact = FactoryBot.build :contact
    new_contact.email = contact.email
    new_contact.user = contact.user
    expect(new_contact).not_to be_valid
  end

  it "is a valid phone number" do
    contact.phone = "+57 XXX"
    expect(contact).not_to be_valid
  end

  it "is a valid credit card number" do 
  	contact.credit_card = "12345"
  	expect(contact).not_to be_valid
  end

  it "is a valid contact" do
    expect(contact).to be_valid
  end
end
