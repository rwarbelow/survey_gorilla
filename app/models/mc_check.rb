class McCheck < Question
  
  def partial
    "question/_mc_check"
  end

  def create_responses(response_array)
    response_array.each do |response|
      self.responses.create(text: response)
    end
  end

  def create_vote(answer, email)
    answer.each do |answer|
      response = Response.find_by_text_and_question_id(answer, self.id)
      response.votes.create(user_email: email)
    end
  end

end
