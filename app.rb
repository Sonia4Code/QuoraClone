# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

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

APP_ROOT = Pathname.new(File.expand_path('../', __FILE__))

require APP_ROOT.join('config', 'database')


# GO TO HOMEPAGE
get '/' do
  @questions = Question.all
  p @questions 
  "Welcome to Quora"

 erb :"home"

end

 #GO TO NEW QUESTION PAGE
get '/questions/new' do						
  @questions = Question.all
  p @questions 

 erb :"questions/new"

end

#FORM THAT SUBMITS DATA TO THE DATABASE
post '/questions' do
	p params
	q1 = Question.new(question: params[:question])
	q1.save 

	# erb :"index"

 end


 #PAGE THAT SHOWS SPECIFIC QUESTIONS BY ID
get "/questions/:id" do
 
  @question = Question.find(params[:id])

  erb :"questions/show"

end	


#goes to index page --> works
# get '/questions/index' do
#   @questions = Question.all
#   p @questions 

#  erb :"questions/index"

# end





 


