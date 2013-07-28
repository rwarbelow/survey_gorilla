get '/' do
  # @new_surveys = Survey.order('created_at DESC').limit(20)
  # @popular_surveys = Survey.order('participant_count DESC').limit(20)
  erb :index
end
