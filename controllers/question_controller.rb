#QUESTIONS_CONTROLLER
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
  q1 = Question.new(question: params[:title])
  q1.save 

  redirect to("/questions")

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
  @question.question = params[:title]
  @question.save 
  # @question.update(params[:question])

  redirect to("/questions/#{params[:id]}")

end


#DELETE  --> works
delete '/questions/:id' do
  @id = params[:id]
  @question = Question.delete(params[:id])

  redirect to("/questions")

end


#SHOWS FORM TO REPLY TO ANSWER
# get 'questions/reply' do           
#   @questions = Question.all
#   p @questions 

#  erb :"questions/reply"

# end








 


