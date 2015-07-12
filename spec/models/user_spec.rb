require 'rails_helper'

describe User do
  it "is valid with a name, email and password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  describe 'password' do
    context 'with valid attributes' do
      it "is valid with a password of seven characters" do
        user = build(:user, password: "a" * 7, password_confirmation: "a" * 7)
        expect(user).to be_valid
      end
    end

    context 'with invalid attributes' do
      it "is invalid with a password of five characters" do
        user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(user).not_to be_valid
      end
      it "is invalid with a password of thirteen characters" do
        user = build(:user, password: "a" * 13, password_confirmation: "a"     * 13)
        expect(user).not_to be_valid
      end
    end
  end


  it "is invalid with duplicate email address" do
    create(:user,
      email: 'test@gmail.com')
    user = build(:user, email: 'test@gmail.com')
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
