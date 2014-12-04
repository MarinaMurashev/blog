require 'rails_helper'

describe ContactForm do

  describe "#valid" do

    it "is invalid when it has no email" do
      expect(build(:contact_form, email: nil)).to_not be_valid
    end

    it "is invalid when it has no name" do
      expect(build(:contact_form, name: nil)).to_not be_valid
    end

    it "is invalid when it has no message" do
      expect(build(:contact_form, message: nil)).to_not be_valid
    end

    it "is invalid when email is not formatted correctly" do
      expect(build(:contact_form, email: "hello@d")).to_not be_valid
      expect(build(:contact_form, email: "hello.com")).to_not be_valid
      expect(build(:contact_form, email: "hello")).to_not be_valid
    end

    it "is invalid when nickname is not blank" do
      expect(build(:contact_form, nickname: "I am a bot").deliver).to be_falsey
    end
  end
end
