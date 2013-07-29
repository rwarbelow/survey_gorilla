class NumSlider < Question
  def partial
    "question/_num_slider"
  end

  def create_vote(answer, email)
    response = Response.find_or_create_by_text_and_question_id(answer, self.id)
    response.votes.create(user_email: email)
  end

  def chart_data
    chart_data = {labels: [1,2,3,4,5,6,7,8,9,10], data: [0,0,0,0,0,0,0,0,0,0]}
    self.responses.each do |response|
      chart_data[:data][response.text.to_i - 1] += 1
    end
    chart_data
  end
end

