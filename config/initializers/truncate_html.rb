TruncateHtml.configure do |config|
  config.length = 100000000
  config.omission = '...(continued)'
  config.break_token = '<!--- truncate --->'
end
