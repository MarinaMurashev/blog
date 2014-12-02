class Post < ActiveRecord::Base

  PREVIEW_BREAK = "<!--- truncate --->"

  validates_presence_of :title, :body
  validates_uniqueness_of :title, :body
  validates :body, format: { with: /.+#{PREVIEW_BREAK}/m,
    message: "must contain the truncation indicator #{PREVIEW_BREAK} following some text" }

end
