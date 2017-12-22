require 'byebug'
enable :sessions

get '/' do
  p session
  erb :"static/login"
end

post '/signup' do
  user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password])
  if user.save
    redirect '/login'
  else
    erb :"static/failure"
  end
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/user/#{@user.id}"
  else
    redirect '/failure'
  end
end

get '/home' do
  erb :"static/index"
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :"static/user/home"
end

post '/logout' do
  sign_out
  redirect '/'
end

get '/user/:id/questions' do
  @user = User.find(params[:id])
  erb :"static/user/questions"
end

get '/questions/new' do
  erb :"static/questions/new"
end

post '/questions' do
  question = Question.new(user_id: current_user.id, title: params[:title], description: params[:description])
  if question.save
    redirect '/home'
  else
    redirect '/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'static/questions/id'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"static/questions/edit"
end

post '/questions/:id' do
  @question = Question.find(params[:id])
  @question.title = params[:title]
  @question.description = params[:description]
  if @question.save
    redirect "/user/#{@question.user_id}/questions"
  else
    redirect '/questions/:id'
  end
end

get '/questions/:id/destroy' do
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect "/user/#{@question.user_id}/questions"
end


post '/questions/:id/answers' do
  @answer = Answer.new(user_id: current_user.id, question_id: params[:id], answer: params[:answer])
  if @answer.save
    redirect "/user/#{current_user.id}"
  else
    redirect "questions/#{@answer.question_id}"
  end
end

get '/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  erb :"static/answers/edit"
end

post '/answers/:id' do
  @answer = Answer.find(params[:id])
  @answer.answer = params[:answer]
  if @answer.save
    redirect "/user/#{@answer.user_id}"
  else
    redirect "/answers/#{@answer.id}/edit"
  end
end

get '/answers/:id/destroy' do
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/user/#{@answer.user_id}"
end




#     - Answers
#         - Suggested routes:
#
#             - GET '/answers/:id/edit' (edit)
#                 - gives an edit form for the *owner of the answer* to be able to edit the answer
#                 - only owner of the answer can see edit page
#             - POST '/answers/:id/' (update)
#                 - route for the edit form to submit
#                 - it should update the right answer row in the database
#                 - only owner of the answer can update
#             - POST '/answers/:id/destroy' (destroy)
#                 - route to delete answer from the database
#                 - only owner of the answer can
