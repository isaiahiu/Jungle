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

  context "email, first name and last name should be required" do
    it "should return error message without" do
         @user = User.create(name: nil, last_name: nil, email: nil, password: 'jungle', password_confirmation: 'jungle')

      expect(@user.valid?).to eq false
      expect(@user.errors.full_messages).to include "Email can't be blank", "Name can't be blank", "Last name can't be blank"
    end
  end

  context "password must have minimum 3 length" do
    it "should return with error message if password is too short" do
      @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "ju", password_confirmation: "ju")

      expect(@user.errors.full_messages).to include "Password is too short (minimum is 3 characters)"
    end
  end

  describe '.authenticate_with_credentials' do 
    context 'given a valid email and password' do
      it 'should return user object' do
       @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

       expect(User.authenticate_with_credentials(@user.email, @user.password)).to be_a User
      end
    end

    context 'given invalid credentials' do
      it 'should nil' do
        @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

        expect(User.authenticate_with_credentials("wrongemail@test.com", @user.password)).to be_nil
      end
    end

    context "given an email that starts or ends in whitespaces" do
      it "should return user object if credentials match otherwise" do
        @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

          expect(User.authenticate_with_credentials(" test@test.com ", @user.password)).to be_a User
      end
    end

    context 'given an email with the wrong case' do
      it "should return user object if credentials match otherwise" do
        @user = User.create(name: "John", last_name: "Smith", email: "test@test.com", password: "jungle", password_confirmation: "jungle")

          expect(User.authenticate_with_credentials("tEsT@TEST.com", @user.password)).to be_a User
      end
    end
  end
end
