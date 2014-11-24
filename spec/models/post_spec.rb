require 'rails_helper'

describe Post do
  describe "#valid" do
    it "has a non-empty title" do
      post = build :post, title: ""
      expect(post).to_not be_valid
    end

    it "has a non-empty body" do
      post = build :post, body: ""
      expect(post).to_not be_valid
    end

    it "has a unique title" do
      post1 = create :post, title: "test"
      expect(build :post, title: "test").to_not be_valid
    end

    it "has a unique body" do
      post1 = create :post, body: "test <!--- truncate --->"
      expect(build :post, body: "test <!--- truncate --->").to_not be_valid
    end

    it "is invalid when it doesn't contain '<!--- truncate --->'" do
      expect(build :post, body: "test").to_not be_valid
    end

    it "is valid when it contains '<!--- truncate --->'" do
      expect(build :post, body: "test <!--- truncate --->").to be_valid
    end
  end
end
