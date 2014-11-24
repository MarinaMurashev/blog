class Post < ActiveRecord::Base
  validates_presence_of :title, :body
  validates_uniqueness_of :title, :body
  validates_format_of :body, with: /<!--- truncate --->/,
    message: "Must contain a '<!--- truncate --->' in the post body."
end
