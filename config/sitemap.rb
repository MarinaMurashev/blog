require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.marinamurashev.com'
SitemapGenerator::Sitemap.create do
  add '/posts', changefreq: 'always', priority: 0.5
  add '/about', changefreq: 'always', priority: 0.4
  Post.find_each do |post|
    add "/posts/#{post.id}", lastmod: post.updated_at, priority: 0.9
  end
end
SitemapGenerator::Sitemap.ping_search_engines
