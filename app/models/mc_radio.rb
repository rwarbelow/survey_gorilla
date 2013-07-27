class McRadio < Question

  def partial
    "question/_mc_radio"
  end

  def create_responses(response_array)
    response_array.each do |response|
      self.responses.create(text: response)
    end
  end

  # def count_votes_per_response
  #   num_responses = self.responses.count
  #   vote_count = []
  #   (0..num_responses-1).each do |num|
  #     vote_count << self.responses[num].votes.count
  #   end
  #   vote_count
  # end

  # def text_of_responses
  #   num_responses = self.responses.count
  #   response_text = []
  #   (0..num_responses-1).each do |num|
  #     response_text << self.responses[num].text
  #   end
  #   response_text
  # end


end
