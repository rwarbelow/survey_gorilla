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
    response.votes.create(user_name: email)
  end
  
end
