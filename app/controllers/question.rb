## Prompts user to type question, question type and number of response options
get '/question/:question_id/edit' do

end

get '/survey/create/:survey_id/add_question' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/add_question"
end

get '/question/:question_id/chart' do
  @question = Question.find(params[:question_id])
  chart_data = @question.chart_data
  content_type :json
  chart_data.to_json
end

post '/survey/create/:survey_id/add_question' do
  @survey = Survey.find(params[:survey_id])
  @question = params[:question][:type].constantize.create(text: params[:question][:text], survey_id: @survey.id)
  @question.create_responses(params[:responses]) if @question.type == 'McRadio' || @question.type == 'McCheck'
  erb :"#{@question.partial}", layout: false, locals: {question: @question}
end

post '/question/:question_id/edit' do
  
end

post '/question/:question_id/delete' do
  @question = Question.find(params[:question_id])
  @question.destroy
  redirect to("/survey/create/#{@question.survey.id}/add_question")
end
