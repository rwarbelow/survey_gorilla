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

## Edit user information
get '/profile/:profile_id/edit' do
  if current_user.id.to_i == params[:profile_id].to_i
    erb :'user/edit_profile'
  else
    redirect '/' #change to 404 error, add 404 get to session
  end
end

post '/profile/:profile_id/edit' do
  current_user.edit_attributes(params[:user])
  redirect "/profile/#{current_user.id}"
end


## Delete your account
get '/profile/:profile_id/delete' do
    if current_user.id.to_i == params[:profile_id].to_i
    erb :'user/confirm_delete'
    else
    redirect '/' #change to 404 error, add 404 get to session
  end
end

post '/profile/:profile_id/delete' do
  current_user.destroy
  session[:id] = nil
  redirect '/'
end

## User Dashboard page
get '/profile/:profile_id' do
  if current_user.id.to_i == params[:profile_id].to_i
    erb :'user/dashboard'
  else
    redirect '/' #change to 404 error, add 404 get to session
  end
end

