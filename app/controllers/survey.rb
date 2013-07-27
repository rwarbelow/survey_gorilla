## Set up survey (title & description)
get '/survey/create' do
  erb :new_survey
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
end

## View survey results
get '/survey/results/:survey_id' do
end

