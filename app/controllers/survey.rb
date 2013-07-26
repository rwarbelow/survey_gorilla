## Set up survey (title & description)
get '/survey/create' do
end

post '/survey/create' do
end

## Prompts user to type question, question type and number of response options
get '/survey/create/:survey_id' do 
end

post '/survey/create/:survey_id' do
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
end

post '/survey/respond/:survey_id' do
end

## View survey results
get '/survey/results/:survey_id' do
end

