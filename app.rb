$:.unshift File.dirname(__FILE__) 
require 'lib/gachi_record'
require 'lib/gachi_view'

require 'app/models/user'

GachiView.template_base_path = File.join( Dir.pwd, 'app', 'views' )

extend GachiView::Renderer

user = User.find 1
p user

print render "users/index.html.erb", { user: user }
