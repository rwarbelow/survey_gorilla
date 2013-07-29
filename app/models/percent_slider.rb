class PercentSlider < Question
  def partial
    "question/_percent_slider"
  end

  def create_vote(answer, email)
    response = Response.find_or_create_by_text_and_question_id(answer, self.id)
    response.votes.create(user_email: email)
  end

  def chart_data
    numbers = Array.new(100){|i| i + 1}
    counts = Array.new(100, 0)
    chart_data = {labels: numbers, data: counts}
    self.responses.each do |response|
      chart_data[:data][response.text.to_i - 1] += 1
    end
    chart_data
  end
end