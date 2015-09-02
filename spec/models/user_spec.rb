require 'rails_helper'

describe User do
  before {@user = FactoryGirl.build(:user)}

  it "responds to email" do
    expect(@user).to respond_to(:email)
    expect(@user).to respond_to(:password)
    expect(@user).to respond_to(:password_confirmation)

    expect(@user).to be_valid

  end

end
