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

page "*", :layout => :two_columns
page "/feed.xml", :layout => false

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
  blog.permalink = ":title/"
  blog.sources = "posts/:year-:month-:day-:title.html"
end

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# You can't have <code> without syntax highlighting!
activate :syntax

# Methods defined in the helpers block are available in templates
helpers do
  def permalink_helper
    "http://derekconjar.com/" + current_page.path.gsub("index.html", "")
  end

  def highlight_helper(language=nil, container_width=nil, &block)
    if container_width.is_a?(Numeric)
      concat_content "<style> .highlight { width: #{container_width}px; }</style>"
    end
    
    concat_content '<div class="highlight-container">'
    concat_content '<small class="highlight-language">'+language+'</small>'
    code(language, &block)
    concat_content '</div>'
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end