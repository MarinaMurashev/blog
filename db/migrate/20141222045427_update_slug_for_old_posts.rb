class Post < ActiveRecord::Base
end

class UpdateSlugForOldPosts < ActiveRecord::Migration
  def up
    Post.find_each(&:save)
  end

  def down
    #irreversible
  end
end
