## Sign up // create a new user
get '/register' do
end

post '/register' do
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

