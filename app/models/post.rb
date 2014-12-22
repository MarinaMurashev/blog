class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  PREVIEW_BREAK = "<!--- truncate --->"

  validates_presence_of :title, :body
  validates_uniqueness_of :title, :body
  validates :body, format: { with: /.+#{PREVIEW_BREAK}/m,
    message: "must contain the truncation indicator #{PREVIEW_BREAK} following some text" }

end
