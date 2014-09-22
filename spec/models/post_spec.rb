require 'rails_helper'

describe Post do
  it "has a valid factory" do
    post = build :post
    expect(post).to be_valid
  end
end
