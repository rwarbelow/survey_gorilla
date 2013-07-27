class McRadio < Question

  def partial
    "question/_mc_radio"
  end

  def create_responses(response_array)
    response_array.each do |response|
      self.responses.create(text: response)
    end
  end

end
