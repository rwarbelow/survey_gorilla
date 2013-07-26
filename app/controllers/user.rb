## Sign up // create a new user
get '/register' do
  erb :'user/register'
end

post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/profile/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'user/register'
  end

end

## User Dashboard page
get '/profile/:profile_id' do
  if current_user.id == params[:profile_id]
    erb :'user/dashboard.erb'
  else
    redirect '/' #change to 404 error, add 404 get to session
  end
end

## Edit user information
get '/profile/:profile_id/edit' do
end

post '/profile/:profile_id/edit' do
end


## Delete your account
get '/profile/:profile_id/delete' do
end

post '/profile/:profile_id/delete' do
end

