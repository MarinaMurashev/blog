require 'rails_helper'

describe SitemapsController do
  describe "GET#index" do
    it "sets the posts instance variable to include all posts" do
      post1 = create :post
      post2 = create :post
      get :index, format: 'xml'
      expect(assigns :posts).to match_array [post1, post2]
    end
  end
end
