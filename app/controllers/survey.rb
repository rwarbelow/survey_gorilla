## Set up survey (title & description)
post '/survey/create' do
  @survey = Survey.new(title: params[:title], description: params[:description], creator_id: current_user.id)
  if @survey.save
    redirect "/survey/create/#{@survey.id}/add_question"
  else
    @errors = @survey.errors.full_messages
    erb :'user/dashboard'
  end
end

## Respond to a survey
get '/survey/respond/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/survey"
end

post '/survey/respond/:survey_id' do
  params[:survey].each do |question_id, answer|
    question = Question.find(question_id)
    question.create_vote(answer, params[:email])
  end
  Survey.find(params[:survey_id]).add_count
  session[:submitted] = true
  redirect to('/')
end

## View survey results
get '/survey/results/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/survey_results"
end

