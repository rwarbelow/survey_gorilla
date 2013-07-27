## Set up survey (title & description)
get '/survey/create' do
end

post '/survey/create' do
end

## Edit a survey
get '/survey/:survey_id/edit' do
end

post '/survey/:survey_id/edit' do
end

## Delete a survey
post 'survey/:survey_id/delete' do
end

## End a survey
post '/survey/:survey_id/end' do
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
  redirect to('/')
end

## View survey results
get '/survey/results/:survey_id' do
end

