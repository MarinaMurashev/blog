class UpdateSlugForOldPosts < ActiveRecord::Migration
  class Post < ActiveRecord::Base
  end

  def up
    Post.find_each(&:save)
  end

  def down
    #irreversible
  end
end
