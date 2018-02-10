# ANSWER_CONTROLLER

# SHOWS FORM TO REPLY TO ANSWER
# get '/questions/:id/reply' do
#   @id = params[:id]
#   @question = Question.find(params[:id])

#  erb :"answers/reply"

# end


# SAVES REPLY
post '/answers' do
  p params
  a1 = Answer.new(answer: params[:answer])
  a1.save 

  redirect to("/answers")

 end
