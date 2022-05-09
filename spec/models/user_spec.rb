require 'rails_helper'
require "user"

RSpec.describe User, type: :model do
 
  describe "Validations"
  context "All fields are valid" do
    it "should save successfully" do
      @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

      expect(@user.valid?).to eq true
      expect(@user.id).to be_present
    end
  end

  context "Password and password confirmation dont match" do
    it "should return an error" do
      @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "book")

      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  context "Password and password confirmation are nil" do
    it "should return an error" do
      @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: nil, password_confirmation: nil)

      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
  end

  context "Emails must be unique and not case sensitive" do
    it "should return an error if email has been used" do
       @user1 = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

       @user2 = User.create(name: "Copy", last_name: "OfJohn", email: "test@TEST.com", password: "jungle", password_confirmation: "jungle")

       expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
  end
end
