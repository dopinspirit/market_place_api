require 'rails_helper'

describe User do
  before {@user = FactoryGirl.build(:user)}

  it "responds to email" do
    expect(@user).to respond_to(:email)
    expect(@user).to respond_to(:password)
    expect(@user).to respond_to(:password_confirmation)

    expect(@user).to be_valid

  end

  it "validates empty email" do
    allow(@user).to receive(:email).and_return(" ")
    expect(@user).to_not be_valid
  end

  it 'validate presence of email' do
    should validate_presence_of(:email)
  end
  it 'validate uniqueness of email' do
    should validate_uniqueness_of(:email)
  end
  it 'validate confirmation of email' do
    should validate_confirmation_of(:password)
  end
  it 'validate presence of email' do
    should allow_value('example@domain.com').for(:email)
  end

end
