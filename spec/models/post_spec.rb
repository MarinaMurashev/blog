require 'rails_helper'

describe Post do
  describe "#valid" do
    let(:truncate) { Post::PREVIEW_BREAK }

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
      post1 = create :post, body: "test #{truncate}"
      expect(build :post, body: "test #{truncate}").to_not be_valid
    end

    it "is invalid when it doesn't contain Post's PREVIEW_BREAK" do
      expect(build :post, body: "test").to_not be_valid
    end

    it "is valid when it contains Post's PREVIEW_BREAK" do
      expect(build :post, body: "test #{truncate}").to be_valid
    end

    it "is valid when it contains Post's PREVIEW_BREAK on a new line" do
      expect(build :post, body: "test \r\n\r\n#{truncate}").to be_valid
    end

    it "is invalid when it contains *only* Post's PREVIEW_BREAK" do
      expect(build :post, body: truncate).to_not be_valid
    end
  end
end
