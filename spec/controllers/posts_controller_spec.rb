require 'rails_helper'

describe PostsController do
  describe "GET#show" do
    context "valid post id param" do
      let(:post) { create :post, id: 123 }

      it "sets @post to the correct post" do
        get :show, id: post.id
        expect(assigns :post).to eq post
      end
    end

    context "invalid post id param" do
      it "redirects to index page" do
        get :show, id: 456
        expect(response).to redirect_to(posts_path)
      end
    end
  end

  describe "GET#index" do
    it "sets @posts to all of the existing posts" do
      post_1 = create :post
      post_2 = create :post
      get :index
      expect(assigns :posts).to match_array [post_1, post_2]
    end

  end

  describe "POST#create" do
    context "as signed in user" do
      let(:user) { create :user }
      before { sign_in user }

      it "creates a new post" do
        expect {
           post :create, post: attributes_for(:post)
         }.to change(Post, :count).by(1)
      end
    end

    context "as non signed in user" do
      it "does not create a new post" do
        expect {
           post :create, post: attributes_for(:post)
         }.to_not change(Post, :count)
      end
    end

  end

end
