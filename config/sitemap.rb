require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://marinamurashev.com'
SitemapGenerator::Sitemap.create do
  add '/posts', changefreq: 'daily', priority: 0.9
  add '/about', changefreq: 'weekly'
  Post.find_each do |post|
    add post_path(post), lastmod: post.updated_at
  end
end
SitemapGenerator::Sitemap.ping_search_engines
