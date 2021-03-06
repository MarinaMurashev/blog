require 'rails_helper'

describe PostsController do

  describe "GET#show" do
    context "valid post id param" do
      let(:post) { create :post, id: 123, title: "title" }

      it "sets @post to the correct post when the id is provided" do
        get :show, id: post.id
        expect(assigns :post).to eq post
      end

      it "sets @post to the correct post when the title is provided" do
        get :show, id: post.title
        expect(assigns :post).to eq post
      end
    end

    context "invalid post id param" do
      it "redirects to index page when id is provided" do
        get :show, id: 456
        expect(response).to redirect_to(posts_path)
      end

      it "redirects to index page when title is provided" do
        get :show, id: "wrong-title"
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

    it "sorts @posts by create date descending" do
      post_1 = create :post, created_at: Time.current - 2.day
      post_2 = create :post, created_at: Time.current - 3.day
      post_3 = create :post, created_at: Time.current
      get :index
      expect(assigns :posts).to eq [post_3, post_1, post_2]
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

  describe "GET#new" do
    context "as non signed in user" do
      it "redirects" do
        get :new
        expect(response).to be_redirect
      end
    end
  end

  describe "PUT#update" do
    let(:truncate) { Post::PREVIEW_BREAK }
    let!(:post) { create :post, id: 123, title: "a title", body: "a body #{truncate}" }

    context "as signed in user" do
      let(:user) { create :user }
      before { sign_in user }

      it "can update post title" do
        put :update, id: 123, post: { title: "another title" }
        expect(post.reload.title).to eq "another title"
      end

      it "can update post body" do
        put :update, id: 123, post: { body: "another body #{truncate}" }
        expect(post.reload.body).to eq "another body #{truncate}"
      end

      it "can update post body when title is provided as id" do
        put :update, id: "a-title", post: { body: "another body #{truncate}" }
        expect(post.reload.body).to eq "another body #{truncate}"
      end

      it "redirects to post show page when update was successful" do
        put :update, id: 123, post: { body: "another body #{truncate}" }
        expect(response).to redirect_to(post_path "a-title")
      end
    end

    context "as non signed in user" do
      it "does not update" do
        put :update, id: 123, post: { title: "antoher title", body: "another body #{truncate}" }
        expect(post.reload.title).to eq "a title"
        expect(post.reload.body).to eq "a body #{truncate}"
      end
    end
  end

  describe "GET#edit" do
    let(:post) { create :post, id: 123, title: "title" }

    context "as signed in user" do
      let(:user) { create :user }
      before { sign_in user }

      it "sets @post to the correct post when id is provided" do
        get :edit, id: post.id
        expect(assigns :post).to eq post
      end

      it "sets @post to the correct post when title is provided" do
        get :edit, id: post.title
        expect(assigns :post).to eq post
      end

      it "redirects to posts path when provided post id is invalid" do
        get :edit, id: 456
        expect(response).to redirect_to posts_path
      end

      it "redirects to posts path when provided post title is invalid" do
        get :edit, id: "wrong-title"
        expect(response).to redirect_to posts_path
      end
    end

    context "as non signed in user" do
      it "redirects" do
        get :edit, id: post.id
        expect(response).to be_redirect
      end
    end
  end

  describe "DELETE#destroy" do
    before { @post = create :post, title: "title" }

    context "as signed in user" do
      before { sign_in(create :user) }

      it "deletes specified post when its id is provided" do
        delete :destroy, id: @post.id
        expect(Post.where(id: @post.id)).to be_empty
      end

      it "deletes specified post when its title is provided" do
        delete :destroy, id: @post.title
        expect(Post.where(id: @post.id)).to be_empty
      end

      it "redirects to posts path when its id is provided" do
        delete :destroy, id: @post.id
        expect(response).to redirect_to posts_path
      end

      it "redirects to posts path when its title is provided" do
        delete :destroy, id: @post.title
        expect(response).to redirect_to posts_path
      end
    end

    context "as non signed in user" do
      it "does not delete post" do
        expect { delete :destroy, id: @post.id }.not_to change(Post, :count)
      end
    end
  end

end
