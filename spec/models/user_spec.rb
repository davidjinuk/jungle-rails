require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should validate with all validations" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "emailemail@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to be_valid
    end

    it "should have a secure password" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "BAD"
      })
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "should have unique email" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      @user2 = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it "should have an email" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have a first name" do
      @user = User.create({
        last_name: "last name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "should have a last name" do
      @user = User.create({
        first_name: "first name",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "should have a minimum password length of 5" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "email@email.com",
        password: "BAD",
        password_confirmation: "BAD"
      })
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe ".authenticate_with_credentials" do
    it "should have the credentials" do
      @user = User.create({
        first_name: "first name",
        last_name: "last name",
        email: "email90@email.com",
        password: "password",
        password_confirmation: "password"
      })
    User.authenticate_with_credentials(@user.email, @user.password)
    expect(@user.present?).to be true
    end
  end

end