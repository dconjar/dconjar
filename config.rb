###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

page "*", :layout => :post
page "/index.html", :layout => :two_columns
page "/feed.xml", :layout => false
page "/sitemap.xml", :layout => false

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Enable the official Middleman blogging extension
activate :blog do |blog|
  blog.paginate = true
  blog.page_link = "p:num"
  blog.per_page = 20
  blog.permalink = ":title/index.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
end

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# You can't have <code> without syntax highlighting!
activate :syntax, :line_numbers => false

# Automatically optimize images on build
# activate :imageoptim

# Use redcarpet for Markdown parsing and fenced code block goodness
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Uglify the htmls with middleman-minify-html
  activate :minify_html

  # Serve compressed files
  activate :gzip

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

require 'deploy'

activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = 'www.derekconjar.com'
  s3_sync.region                     = 'us-east-1'
  s3_sync.aws_access_key_id          = AWS_KEY_ID
  s3_sync.aws_secret_access_key      = AWS_SECRET
  s3_sync.delete                     = true
  s3_sync.after_build                = true
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
end

default_caching_policy max_age:(60 * 60 * 24 * 365)
caching_policy 'text/html', max_age: 0, must_revalidate: true

activate :cloudfront do |cf|
  cf.access_key_id      = AWS_KEY_ID
  cf.secret_access_key  = AWS_SECRET
  cf.distribution_id    = CF_DISTRIB
  # cf.filter = /\.html$/i  # default is /.*/
  # cf.after_build = false  # default is false
end