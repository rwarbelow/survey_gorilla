## Prompts user to type question, question type and number of response options
get '/survey/create/:survey_id/add_question' do


end

post '/survey/create/:survey_id/add_question' do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.create(params[:question])
  Response.create_from_params(params[:responses], @question.id)
  redirect to("/survey/create/#{@survey.id}/add_question")
end

## Shows user his/her question and prompts for responses
get '/survey/:survey_id/question/:question_id' do
end

post '/survey/:survey_id/question/:question_id' do
end
