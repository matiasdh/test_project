require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }

    it { should validate_length_of(:password).is_at_least(6) }

    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:session_token) }

    it {
      should allow_value('test@†est.com', 'emaildeprueba@gmail.com').
        for(:email)
    }

    it {
      should_not allow_value('test@†est', 'emaildeprueba.com').
        for(:email)
    }
  end

  context 'password' do
    it 'should not update a users password if it is not changed' do
      user = create :user
      encrypted_password = user.encrypted_password
      user.save!
      user.reload
      expect(user.encrypted_password).to eq encrypted_password
    end

    it "should update the encrypted password if the password change" do
      user = create :user
      encrypted_password = user.encrypted_password
      user.password = 'new_password'
      user.save
      expect(user.encrypted_password).not_to eq encrypted_password
    end

    it "should be the same password after encrypt" do
      user = create :user, password: 'test_password'
      expect(user.is_same_password?('test_password')).to be true
    end
  end
end