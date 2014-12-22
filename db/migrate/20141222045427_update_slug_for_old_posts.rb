class UpdateSlugForOldPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    Post.all.each do |post|
      post.slug = post.title.parameterize
      post.save
    end
  end

  def down
    #irreversible
  end
end
