class TextArea < Question
  def partial
    "question/_text_area"
  end

  def create_vote(answer, email)
    response = self.responses.create(text: answer)
    response.votes.create(user_email: email)
  end
end
