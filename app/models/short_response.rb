class ShortResponse < Question
  def partial
    "question/_short"
  end

  def create_vote(answer, email)
    response = self.responses.create(text: answer)
    response.votes.create(user_email: email)
  end
end
