Sitemap::Generator.instance.load :host => "http://www.marinamurashev.com" do
  path :root, priority: 1
  path :about, priority: 0.5
  resources :posts
end
