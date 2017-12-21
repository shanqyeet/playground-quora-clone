require 'byebug'

get '/' do
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

get '/user/:id' do
  @user = User.find(params[:id])
  erb :"static/user/home"
end

post '/logout' do
  session.clear
  rediret '/'

end
