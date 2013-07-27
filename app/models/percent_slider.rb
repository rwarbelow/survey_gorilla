class PercentSlider < Question
  def partial
    "question/_percent_slider"
  end

  def create_vote(answer, email)
    response = Response.find_or_create_by_text_and_question_id(answer, self.id)
    response.votes.create(user_email: email)
  end
end