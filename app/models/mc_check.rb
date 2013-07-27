class McCheck < Question
  
  def partial
    "question/_mc_check"
  end

  def create_responses(response_array)
    response_array.each do |response|
      self.responses.create(text: response)
    end
  end

  def create_vote(answer)
    
  end

end
