get '/' do
  if session[:completed]
    @alert = "Thanks for participating!"
    session[:completed] = false
  end
  @new_surveys = Survey.order('created_at DESC').limit(5)
  @popular_surveys = Survey.order('participant_count DESC').limit(5)
  erb :index
end
