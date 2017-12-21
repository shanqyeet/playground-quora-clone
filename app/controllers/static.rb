require 'byebug'
enable :sessions

get '/' do
  p session
  erb :"static/index"
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
  erb :"static/home"
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :"static/user/home"
end

post '/logout' do
  session.clear
  rediret '/'

end

get '/user/:id/questions' do

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


end

get '/questions/:id/edit' do

end

post '/questions/:id' do

end

post '/questions/:id/destory' do

end

get '/users/:id/answers' do

end

get '/asnwers/new' do

end

post '/questions/:id/answers' do

end

get '/answers/:id/edit' do

end

post '/answers/:id' do

end

post '/answers/:id/destroy' do

end

# - Day 2
#     - users can create questions
#     - create questions table
#     - home page shows all the questions in descending order of creation date
#     - Questions
#         - Suggested routes for questions
#             - GET '/users/:id/questions' (aka 'index' page)
#                 - shows a page with all the questions asked by a particular user
#             - GET '/questions/new' (aka 'new')
#                 - brings users to a form that allows users to type a question
#             - POST '/questions' (aka 'create')
#                 - the action of the 'new' form, handles the actual creation of the question in the database
#                 - redirects the user to the show page
#             - GET '/questions/:id' (aka 'show')
#                 - shows a particular question, including its answers below
#             - GET '/questions/:id/edit' (aka 'edit')
#                 - brings users to a form that allows users to edit a particular question
#                 - (only owner of the question can see this form)
#             - POST '/questions/:id' (aka 'update)
#                 - the action of the 'edit' form
#                 - code in this route will take user's input and updates the right record on the database
#                 - (only owner can update)
#                 - redirects the user to the show page to see result.
#             - POST '/questions/:id/destroy' (aka 'destroy')
#                 - deletes the question with the right id
#                 - (only owner can destroy)
#     - Answers
#         - Suggested routes:
#             - GET '/users/:id/answers'
#                 - shows a page with all the answers made by a user
#             - GET '/answers/new' NOT NEEDED
#                 - the answer form can be in the same page as the question 'show' page. No separate page needed for answering a question
#             - POST '/questions/:id/answers'
#                 - creates an answer with the right question_id and user_id
#                 - redirects the user to the question's show page
#             - GET '/answers/:id' NOT NEEDED
#                 - a show page to show a particular answer is not needed
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
