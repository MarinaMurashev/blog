module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end
end
