require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should check if all fields filled" do
      user = User.new(
        first_name: 'T',
        last_name: 'J',
        email: 'ttt@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
    expect(user.save).to be true
    end

    it "should check first name presence" do
      user = User.new(
        first_name: nil,
        last_name: 'J',
        email: 'ttt@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
    expect(user.save).to be true
    end

    it "should check last name presence" do
      user = User.new(last_name: nil)
      expect(user).to be_invalid
      user.valid?
    end
    
    it "should check email presence" do
      user = User.new(email: nil)
      expect(user).to be_invalid
      user.valid?
    end

    it "should check password name presence" do
      user = User.new(
        first_name: 'T',
        last_name: 'J',
        email: 'ttt@gmail.com',
        password: nil,
        password_confirmation: 'password'
      )
    expect(user).to be_invalid
    end

    it "should check if passwords match each other" do
      user = User.new(
        first_name: 'T',
        last_name: 'J',
        email: 'ttt@gmail.com',
        password: 'password',
        password_confirmation: 'Password'
      )
    user.valid?
    expect(user.errors[:password_confirmation]).to be_present
    end


  end
end
