# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################

# basic

require 'rubygems'

require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])

require 'pathname'

require 'pg'

require 'active_record'

require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

set :views, File.join(APP_ROOT, "views")


# p APP_ROOT
# require APP_ROOT.join('database')
require APP_ROOT.join('config', 'database')

# APP_NAME = APP_ROOT.basename.to_s

Dir[APP_ROOT.join('controllers', '*.rb')].each { |file| require file }