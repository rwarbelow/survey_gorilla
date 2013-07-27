## Prompts user to type question, question type and number of response options
get '/survey/create/:survey_id/add_question' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey/add_question"
end

post '/survey/create/:survey_id/add_question' do
  @survey = Survey.find(params[:survey_id])
  @question = params[:question][:type].constantize.create(text: params[:question][:text], survey_id: @survey.id)
  @question.create_responses(params[:responses]) if @question.type == 'McRadio' || @question.type == 'McCheck'
  erb :"#{@question.partial}", layout: false, locals: {question: @question}
end

## Shows user his/her question and prompts for responses
get '/survey/:survey_id/question/:question_id' do
end

post '/survey/:survey_id/question/:question_id' do
end