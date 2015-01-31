class MultipleChoiceQuestion < Question

  def option_counter
    options.inject({}) { |hash, option| hash.merge!({option.id => 0}) }.merge({'others' => 0})
  end

end
