require "rails_helper"

RSpec.describe User, type: :model do
  
  let(:user) { FactoryBot.create(:user) }

  it "validates presence of the email" do 
  	user.email = nil 
  	expect(user).not_to be_valid
  end

  it "is a valid record" do 
  	expect(user).to be_valid
  end
end
