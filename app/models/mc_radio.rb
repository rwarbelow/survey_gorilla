class McRadio < Question

  def partial
    "question/_mc_radio"
  end

  def create_responses(response_array)
    response_array.each do |response|
      self.responses.create(text: response)
    end
  end

  def create_vote(answer, email)
    response = Response.find_by_text_and_question_id(answer, self.id)
    response.votes.create(user_email: email)
  end

  def chart_data
    chart_data = {labels: [], data: []}
    self.responses.each do |response|
      chart_data[:labels] << response.text
      chart_data[:data] << response.votes.count
    end
    chart_data
  end
end
