## Sign in
get '/login' do
  erb :"user/login"
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    @errors = ["Username and password do not exist."]
    erb :"user/login"
  end
end

## Log out
post '/logout' do
  session[:id] = nil 
  redirect '/'
end 
