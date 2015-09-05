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

  it { should respond_to(:auth_token) }

  it { should validate_uniqueness_of(:auth_token)}

  describe "#generate_authentication_token!" do

    it "generates a unique token" do
      allow(Devise).to receive(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end

  end

end
