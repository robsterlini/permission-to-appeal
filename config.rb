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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

### t
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Requires
require 'builder'

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
String.class_eval do
  def to_slug
    value = self.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').to_s
    value.gsub!(/[']+/, '')
    value.gsub!(/\W+/, ' ')
    value.strip!
    value.downcase!
    value.gsub!(' ', '-')
    value
  end
end

# Set directories
set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/images'
set :content_dir, '../../content' # This is the content directory relative to the images_dir
set :sounds_dir, 'assets/sounds'

# Set base URLs
set :url_root, 'https://permissiontoappeal.co.uk'
set :url_base, 'permissiontoappeal.co.uk'

# Set some defaults
set :default_description, 'Permission to appeal'
set :default_title, 'Permission to appeal'
set :default_title_suffix, '• Permission to Appeal'
set :default_site_title, 'Permission to Appeal'
set :default_posts, '5'

# Set some sharing credentials
set :twitter_username, 'robsterlini'

# Create pages
# data.pages.pages.each do |p|
#   if p[:template]
#     proxy "#{p[:slug]}", "/templates/#{p[:template]}.html", :locals => {:page => p}
#   end
# end

# Use relative URLs
activate :relative_assets

# Turn on Pretty URLs
activate :directory_indexes

# Autoprefix this badboy
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
end


# Turn on sitemap
activate :search_engine_sitemap

# disable layout
page ".htaccess.apache", :layout => false
ignore "/templates/*"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Minify HTML
  # activate :minify_html, remove_http_protocol: false

  # Enable cache buster
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
