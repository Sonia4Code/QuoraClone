# Specify gemfile Location and general variables

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

puts ENV['BUNDLE_GEMFILE']

# Perform requiring gem that we need

######################################################################


#QUESTIONS CONTROLLERS
# GO TO HOMEPAGE
get '/' do
  @questions = Question.all
  p @questions 
  "Welcome to Quora"

 erb :"home"

end

#GET ALL QUESTIONS
get '/questions' do
  @questions = Question.all
  p @questions 

 erb :"questions/questions"

end

 #SHOWS FORM TO CREATE A Q
get '/questions/new' do           
  @questions = Question.all
  p @questions 

 erb :"questions/new"

end

#FIND OUT ABOUT NAMING FOR CLARITY 

 #GET A SPECIFIC QUESTION
get "/questions/:id" do
 
  @question = Question.find(params[:id])

  erb :"questions/show"

end 

#STORES AND SUBMITS
post '/questions' do
	p params
	q1 = Question.new(question: params[:question])
	q1.save 

	# erb :"index"

 end

#SHOW FORM TO EDIT Q
get '/questions/:id/edit' do
  @id = params[:id]
  @question = Question.find(params[:id])

  erb :"questions/edit"
end


# #STORES UPDATES
patch '/questions/:id' do
  @id = params[:id]
  @question = Question.find(params[:id])
  @question.question = params[:question]
  @question.save 
  # @question.update(params[:question])

  redirect to("/questions/#{params[:id]}")

  # erb :"home"

end


#DELETE  --> works
delete '/questions/:id' do
  @id = params[:id]
  @question = Question.delete(params[:id])

  erb :"home"

  # "Your question has been deleted"

end
