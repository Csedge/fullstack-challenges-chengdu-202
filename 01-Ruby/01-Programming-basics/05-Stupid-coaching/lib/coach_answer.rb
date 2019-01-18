def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.include? "?"
    "Silly question, get dressed and go to work!"
  elsif your_message == "I am going to work right now!"
    exit
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  if your_message == your_message.upcase
    "I can feel your motivation! " + coach_answer(your_message)
  elsif your_message == "I am going to work right now!"
    exit
  else
    coach_answer(your_message)
  end
end
