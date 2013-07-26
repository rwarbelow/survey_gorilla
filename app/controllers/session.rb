## Sign in
get '/login' do
end

post '/login' do
end

## Log out
post '/logout' do
  session[:id] = nil 
end 
